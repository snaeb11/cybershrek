<?php
require 'config/db_connection.php';
require_once __DIR__ . '/vendor/autoload.php';

session_start();
// Enable error logging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Start output buffering to capture any unwanted output
ob_start();

header('Content-Type: application/json');

// Load environment variables
$envFile = '.env';
$envContents = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
$envVariables = [];
foreach ($envContents as $line) {
    if (strpos($line, '=') !== false) {
        list($key, $value) = explode('=', $line, 2);
        $envVariables[$key] = trim($value);
    }
}

$key = $envVariables['ENCRYPTION_KEY'] ?? null;

// Ensure the key is set
if (!$key) {
    echo json_encode(['success' => false, 'message' => 'Encryption key is not set in the .env file.']);
    exit;
}

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

// Function to decrypt the password
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

// Function to authenticate the user
function authenticateUser($email, $password) {
    global $conn;
    debug_log("Attempting authentication", ['email' => $email]);

    try {
        // Special case for admin email
        if ($email === 'admin@gmail.com') {
            debug_log("Admin login bypass", ['email' => $email]);

            // Set admin session details
            $_SESSION['user'] = [
                'userId' => 1, 
                'firstName' => 'Admin',
                'lastName' => 'Admin',
                'email' => $email,
                'permissions' => ['all'] 
            ];

            $_SESSION['user_email'] = $email;
            $_SESSION['fName'] = 'Admin';
            $_SESSION['lName'] = 'Admin';

            echo json_encode([
                'success' => true,
                'message' => 'Admin login successful',
                'userId' => 1, 
                'redirect' => 'inventory.php'
            ]);
            exit();
        }

        $stmt = $conn->prepare("SELECT * FROM accounts WHERE email = ?");
        if (!$stmt) {
            throw new Exception("Prepare failed: " . $conn->error);
        }
        
        $stmt->bind_param("s", $email);
        if (!$stmt->execute()) {
            throw new Exception("Execute failed: " . $stmt->error);
        }
        
        $result = $stmt->get_result();
        debug_log("Query executed", ['rows_found' => $result->num_rows]);

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            
            $decryptedPassword = decryptPassword($user['pass']);
            if ($decryptedPassword === false) {
                throw new Exception("Password decryption failed");
            }

            if ($password === $decryptedPassword) {
                debug_log("Password matched", ['userId' => $user['userId']]);
                
                // Store user data in session
                $_SESSION['user'] = [
                    'userId' => $user['userId'],
                    'firstName' => $user['firstName'],
                    'lastName' => $user['lastName'],
                    'email' => $user['email'],
                    'permissions' => explode(',', $user['permission'])
                ];

                // Store email, firstname, and lastname separately for easy access
                $_SESSION['user_email'] = $user['email'];
                $_SESSION['fName'] = $user['firstName'];
                $_SESSION['lName'] = $user['lastName'];

                // Send email to the user's email address
                sendEmail($_SESSION['user_email'], $_SESSION['fName'], $_SESSION['lName']);  

                return [
                    'success' => true,
                    'message' => 'Login successful!',
                    'email' => $user['email'],
                    'userId' => $user['userId']
                ];
            }
            debug_log("Password mismatch");
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
        
        debug_log("Received credentials", ['email' => $email]);

        // Call the authenticateUser function
        $authResult = authenticateUser($email, $password);
        debug_log("Authentication result", $authResult);

        if ($authResult['success']) {
            if (function_exists('insertUserActivityLog')) {
                $activity = "Login";
                $logResult = insertUserActivityLog($email, $activity);
                debug_log("Activity log result", ['success' => $logResult]);
            }
        }

        // Clean any output buffers
        while (ob_get_level()) {
            ob_end_clean();
        }

        // Ensure we're only sending the JSON response
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
    
    // Clean any output buffers
    while (ob_get_level()) {
        ob_end_clean();
    }
    
    header('Content-Type: application/json');
    echo json_encode([
        'success' => false,
        'message' => 'An error occurred: ' . $e->getMessage()
    ]);
}

// Log any remaining output buffer content
$remainingOutput = ob_get_clean();
if (!empty($remainingOutput)) {
    debug_log("Unwanted output captured", ['output' => $remainingOutput]);
}

function insertUserActivityLog($username, $activity) {
    global $conn;

    try {
        // Get the current date and time
        $date = date("F d, Y"); // Format: Month Day, Year (e.g., October 28, 2024)
        $time = date("H:i");    // Format: HH:MM (24-hour format)

        // Prepare the query to insert the activity log
        $stmt = $conn->prepare("INSERT INTO logs (email, activity_log, date, time) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $username, $activity, $date, $time);

        // Execute the query
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
    // Generate a random 2FA verification code
    $verificationCode = rand(100000, 999999);

    // Store the verification code in the session
    $_SESSION['verification_code'] = $verificationCode;

    // Command to run send_email.php in the background using exec()
    $command = "php send_email.php $email $firstName $lastName $verificationCode 2>&1";
    exec($command);

    return ['success' => true, 'message' => 'Email is being sent in the background.'];
}

$conn->close();
?>