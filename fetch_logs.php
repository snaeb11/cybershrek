<?php
require_once 'config/db_connection.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Query to select logs ordered by date and time in descending order
$sql = "SELECT email, activity_log, date, time FROM logs ORDER BY date DESC, time DESC";

$result = $conn->query($sql);

$data = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

// Return the data as a JSON response
header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
