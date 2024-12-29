<?php
include 'dbconnect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT); // Encrypt password
    $role = $_POST['role'];

    // Set flags based on role
    $player_flag = ($role === "Player") ? 1 : 0;
    $admin_flag = ($role === "Admin") ? 1 : 0;

    // Insert user into database
    $sql = "INSERT INTO user (name, email, phone, password, player_flag, admin_flag)
            VALUES ('$name', '$email', '$phone', '$password', $player_flag, $admin_flag)";

    if ($conn->query($sql) === TRUE) {
        echo "Registration successful!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>
