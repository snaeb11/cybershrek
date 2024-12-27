<?php
    require_once 'config/db_connection.php';

    session_start();

    if (isset($_SESSION['user']['userId'])) {
        $userId = $_SESSION['user']['userId'];
        
        function fetchUserPermissions($userId) {
            global $conn;
            
            $stmt = $conn->prepare("SELECT permission FROM accounts WHERE userId = ?");
            $stmt->bind_param("i", $userId);
            $stmt->execute();
            $result = $stmt->get_result();
            
            if ($result->num_rows > 0) {
                $user = $result->fetch_assoc();
                return explode(', ', $user['permission']); 
            }
            
            return [];
        }

        $permissions = fetchUserPermissions($userId);
        echo json_encode([
            'success' => true,
            'permissions' => $permissions
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'User not logged in'
        ]);
    }
?>
