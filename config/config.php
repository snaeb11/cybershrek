<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once 'db_connection.php';
require_once __DIR__ . '/../vendor/autoload.php';

date_default_timezone_set('Asia/Manila');

session_start();

// Load environment variables from the .env file
$envFile = __DIR__ . '/../.env';
$envContents = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

$envVariables = [];
foreach ($envContents as $line) {
    list($key, $value) = explode('=', $line, 2);
    $envVariables[$key] = trim($value);
}

$key = $envVariables['ENCRYPTION_KEY'] ?? null;

if (!$key) {
    die('Encryption key is not set in the .env file.');
}

// Encryption function using Dcrypt
function encryptPassword($password, $key) {
    $encryptedData = \Dcrypt\Aes::encrypt($password, $key);
    return base64_encode($encryptedData);
}

// Create Accounts Table
try {
    $sqlT = "CREATE TABLE IF NOT EXISTS accounts (
        userId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
        firstName VARCHAR(255) NOT NULL,
        lastName VARCHAR(255) NOT NULL,
        pass VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE,
        accType VARCHAR(255) NOT NULL,
        permission VARCHAR(599) NOT NULL
    );";

    if ($conn->query($sqlT) === TRUE) {
        echo "Accounts table created successfully.<br>";
    } else {
        echo "Error creating Accounts table: " . $conn->error . "<br>";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

// Insert Default Admin Account
try {
    $adminPass = encryptPassword("admin123", $key); // Encrypt the password using Dcrypt
    $sqlInsertAdmin = "INSERT IGNORE INTO accounts (firstName, lastName, pass, email, accType, permission) VALUES 
                       ('Admin', 'Admin', ?, 'admin@gmail.com', 'Super Admin', 'inventory:view, inventory:add, inventory:edit, inventory:delete, manage:view, manage:edit');";

    $stmt = $conn->prepare($sqlInsertAdmin);
    $stmt->bind_param("s", $adminPass);

    if ($stmt->execute()) {
        echo "Default Admin account inserted successfully.<br>";
    } else {
        echo "Error inserting Admin account: " . $stmt->error . "<br>";
    }
    $stmt->close();
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

// Insert Bread Table
try {
    $sqlT = "CREATE TABLE IF NOT EXISTS bread (
        productId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
        productName VARCHAR(255) NOT NULL,
        category VARCHAR(255) NOT NULL,
        qty VARCHAR(255) NOT NULL,
        price DECIMAL(10,2) NOT NULL
        );";

    if ($conn->query($sqlT) === TRUE) {
    } else {
        echo "Error creating table: " . $conn->error;
    }
} catch (Exception $e) {
    echo $e->getMessage();
}

//create logs table
try {
    $sqlT = "CREATE TABLE IF NOT EXISTS logs (
        email VARCHAR(255) NOT NULL,
        activity_log VARCHAR(255) NOT NULL,
        date VARCHAR(20) NOT NULL, -- Format: 'Month 00, 0000'
        time TIME NOT NULL         -- Format: 'HH:MM' (24-hour format)
    );";

    if ($conn->query($sqlT) === TRUE) {
        echo "User Activity Logs table created successfully.<br>";
    } else {
        echo "Error creating User Activity Logs table: " . $conn->error . "<br>";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

?>
