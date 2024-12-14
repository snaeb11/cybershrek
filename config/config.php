<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Include the db_connection.php file
require_once 'db_connection.php'; // Make sure to use the connection from here

date_default_timezone_set('Asia/Manila');

/* Accounts Table */
try {
    $sqlT = "CREATE TABLE IF NOT EXISTS accounts (
        userId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
        firstName VARCHAR(255) NOT NULL,
        lastName VARCHAR(255) NOT NULL,
        pass VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        accType VARCHAR(50) NOT NULL
        );";

    if ($conn->query($sqlT) === TRUE) {
        // Table created or already exists
    } else {
        echo "Error creating table: " . $conn->error;
    }
} catch (Exception $e) {
    echo $e->getMessage();
}

/* Admin Data for insertion */
$adminW = "Admin";
$adminPass = "admin123";
$adminEmail = "admin@gmail.com";

try {
    // Method to avoid admin account duplication and error
    $chkAdminAccExist = "SELECT * FROM accounts WHERE email = ?";
    $stmt = $conn->prepare($chkAdminAccExist);
    $stmt->bind_param("s", $adminEmail);
    $stmt->execute();
    $retval = $stmt->get_result();

    if ($retval->num_rows > 0) {
        // Admin account already exists, don't insert
    } else {
        $stmt->close(); // Close previous statement before reuse

        // Insert Admin's Account
        $sqlInsertAdminAcc = "INSERT INTO accounts 
                    (firstName, lastName, pass, email, accType)
                    VALUES 
                        (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sqlInsertAdminAcc);
        $stmt->bind_param(
            "sssss", 
            $adminW, 
            $adminW, 
            $adminPass, 
            $adminEmail, 
            $adminW
        );

        if ($stmt->execute()) {
            echo "success";
        } else {
            echo 'Error: ' . $sqlInsertAdminAcc . "<br>" . $conn->error;
        }
        $stmt->close();
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}

/* Bread Table */
try {
    $sqlT = "CREATE TABLE IF NOT EXISTS bread (
        productId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
        productName VARCHAR(255) NOT NULL,
        category VARCHAR(255) NOT NULL,
        qty VARCHAR(255) NOT NULL,
        price DECIMAL(10,2) NOT NULL
        );";

    if ($conn->query($sqlT) === TRUE) {
        // Table created or already exists
    } else {
        echo "Error creating table: " . $conn->error;
    }
} catch (Exception $e) {
    echo $e->getMessage();
}

// Close the connection after all queries are completed
$conn->close();

?>
