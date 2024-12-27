<?php
require 'config/db_connection.php';
require_once __DIR__ . '/vendor/autoload.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

// Load environment variables
$envFile = '.env';
$envContents = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
$envVariables = [];
foreach ($envContents as $line) {
    list($key, $value) = explode('=', $line, 2);
    $envVariables[$key] = trim($value);
}

$key = $envVariables['ENCRYPTION_KEY'] ?? null;

// Ensure the key is set
if (!$key) {
    echo json_encode(['success' => false, 'message' => 'Encryption key is not set in the .env file.']);
    exit;
}

// Sanitize user input
function sanitizeInput($input) {
    return htmlspecialchars(strip_tags(trim($input)), ENT_QUOTES, 'UTF-8');
}

// Function to decrypt the password
function decryptPassword($encryptedPassword) {
    global $key;
    $decodedPassword = base64_decode($encryptedPassword); 
    return \Dcrypt\Aes::decrypt($decodedPassword, $key); 
}

// Function to authenticate the user
function authenticateUser($email, $password) {
    global $conn;

    // Prepare the query to fetch user data
    $stmt = $conn->prepare("SELECT * FROM accounts WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Decrypt the stored password
        $decryptedPassword = decryptPassword($user['pass']);

        // Compare the decrypted password with the user-provided password
        if ($password === $decryptedPassword) {
            // Start a session and store user data, including permissions
            session_start();
            $_SESSION['user'] = [
                'userId' => $user['userId'],
                'firstName' => $user['firstName'],
                'lastName' => $user['lastName'],
                'email' => $user['email'],
                'permissions' => explode(',', $user['permission'])
            ];
        
            // Return response with userId directly
            return [
                'success' => true, 
                'message' => 'Login successful!', 
                'userId' => $_SESSION['user']['userId']  // Add userId here
            ];
        }        
    }

    // If no match is found or passwords don't match
    return ['success' => false, 'message' => 'Invalid email or password!'];
}


// Main login process
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = sanitizeInput($_POST['email'] ?? '');
    $password = sanitizeInput($_POST['password'] ?? '');

    // Call the authenticateUser function
    $authResult = authenticateUser($email, $password);

    // Return the result as a JSON response
    echo json_encode($authResult);
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method!']);
}

$conn->close();
?>