<?php
require 'config/db_connection.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

try {
    // Query to fetch roles and their permissions
    $sql = "
        SELECT r.roleId, r.roleName, p.permissionName
        FROM roles r
        LEFT JOIN role_permissions rp ON r.roleId = rp.roleId
        LEFT JOIN permissions p ON rp.permissionId = p.permissionId
    ";

    $result = $conn->query($sql);

    $rolesPermissions = [];
    while ($row = $result->fetch_assoc()) {
        $roleId = $row['roleId'];
        if (!isset($rolesPermissions[$roleId])) {
            $rolesPermissions[$roleId] = [
                'roleName' => $row['roleName'],
                'permissions' => []
            ];
        }
        if ($row['permissionName']) {
            $rolesPermissions[$roleId]['permissions'][] = $row['permissionName'];
        }
    }

    echo json_encode(array_values($rolesPermissions));
} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>
