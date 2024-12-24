<?php
require 'config/db_connection.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

$sql = "SELECT * FROM accounts";
$result = $conn->query($sql);

$accounts = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $accounts[] = $row;
    }
}

$conn->close();

echo json_encode($accounts);
?>
