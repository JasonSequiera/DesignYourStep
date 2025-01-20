<?php
session_start();

$admin_username = 'admin';
$admin_password = 'password';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username == $admin_username && $password == $admin_password) {
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        header("location: dashboard.php");
    } else {
        echo "<script>alert('Incorrect username or password'); window.location.href='index.php';</script>";
    }
} else {
    header("location: index.php");
}
?>
