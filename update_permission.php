<?php
session_start();
require 'config/db_connection.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

// Decode JSON input
$input = json_decode(file_get_contents('php://input'), true);

if (!isset($_SESSION['user']['userId'])) {
    http_response_code(401);
    echo json_encode(['success' => false, 'message' => 'Not authenticated']);
    exit;
}

// Validate input
if (!isset($input['userId'], $input['permissions'], $input['accType'])) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Invalid input.']);
    exit;
}

$userId = $input['userId'];
$accType = $input['accType'];
$permissionsArray = $input['permissions'];

// Validate `permissions` is an array
if (!is_array($permissionsArray)) {
    echo json_encode(['status' => 'error', 'message' => 'Permissions must be an array.']);
    exit;
}

// Validate `accType` field
if (empty($accType)) {
    echo json_encode(['success' => false, 'message' => 'Account type cannot be null.']);
    exit;
}

// Prevent editing user with ID 1
if ($userId == 1) {
    echo json_encode(['status' => 'error', 'message' => 'This user cannot be edited.']);
    exit;
}

// Convert permissions array to string
$permissions = implode(', ', $permissionsArray);

try {
    // Update account details
    $query = "UPDATE accounts SET permission = ?, accType = ? WHERE userId = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssi", $permissions, $accType, $userId);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Permissions updated successfully.']);
        insertUserActivityLog($_SESSION['user_email'], "Updated permissions for user with ID: " . $userId);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to update permissions.']);
    }

    $stmt->close();
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => 'Error: ' . $e->getMessage()]);
}

// Activity log function
function insertUserActivityLog($username, $activity) {
    global $conn;

    try {
        // Set timezone
        date_default_timezone_set("Asia/Manila");

        // Get date and time
        $date = date("F d, Y");
        $time = date("H:i");

        // Insert log
        $stmt = $conn->prepare("INSERT INTO logs (email, activity_log, date, time) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $username, $activity, $date, $time);

        if ($stmt->execute()) {
            return ['success' => true, 'message' => 'Activity log inserted successfully!'];
        } else {
            return ['success' => false, 'message' => 'Error inserting activity log: ' . $stmt->error];
        }
    } catch (Exception $e) {
        return ['success' => false, 'message' => 'Error: ' . $e->getMessage()];
    }
}
?>
