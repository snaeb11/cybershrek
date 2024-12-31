<?php
session_start();
header('Content-Type: application/json');

// Ensure session data exists
if (!isset($_SESSION['user_email'], $_SESSION['fName'], $_SESSION['lName'])) {
    echo json_encode([
        'success' => false,
        'message' => 'Session data is missing. Please log in again.',
    ]);
    exit;
}

// Check if the action is "resend_email"
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (isset($data['action']) && $data['action'] === 'resend_email') {
        // Get session data
        $email = $_SESSION['user_email'];
        $firstName = $_SESSION['fName'];
        $lastName = $_SESSION['lName'];

        // Call your email sending function here
        $result = sendEmail($email, $firstName, $lastName);

        if ($result) {
            echo json_encode([
                'success' => true,
                'message' => 'Email resent successfully!',
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Failed to send email. Please try again later.',
            ]);
        }
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Invalid action.',
        ]);
    }
}

function sendEmail($email, $firstName, $lastName) {
    // Generate a random 2FA verification code
    $verificationCode = rand(100000, 999999);

    // Store the verification code in the session
    $_SESSION['verification_code'] = $verificationCode;

    // Command to run send_email.php in the background using exec()
    $command = "php send_email.php $email $firstName $lastName $verificationCode 2>&1";
    exec($command);

    return ['success' => true, 'message' => 'Email is being sent in the background.'];
}
