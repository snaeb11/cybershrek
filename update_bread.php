<?php
    require_once 'config/db_connection.php';

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
        } else {
            echo json_encode(['success' => false, 'message' => 'Failed to update product.']);
        }

        $stmt->close();
        $conn->close();
    }
?>
