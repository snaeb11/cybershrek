<?php
require_once 'auth.php';

// Function to check permissions
function checkPermission($requiredPermission) {
    $permissions = isset($_SESSION['user']['permissions']) ? $_SESSION['user']['permissions'] : '';

    // Check if the required permission exists in the list of permissions
    $permissionsArray = explode(', ', $permissions);
    if (in_array($requiredPermission, $permissionsArray)) {
        return true;
    } else {
        return false;
    }
}

// Check if the user has 'inventory:view' permission
$userHasPermission = checkPermission('inventory:view');

// Return the result as a JavaScript variable
echo "<script>var userHasPermission = " . ($userHasPermission ? 'true' : 'false') . ";</script>";
?>
