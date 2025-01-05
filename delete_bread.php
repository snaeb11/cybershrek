<?php
    require_once 'config/db_connection.php';

    session_start();
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $productId = $_POST['productId'];

        if (empty($productId)) {
            echo json_encode(['success' => false, 'message' => 'Product ID is required.']);
            exit;
        }

        $stmt = $conn->prepare("DELETE FROM bread WHERE productId = ?");
        $stmt->bind_param("i", $productId);

        if ($stmt->execute()) {
            if ($stmt->affected_rows > 0) {
                echo json_encode(['success' => true, 'message' => 'Product deleted successfully.']);
                insertUserActivityLog($_SESSION['user_email'], "Deleted bread with ID: " . $productId);
            } else {
                echo json_encode(['success' => false, 'message' => 'No product found with the given ID.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Failed to delete product.']);
        }

        $stmt->close();
        $conn->close();
    }

    function insertUserActivityLog($username, $activity) {
        global $conn;
    
        try {
            // Set timezone to Asia/Manila
            date_default_timezone_set("Asia/Manila");
    
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
