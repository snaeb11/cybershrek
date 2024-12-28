<?php
    require 'config/db_connection.php';

    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    header('Content-Type: application/json');

    $input = json_decode(file_get_contents('php://input'), true);

    if (isset($input['userId'], $input['permissions'])) {
        $userId = $input['userId'];
        $permissions = implode(', ', $input['permissions']);

        if ($userId == 1) {
            echo json_encode(['status' => 'error', 'message' => 'This user cannot be edited.']);
            exit;
        }

        $query = "UPDATE accounts SET permission = ? WHERE userId = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("si", $permissions, $userId);

        if ($stmt->execute()) {
            echo json_encode(['status' => 'success', 'message' => 'Permissions updated successfully.']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to update permissions.']);
        }

        $stmt->close();
    } else {
        http_response_code(400);
        echo json_encode(['status' => 'error', 'message' => 'Invalid input.']);
    }
?>
