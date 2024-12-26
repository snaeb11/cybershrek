<?php
session_start();

// Redirect to login page if not authenticated
if (!isset($_SESSION['user'])) {
    header('Location: login.php');
    exit;
}

// Function to check permissions
function checkPermission($requiredPermission) {
    $permissions = isset($_SESSION['user']['permissions']) ? $_SESSION['user']['permissions'] : '';

    // Check if the required permission exists in the list of permissions
    $permissionsArray = explode(', ', $permissions);
    if (!in_array($requiredPermission, $permissionsArray)) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'Access denied!']);
        exit;
    }
}
?>
