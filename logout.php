<?php
// logout.php
session_start();
require 'config/db_connection.php';

// Enable error logging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Start output buffering
ob_start();

header('Content-Type: application/json');

try {
    // Log the logout activity before destroying the session
    if (isset($_SESSION['user_email'])) {
        $email = $_SESSION['user_email'];
        insertUserActivityLog($email, "Logout");
    }

    // Unset all session variables
    $_SESSION = array();

    // Destroy the session cookie
    if (isset($_COOKIE[session_name()])) {
        setcookie(session_name(), '', time() - 3600, '/');
    }

    // Destroy the session
    session_destroy();

    // Clean output buffer
    while (ob_get_level()) {
        ob_end_clean();
    }

    // Send success response
    echo json_encode([
        'success' => true,
        'message' => 'Logged out successfully'
    ]);

} catch (Exception $e) {
    // Clean output buffer
    while (ob_get_level()) {
        ob_end_clean();
    }

    echo json_encode([
        'success' => false,
        'message' => 'Error during logout: ' . $e->getMessage()
    ]);
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


$conn->close();
?>