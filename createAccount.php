<?php

require_once __DIR__ . '/vendor/autoload.php';

// Load environment variables from .env file
$envFile = '.env';
$envContents = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

$envVariables = [];
foreach ($envContents as $line) {
    list($key, $value) = explode('=', $line, 2);
    $envVariables[$key] = trim($value);
}

// Include the database connection configuration file
$conn = require_once 'config/db_connection.php';

// Get the value of the ENCRYPTION_KEY environment variable
$key = $envVariables['ENCRYPTION_KEY'];

// Ensure the key is set in the environment
if (!$key) {
    die('Encryption key is not set in the .env file.');
}

// Sanitize user input
function sanitizeInput($input) {
    return htmlspecialchars(strip_tags(trim($input)), ENT_QUOTES, 'UTF-8');
}

// Define a function to securely encrypt data using Dcrypt
function encryptPassword($password) {
    global $key;
    $encryptedData = \Dcrypt\Aes::encrypt($password, $key);
    return base64_encode($encryptedData);
}

// Define the function to create a new account
function createAccount($firstName, $lastName, $pass, $email, $permission = "inventory:view") {  // Default permission set to inventory:view (clerk)
    global $conn;

    // Encrypt the password securely using Dcrypt
    $passwordHash = encryptPassword($pass);

    // Insert the new account into the database
    $query = "INSERT INTO accounts (firstName, lastName, pass, email, permission) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("sssss", $firstName, $lastName, $passwordHash, $email, $permission);
    $result = $stmt->execute();

    // Check if the account was created successfully
    if ($result) {
        echo "Account created successfully!";
        return true;
    } else {
        echo "Error creating account: " . $stmt->error;
        return false;
    }
}

// Check if the form has been submitted
if (isset($_POST['submit'])) {
    // Get the form data
    $firstName = sanitizeInput($_POST['firstName']);
    $lastName = sanitizeInput($_POST['lastName']);
    $pass = sanitizeInput($_POST['pass']);
    $email = sanitizeInput($_POST['email']);
    
    // Set the roleId field to "Clerk" (default value 3)
    $permission = "inventory:view"; // Clerk role by default

    // Validate the form data
    if (empty($firstName) || empty($lastName) || empty($pass) || empty($email)) {
        echo "<script>alert('Please fill out all fields.');</script>";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "<script>alert('Invalid email address.');</script>";
    } else {
        // Create the new account
        if (createAccount($firstName, $lastName, $pass, $email, $permission)) {
            echo "<script>alert('Successfully created an account.');</script>";
            // Redirect to the index/login screen
            echo "<script>window.location.href = 'index.html';</script>";
            exit;
        } else {
            echo "<script>alert('Error creating account.');</script>";
        }
    }
}

// Close the database connection
$conn->close();
?>
