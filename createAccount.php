<?php
require 'config/db_connection.php';
require_once __DIR__ . '/vendor/autoload.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Load environment variables from .env file
$envFile = '.env';
$envContents = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

$envVariables = [];
foreach ($envContents as $line) {
    list($key, $value) = explode('=', $line, 2);
    $envVariables[$key] = trim($value);
}

// Get the value of the ENCRYPTION_KEY environment variable
$key = $envVariables['ENCRYPTION_KEY'] ?? null;

// Ensure the key is set in the environment
if (!$key) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Encryption key is not set in the .env file.']);
    exit;
}

// Sanitize user input
function sanitizeInput($input) {
    return htmlspecialchars(strip_tags(trim($input)), ENT_QUOTES, 'UTF-8');
}

// Define a function to securely encrypt data using Dcrypt
function encryptData($data) {
    global $key;
    $encryptedData = \Dcrypt\Aes::encrypt($data, $key);
    return base64_encode($encryptedData); // Base64 encode for storage
}

// Handle JSON input
$input = json_decode(file_get_contents('php://input'), true);

if (!$input) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Invalid JSON input.']);
    exit;
}

// Extract and sanitize input data
$firstName = sanitizeInput($input['firstName'] ?? '');
$lastName = sanitizeInput($input['lastName'] ?? '');
$pass = sanitizeInput($input['pass'] ?? '');
$email = sanitizeInput($input['email'] ?? '');
$accType = "Clerk";
$permission = "inventory:view"; 

// Encrypt sensitive data
$encryptedFirstName = encryptData($firstName);
$encryptedLastName = encryptData($lastName);
$encryptedEmail = encryptData($email);
$passwordHash = encryptData($pass);

// Insert the new account into the database
$query = "INSERT INTO accounts (firstName, lastName, pass, email, accType, permission) VALUES (?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($query);
$stmt->bind_param("ssssss", $encryptedFirstName, $encryptedLastName, $passwordHash, $encryptedEmail, $accType, $permission);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Account created successfully.']);
} else {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Error creating account: ' . $stmt->error]);
}

// Close the statement and connection
$stmt->close();
$conn->close();
?>
