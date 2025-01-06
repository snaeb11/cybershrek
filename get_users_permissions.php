<?php
require 'config/db_connection.php';
require_once __DIR__ . '/vendor/autoload.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

// Load encryption key from .env file
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

// Function to decrypt data
function decryptPassword($encryptedPassword, $key) {
    try {
        $decodedPassword = base64_decode($encryptedPassword);
        return \Dcrypt\Aes::decrypt($decodedPassword, $key);
    } catch (Exception $e) {
        error_log("Decryption error: " . $e->getMessage());
        return null;
    }
}

// Get the userId from the GET request
$userId = $_GET['userId'] ?? null;

if (!$userId) {
    http_response_code(400);
    echo json_encode(['error' => 'Missing userId parameter']);
    exit;
}

// Query the database
$query = "SELECT firstName, lastName, accType, permission FROM accounts WHERE userId = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $userId);
$stmt->execute();
$result = $stmt->get_result();
$data = $result->fetch_assoc();

// Check if user exists
if ($data) {
    // Decrypt sensitive fields if they are encrypted
    if (isset($data['firstName'])) {
        $data['firstName'] = decryptPassword($data['firstName'], $key);
    }
    if (isset($data['lastName'])) {
        $data['lastName'] = decryptPassword($data['lastName'], $key);
    }

    // Return the decrypted data
    echo json_encode([
        'firstName' => $data['firstName'],
        'lastName' => $data['lastName'],
        'accType' => $data['accType'],
        'permissions' => $data['permission']
    ]);
} else {
    // Return 404 if the user is not found
    http_response_code(404);
    echo json_encode(['error' => 'User not found']);
}

$conn->close();
?>
