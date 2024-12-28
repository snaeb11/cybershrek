<?php
    require_once 'config/db_connection.php';

    session_start();
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        $productId = $_POST['productId'];
        $productName = htmlspecialchars($_POST['productName']);
        $category = htmlspecialchars($_POST['category']);
        $qty = $_POST['qty'];
        $price = $_POST['price'];

        if (empty($productId) || empty($productName) || empty($category) || empty($qty) || empty($price)) {
            echo json_encode(['success' => false, 'message' => 'All fields are required.']);
            exit;
        }

        $stmt = $conn->prepare("UPDATE bread SET productName = ?, category = ?, qty = ?, price = ? WHERE productId = ?");
        $stmt->bind_param("ssddi", $productName, $category, $qty, $price, $productId);

        if ($stmt->execute()) {
            echo json_encode(['success' => true, 'message' => 'Product updated successfully.']);
            insertUserActivityLog($_SESSION['user_email'], "Updated bread: " . $productId);
        } else {
            echo json_encode(['success' => false, 'message' => 'Failed to update product.']);
        }

        $stmt->close();
        $conn->close();
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
