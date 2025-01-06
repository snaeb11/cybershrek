<?php
require 'config/db_connection.php';
require_once __DIR__ . '/vendor/autoload.php';

session_start();

// Enable error logging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Start output buffering to capture unwanted output
ob_start();

header('Content-Type: application/json');

// Load environment variables
$envFile = '.env';
$envVariables = [];
if (file_exists($envFile)) {
    $envContents = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($envContents as $line) {
        if (strpos($line, '=') !== false) {
            list($key, $value) = explode('=', $line, 2);
            $envVariables[$key] = trim($value);
        }
    }
}

$key = $envVariables['ENCRYPTION_KEY'] ?? null;

// Ensure the encryption key is set
if (!$key) {
    echo json_encode(['success' => false, 'message' => 'Encryption key is not set in the .env file.']);
    exit;
}

// Debug logging function
function debug_log($message, $data = null) {
    $log = date('Y-m-d H:i:s') . " - " . $message;
    if ($data !== null) {
        $log .= " - Data: " . print_r($data, true);
    }
    error_log($log);
}

// Sanitize user input
function sanitizeInput($input) {
    return htmlspecialchars(strip_tags(trim($input)), ENT_QUOTES, 'UTF-8');
}

// Decrypt the password
function decryptPassword($encryptedPassword) {
    global $key;
    try {
        $decodedPassword = base64_decode($encryptedPassword);
        return \Dcrypt\Aes::decrypt($decodedPassword, $key);
    } catch (Exception $e) {
        debug_log("Decryption error", ['error' => $e->getMessage()]);
        return false;
    }
}

// Authenticate the user
function authenticateUser($email, $password) {
    global $conn;
    debug_log("Attempting authentication", ['email' => $email]);

    try {
        // Prepare the SQL statement to get all accounts
        $stmt = $conn->prepare("SELECT * FROM accounts");

        if (!$stmt) {
            throw new Exception("Prepare failed: " . $conn->error);
        }

        // Execute the query
        if (!$stmt->execute()) {
            throw new Exception("Execute failed: " . $stmt->error);
        }

        $result = $stmt->get_result();
        debug_log("Query executed", ['rows_found' => $result->num_rows]);

        // Loop through all records to compare the email
        while ($user = $result->fetch_assoc()) {
            // Decrypt the email from the database
            $decryptedEmail = decryptPassword($user['email']);  // Decrypt the email from the database

            if ($decryptedEmail === false) {
                throw new Exception("Decryption failed for email");
            }

            // Debugging: Log decrypted email
            debug_log("Decrypted Email from DB: ", ['decryptedEmail' => $decryptedEmail]);

            // Compare the decrypted email with the user-input email
            if ($email === $decryptedEmail) {
                // Decrypt the password and other fields
                $decryptedPassword = decryptPassword($user['pass']);
                $decryptedFirstName = decryptPassword($user['firstName']);
                $decryptedLastName = decryptPassword($user['lastName']);

                if ($decryptedPassword === false || $decryptedFirstName === false || $decryptedLastName === false) {
                    throw new Exception("Decryption failed for other fields");
                }

                // Debugging: Log decrypted password and input password
                debug_log("Decrypted Password: ", ['decryptedPassword' => $decryptedPassword]);
                debug_log("Input Password: ", ['password' => $password]);

                // Strip any extra spaces before comparison
                $password = trim($password);
                $decryptedPassword = trim($decryptedPassword);

                // Compare the user input password and the decrypted password
                if ($password === $decryptedPassword) {
                    debug_log("Password and Email matched", ['userId' => $user['userId']]);

                    // Store decrypted data in session
                    $_SESSION['user'] = [
                        'userId' => $user['userId'],
                        'firstName' => $decryptedFirstName,
                        'lastName' => $decryptedLastName,
                        'email' => $decryptedEmail,
                        'permissions' => explode(',', $user['permission'])
                    ];

                    $_SESSION['user_email'] = $decryptedEmail;
                    $_SESSION['fName'] = $decryptedFirstName;
                    $_SESSION['lName'] = $decryptedLastName;

                    // Send email notification
                    sendEmail($_SESSION['user_email'], $_SESSION['fName'], $_SESSION['lName']);

                    return [
                        'success' => true,
                        'message' => 'Login successful!',
                        'email' => $decryptedEmail,
                        'userId' => $user['userId']
                    ];
                } else {
                    debug_log("Password mismatch");
                }
            } else {
                debug_log("Email mismatch");
            }
        }

        return ['success' => false, 'message' => 'Invalid email or password!'];
    } catch (Exception $e) {
        debug_log("Authentication error", ['error' => $e->getMessage()]);
        return ['success' => false, 'message' => 'An error occurred during authentication: ' . $e->getMessage()];
    } finally {
        if (isset($stmt)) {
            $stmt->close();
        }
    }
}


try {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        debug_log("Login attempt started");

        $email = isset($_POST['email']) ? sanitizeInput($_POST['email']) : '';
        $password = isset($_POST['password']) ? sanitizeInput($_POST['password']) : '';

        debug_log("Received credentials", ['email' => $email, 'password' => $password]);

        $authResult = authenticateUser($email, $password);
        debug_log("Authentication result", $authResult);

        if ($authResult['success'] && function_exists('insertUserActivityLog')) {
            $logResult = insertUserActivityLog($email, "Login");
            debug_log("Activity log result", ['success' => $logResult]);
        }

        while (ob_get_level()) {
            ob_end_clean();
        }

        header('Content-Type: application/json');
        $jsonResponse = json_encode($authResult);

        if ($jsonResponse === false) {
            debug_log("JSON encode error", ['error' => json_last_error_msg()]);
            echo json_encode([
                'success' => false,
                'message' => 'JSON encoding error: ' . json_last_error_msg()
            ]);
        } else {
            debug_log("Sending response", $authResult);
            echo $jsonResponse;
        }
    } else {
        throw new Exception('Invalid request method');
    }
} catch (Exception $e) {
    debug_log("Error in login process", ['error' => $e->getMessage()]);

    while (ob_get_level()) {
        ob_end_clean();
    }

    header('Content-Type: application/json');
    echo json_encode([
        'success' => false,
        'message' => 'An error occurred: ' . $e->getMessage()
    ]);
}

$remainingOutput = ob_get_clean();
if (!empty($remainingOutput)) {
    debug_log("Unwanted output captured", ['output' => $remainingOutput]);
}

function insertUserActivityLog($username, $activity) {
    global $conn;

    try {
        date_default_timezone_set("Asia/Manila");

        $date = date("F d, Y");
        $time = date("H:i");

        $stmt = $conn->prepare("INSERT INTO logs (email, activity_log, date, time) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $username, $activity, $date, $time);

        if ($stmt->execute()) {
            return ['success' => true, 'message' => 'Activity log inserted successfully!'];
        } else {
            return ['success' => false, 'message' => 'Error inserting activity log: ' . $stmt->error];
        }
    } catch (Exception $e) {
        return ['success' => false, 'message' => 'Error: ' . $e->getMessage()];
    }
}

function sendEmail($email, $firstName, $lastName) {
    $verificationCode = rand(100000, 999999);
    $_SESSION['verification_code'] = $verificationCode;

    $command = escapeshellcmd("php send_email.php \"$email\" \"$firstName\" \"$lastName\" \"$verificationCode\" 2>&1");
    exec($command);

    return ['success' => true, 'message' => 'Email is being sent in the background.'];
}

$conn->close();
?>
