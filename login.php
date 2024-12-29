<?php
include 'dbconnect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Check if email exists
    $sql = "SELECT * FROM user WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        // Verify the password
        if (password_verify($password, $row['password'])) {
            echo "Login successful! Your User ID is: " . $row['user_id'];
        } else {
            echo "Invalid password!";
        }
    } else {
        echo "User not found!";
    }

    $conn->close();
}
?>
