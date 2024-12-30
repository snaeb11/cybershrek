<?php
session_start();

// Ensure the content type is JSON
header('Content-Type: application/json');

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the raw POST data
    $input = json_decode(file_get_contents('php://input'), true);

    // Check if verificationCode is set in the received data
    if (isset($input['verificationCode'])) {
        $verificationCode = $input['verificationCode'];

        // Compare with the stored verification code in the session
        if ($verificationCode == $_SESSION['verification_code']) {
            // Verification successful
            echo json_encode(array("success" => true, "message" => "Verification successful."));
        } else {
            // Verification failed
            echo json_encode(array("success" => false, "message" => "Invalid verification code."));
        }
    } else {
        // If verification code is not provided
        echo json_encode(array("success" => false, "message" => "Verification code is required."));
    }
} else {
    // If the request method is not POST
    echo json_encode(array("success" => false, "message" => "Invalid request method."));
}
?>
