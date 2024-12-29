<?php
$servername = "localhost"; // Change if your database is hosted elsewhere
$username = "root";       // Replace with your MySQL username
$password = "";           // Replace with your MySQL password
$dbname = "pitch";        // Replace with your database name

// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
