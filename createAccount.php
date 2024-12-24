<?php
// Include the database connection configuration file
$conn = require_once 'config/db_connection.php';

function sanitizeInput($input) {
    return htmlspecialchars(strip_tags(trim($input)), ENT_QUOTES, 'UTF-8');
}

// Define the function to create a new account
function createAccount($firstName, $lastName, $pass, $email, $accType) {
    global $conn;

    // Hash the password using the dcrypt library
    $passwordHash = dcrypt_encrypt($pass);

    // Insert the new account into the database
    $query = "INSERT INTO accounts (firstName, lastName, pass, email, accType) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("sssss", $firstName, $lastName, $passwordHash, $email, $accType);
    $result = $stmt->execute();

    // Check if the account was created successfully
    if ($result) {
        return true;
    } else {
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
    $accType = sanitizeInput($_POST['accType']);

    // Validate the form data
    if (empty($firstName) || empty($lastName) || empty($pass) || empty($email) || empty($accType)) {
        echo "Please fill out all fields.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Invalid email address.";
    } else {
        // Sanitize the form data
        $firstName = htmlspecialchars($firstName);
        $lastName = htmlspecialchars($lastName);
        $pass = htmlspecialchars($pass);
        $email = htmlspecialchars($email);
        $accType = htmlspecialchars($accType);

        // Create the new account
        if (createAccount($firstName, $lastName, $pass, $email, $accType)) {
            echo "Account created successfully!";
        } else {
            echo "Error creating account.";
        }
    }
}

// Close the database connection
$conn->close();
?>