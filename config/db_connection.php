<?php

// Database credentials
$servername = "localhost"; 
$username = "root"; 
$password = "";
$dbname = "jais";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Return the connection
return $conn;

?>
