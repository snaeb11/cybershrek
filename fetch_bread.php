<?php
header("Content-Type: application/json");
require_once 'db_connection.php'; // Include your database connection script

$sql = "SELECT productId, productName, category, qty, price FROM bread";
$result = $conn->query($sql);

$data = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}
echo json_encode($data);
$conn->close();
?>
