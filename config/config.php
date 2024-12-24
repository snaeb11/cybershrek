<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once 'db_connection.php';

date_default_timezone_set('Asia/Manila');

/* Accounts Table */
try {
    $sqlT = "CREATE TABLE IF NOT EXISTS accounts (
        userId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
        firstName VARCHAR(255) NOT NULL,
        lastName VARCHAR(255) NOT NULL,
        pass VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        roleId INT NOT NULL,
        FOREIGN KEY (roleId) REFERENCES roles(roleId)
        );";

    if ($conn->query($sqlT) === TRUE) {
    } else {
        echo "Error creating table: " . $conn->error;
    }
} catch (Exception $e) {
    echo $e->getMessage();
}


/*RBAC IDK MAN IM TIRED
    roles:
        super admin - inventory (add, edit, delete), manage accounts (admin, clerk)
        admin- inventory (add, edit, delete), manage accounts (admin, clerk)
        clerk - inventory (add, edit, delete), manage accounts (none)
*/
try {
    $sqlT = "CREATE TABLE roles (
        roleId INT AUTO_INCREMENT PRIMARY KEY,
        roleName VARCHAR(50) NOT NULL
        );";

    if ($conn->query($sqlT) === TRUE) {
    } else {
        echo "Error creating table: " . $conn->error;
    }
} catch (Exception $e) {
    echo $e->getMessage();
}

try {
    $sqlT = "CREATE TABLE permissions (
        permissionId INT AUTO_INCREMENT PRIMARY KEY,
        permissionName VARCHAR(255) NOT NULL
        );";

    if ($conn->query($sqlT) === TRUE) {
    } else {
        echo "Error creating table: " . $conn->error;
    }
} catch (Exception $e) {
    echo $e->getMessage();
}

try {
    $sqlT = "CREATE TABLE role_permissions (
        roleId INT NOT NULL,
        permissionId INT NOT NULL,
        PRIMARY KEY (roleId, permissionId),
        FOREIGN KEY (roleId) REFERENCES roles(roleId),
        FOREIGN KEY (permissionId) REFERENCES permissions(permissionId)
        );";

    if ($conn->query($sqlT) === TRUE) {
    } else {
        echo "Error creating table: " . $conn->error;
    }
} catch (Exception $e) {
    echo $e->getMessage();
}


try {
    // Check if roles exist
    $chkRolesExist = "SELECT * FROM roles WHERE roleName IN ('super admin', 'admin', 'clerk')";
    $stmt = $conn->prepare($chkRolesExist);
    $stmt->execute();
    $retvalRoles = $stmt->get_result();

    if ($retvalRoles->num_rows > 0) {
    } else {
        $stmt->close();

        $sqlInsertRoles = "INSERT INTO roles (roleName) VALUES 
                            ('super admin'),
                            ('admin'),
                            ('clerk')";
        $stmt = $conn->prepare($sqlInsertRoles);
        if ($stmt->execute()) {
            echo "Roles inserted successfully.";
        } else {
            echo 'Error: ' . $sqlInsertRoles . "<br>" . $conn->error;
        }
        $stmt->close();
    }

    // Check if permissions exist
    $chkPermissionsExist = "SELECT * FROM permissions WHERE permissionName IN 
                             ('inventory:view', 'inventory:add', 'inventory:edit', 'inventory:delete', 'manage:admin', 'manage:clerk')";
    $stmt = $conn->prepare($chkPermissionsExist);
    $stmt->execute();
    $retvalPermissions = $stmt->get_result();

    if ($retvalPermissions->num_rows > 0) {
    } else {
        $stmt->close();

        $sqlInsertPermissions = "INSERT INTO permissions (permissionName) VALUES 
                                 ('inventory:view'),
                                 ('inventory:add'),
                                 ('inventory:edit'),
                                 ('inventory:delete'),
                                 ('manage:admin'),
                                 ('manage:clerk')";
        $stmt = $conn->prepare($sqlInsertPermissions);
        if ($stmt->execute()) {
            echo "Permissions inserted successfully.";
        } else {
            echo 'Error: ' . $sqlInsertPermissions . "<br>" . $conn->error;
        }
        $stmt->close();
    }

    // Assign permissions to roles
    $chkRolePermissionsExist = "SELECT * FROM role_permissions WHERE roleId IN (1, 2, 3)";
    $stmt = $conn->prepare($chkRolePermissionsExist);
    $stmt->execute();
    $retvalRolePermissions = $stmt->get_result();

    if ($retvalRolePermissions->num_rows > 0) {
    } else {
        $stmt->close();

        // Insert role_permissions for Super Admin
        $sqlInsertSuperAdminPermissions = "INSERT INTO role_permissions (roleId, permissionId) VALUES 
                                           (1, 1), -- inventory:view
                                           (1, 2), -- inventory:add
                                           (1, 3), -- inventory:edit
                                           (1, 4), -- inventory:delete
                                           (1, 5), -- manage:admin
                                           (1, 6); -- manage:clerk";
        $stmt = $conn->prepare($sqlInsertSuperAdminPermissions);
        if ($stmt->execute()) {
            echo "Super Admin permissions inserted successfully.";
        } else {
            echo 'Error: ' . $sqlInsertSuperAdminPermissions . "<br>" . $conn->error;
        }
        $stmt->close();

        // Insert role_permissions for Admin
        $sqlInsertAdminPermissions = "INSERT INTO role_permissions (roleId, permissionId) VALUES 
                                      (2, 1), -- inventory:view
                                      (2, 2), -- inventory:add
                                      (2, 3), -- inventory:edit
                                      (2, 4), -- inventory:delete
                                      (2, 6); -- manage:clerk";
        $stmt = $conn->prepare($sqlInsertAdminPermissions);
        if ($stmt->execute()) {
            echo "Admin permissions inserted successfully.";
        } else {
            echo 'Error: ' . $sqlInsertAdminPermissions . "<br>" . $conn->error;
        }
        $stmt->close();

        // Insert role_permissions for Clerk
        $sqlInsertClerkPermissions = "INSERT INTO role_permissions (roleId, permissionId) VALUES 
                                      (3, 1); -- inventory:view";
        $stmt = $conn->prepare($sqlInsertClerkPermissions);
        if ($stmt->execute()) {
            echo "Clerk permissions inserted successfully.";
        } else {
            echo 'Error: ' . $sqlInsertClerkPermissions . "<br>" . $conn->error;
        }
        $stmt->close();
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}





/* Admin Data for insertion */
$adminW = "Admin";
$adminPass = "admin123";
$adminEmail = "admin@gmail.com";
$adminType = "1";

try {
    // Method to avoid admin account duplication and error
    $chkAdminAccExist = "SELECT * FROM accounts WHERE email = ?";
    $stmt = $conn->prepare($chkAdminAccExist);
    $stmt->bind_param("s", $adminEmail);
    $stmt->execute();
    $retval = $stmt->get_result();

    if ($retval->num_rows > 0) {
    } else {
        $stmt->close();

        $sqlInsertAdminAcc = "INSERT INTO accounts 
                    (firstName, lastName, pass, email, roleId)
                    VALUES 
                        (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sqlInsertAdminAcc);
        $stmt->bind_param(
            "sssss", 
            $adminW, 
            $adminW, 
            $adminPass, 
            $adminEmail, 
            $adminType
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
    } else {
        echo "Error creating table: " . $conn->error;
    }
} catch (Exception $e) {
    echo $e->getMessage();
}



$conn->close();

?>
