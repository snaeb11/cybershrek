<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once 'db_connection.php';
require_once __DIR__ . '/../vendor/autoload.php';

date_default_timezone_set('Asia/Manila');

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

// Create Roles Table
try {
    $sqlT = "CREATE TABLE IF NOT EXISTS roles (
        roleId INT AUTO_INCREMENT PRIMARY KEY,
        roleName VARCHAR(50) NOT NULL
    );";

    if ($conn->query($sqlT) === TRUE) {
        echo "Roles table created successfully.<br>";
    } else {
        echo "Error creating Roles table: " . $conn->error . "<br>";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

// Create Accounts Table
try {
    $sqlT = "CREATE TABLE IF NOT EXISTS accounts (
        userId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
        firstName VARCHAR(255) NOT NULL,
        lastName VARCHAR(255) NOT NULL,
        pass VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE,
        roleId INT NOT NULL,
        FOREIGN KEY (roleId) REFERENCES roles(roleId) ON DELETE CASCADE
    );";

    if ($conn->query($sqlT) === TRUE) {
        echo "Accounts table created successfully.<br>";
    } else {
        echo "Error creating Accounts table: " . $conn->error . "<br>";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

// Create Permissions Table
try {
    $sqlT = "CREATE TABLE IF NOT EXISTS permissions (
        permissionId INT AUTO_INCREMENT PRIMARY KEY,
        permissionName VARCHAR(255) NOT NULL
    );";

    if ($conn->query($sqlT) === TRUE) {
        echo "Permissions table created successfully.<br>";
    } else {
        echo "Error creating Permissions table: " . $conn->error . "<br>";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

// Create Role-Permissions Table
try {
    $sqlT = "CREATE TABLE IF NOT EXISTS role_permissions (
        roleId INT NOT NULL,
        permissionId INT NOT NULL,
        PRIMARY KEY (roleId, permissionId),
        FOREIGN KEY (roleId) REFERENCES roles(roleId) ON DELETE CASCADE,
        FOREIGN KEY (permissionId) REFERENCES permissions(permissionId) ON DELETE CASCADE
    );";

    if ($conn->query($sqlT) === TRUE) {
        echo "Role-Permissions table created successfully.<br>";
    } else {
        echo "Error creating Role-Permissions table: " . $conn->error . "<br>";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

// Insert Roles
try {
    $sqlInsertRoles = "INSERT IGNORE INTO roles (roleName) VALUES 
                        ('super admin'),
                        ('admin'),
                        ('clerk');";
    if ($conn->query($sqlInsertRoles) === TRUE) {
        echo "Roles inserted successfully.<br>";
    } else {
        echo "Error inserting Roles: " . $conn->error . "<br>";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

// Insert Permissions
try {
    $sqlInsertPermissions = "INSERT IGNORE INTO permissions (permissionName) VALUES 
                             ('inventory:view'),
                             ('inventory:add'),
                             ('inventory:edit'),
                             ('inventory:delete'),
                             ('manage:admin'),
                             ('manage:clerk');";
    if ($conn->query($sqlInsertPermissions) === TRUE) {
        echo "Permissions inserted successfully.<br>";
    } else {
        echo "Error inserting Permissions: " . $conn->error . "<br>";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

// Insert Role-Permissions
try {
    $sqlInsertRolePermissions = "INSERT IGNORE INTO role_permissions (roleId, permissionId) VALUES 
                                 (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), 
                                 (2, 1), (2, 2), (2, 3), (2, 4), (2, 6), 
                                 (3, 1);";
    if ($conn->query($sqlInsertRolePermissions) === TRUE) {
        echo "Role-Permissions mappings inserted successfully.<br>";
    } else {
        echo "Error inserting Role-Permissions: " . $conn->error . "<br>";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "<br>";
}

// Insert Default Admin Account
try {
    $adminPass = encryptPassword("admin123", $key); // Encrypt the password using Dcrypt
    $sqlInsertAdmin = "INSERT IGNORE INTO accounts (firstName, lastName, pass, email, roleId) VALUES 
                       ('Admin', 'Admin', ?, 'admin@gmail.com', 1);";

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

$conn->close();

?>
