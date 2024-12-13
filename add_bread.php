<?php
require_once 'config/db_connection.php'; // Include your database connection script


ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json'); // Ensure the response is in JSON format

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the POST data
    $productName = $_POST['productName'];
    $category = $_POST['category'];
    $qty = $_POST['qty'];
    $price = $_POST['price'];

    // Validate the input data
    if (empty($productName) || empty($category) || empty($qty) || empty($price)) {
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
?>
