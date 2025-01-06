<?php
require 'config/db_connection.php';
require_once __DIR__ . '/vendor/autoload.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

// Load the .env file for the encryption key
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

// Query the accounts table
$sql = "SELECT * FROM accounts";
$result = $conn->query($sql);

$accounts = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // Decrypt the encrypted fields if needed
        if (isset($row['firstName']) && isset($row['lastName'])) {
            $row['firstName'] = decryptPassword($row['firstName'], $key);
            $row['lastName'] = decryptPassword($row['lastName'], $key);
        }
        $accounts[] = $row;
    }
}

$conn->close();

// Return the accounts with decrypted data
echo json_encode($accounts);
?>
