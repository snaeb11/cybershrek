<?php
require_once 'config/db_connection.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

session_start();

function sanitizeInput($input) {
    return htmlspecialchars(strip_tags(trim($input)), ENT_QUOTES, 'UTF-8');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the POST data
    $productName = sanitizeInput($_POST['productName']);
    $category = sanitizeInput($_POST['category']);
    $qty = filter_var($_POST['qty'], FILTER_VALIDATE_INT); 
    $price = filter_var($_POST['price'], FILTER_VALIDATE_FLOAT);

    // Validate the input data
    if (empty($productName) || empty($category) || !$qty || !$price) {
        echo json_encode(["success" => false, "message" => "Please fill in all fields"]);
        exit;
    }

    // Prepare the SQL query
    $sql = "INSERT INTO bread (productName, category, qty, price) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $productName, $category, $qty, $price);

    if ($stmt->execute()) {
        // Success response
        echo json_encode(["success" => true, "message" => "Item added successfully!"]);
        insertUserActivityLog($_SESSION['user_email'], "Added bread: " . $productName);
    } else {
        // Error response
        echo json_encode(["success" => false, "message" => "Failed to add item."]);
    }

    // Close the prepared statement and database connection
    $stmt->close();
    $conn->close();
} else {
    // If not a POST request, return an error
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
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
