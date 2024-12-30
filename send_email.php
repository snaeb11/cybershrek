<?php
require_once 'vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Get the email, first name, last name, and verification code from the command line arguments
$email = $argv[1];
$firstName = $argv[2];
$lastName = $argv[3];
$verificationCode = $argv[4];

// Create PHPMailer instance
$mail = new PHPMailer(true);

try {
    // SMTP configuration
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'lomanguilimotan00277@usep.edu.ph'; 
    $mail->Password = 'ywjs hozn mwkx ulcs';
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port = 587;

    // Set the sender and recipient
    $mail->setFrom('lomanguilimotan00277@usep.edu.ph', 'JAIS.');
    $mail->addAddress($email, $firstName . ' ' . $lastName);

    // Set the subject and body of the email
    $mail->Subject = '2FA Verification Code';
    $mail->isHTML(true);
    $mail->Body = 'Dear ' . $firstName . ' ' . $lastName . ',<br><br>
    We have received a request to authenticate your account. To complete the authentication process, please enter the following 2FA verification code: <br><br>
    <b>' . $verificationCode . '</b><br><br>
    This code is valid for a limited time only. If you did not initiate this request, please disregard this email and contact our support team immediately. <br>
    Thank you for your cooperation and for helping us keep your account secure. <br><br>
    Best regards, <br>
    <b>JAIS. Team</b>';

    // Send the email
    if ($mail->send()) {
        echo "Email sent to $email\n";
    } else {
        echo "Error sending email: " . $mail->ErrorInfo . "\n";
    }
} catch (Exception $e) {
    echo "Mailer Error: " . $e->getMessage() . "\n";
}
?>
