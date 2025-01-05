<?php
    session_start();
    require 'config/db_connection.php';

    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    header('Content-Type: application/json');

    $input = json_decode(file_get_contents('php://input'), true);

    if (isset($input['userId'], $input['permissions'])) {
        $userId = $input['userId'];
        $accType = $data['accType'];
        $permissions = implode(', ', $input['permissions']);

        if (empty($accType)) {
            echo json_encode(['success' => false, 'message' => 'Account type cannot be null.']);
            exit;
        }

        if ($userId == 1) {
            echo json_encode(['status' => 'error', 'message' => 'This user cannot be edited.']);
            exit;
        }

        $query = "UPDATE accounts SET permission = ?, accType = ? WHERE userId = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("si", $permissions, $userId);

        if ($stmt->execute()) {
            echo json_encode(['status' => 'success', 'message' => 'Permissions updated successfully.']);
            insertUserActivityLog($_SESSION['user_email'], "Updated permissions for user with ID: " . $userId);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to update permissions.']);
        }

        $stmt->close();
    } else {
        http_response_code(400);
        echo json_encode(['status' => 'error', 'message' => 'Invalid input.']);
    }

    function insertUserActivityLog($username, $activity) {
        global $conn;
    
        try {
            // Get the current date and time
            $date = date("F d, Y"); // Format: Month Day, Year (e.g., October 28, 2024)
            $time = date("H:i");    // Format: HH:MM (24-hour format)
    
            // Prepare the query to insert the activity log
            $stmt = $conn->prepare("INSERT INTO logs (email, activity_log, date, time) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("ssss", $username, $activity, $date, $time);
    
            // Execute the query
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
