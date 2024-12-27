<?php
    require_once 'config/db_connection.php';

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
            } else {
                echo json_encode(['success' => false, 'message' => 'No product found with the given ID.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Failed to delete product.']);
        }

        $stmt->close();
        $conn->close();
    }
?>
