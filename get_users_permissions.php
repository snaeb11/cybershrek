<?php
require 'config/db_connection.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

$userId = $_GET['userId'];

$query = "SELECT firstName, lastName, permission FROM accounts WHERE userId = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $userId);
$stmt->execute();
$result = $stmt->get_result();
$data = $result->fetch_assoc();

if ($data) {
    echo json_encode([
        'firstName' => $data['firstName'],
        'lastName' => $data['lastName'],
        'permissions' => $data['permission']
    ]);
} else {
    http_response_code(404);
    echo json_encode(['error' => 'User not found']);
}
?>
