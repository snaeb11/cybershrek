<?php
// Include the database connection configuration file
$conn = require_once 'config/db_connection.php';

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
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $pass = $_POST['pass'];
    $email = $_POST['email'];
    $accType = $_POST['accType'];

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