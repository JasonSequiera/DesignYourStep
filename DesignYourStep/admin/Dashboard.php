<?php
session_start();

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("location: index.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav class="navbar">
        <a href="dashboard.php">Dashboard</a>
        <a href="logout.php">Logout</a>
    </nav>
    <div class="dashboard-container">
        <h1>Welcome, <?php echo htmlspecialchars($_SESSION['username']); ?></h1>
        <div class="card">
            <h2>Statistics</h2>
            <p>Users: 100</p>
            <p>Sales: $5000</p>
        </div>
        <div class="card">
            <h2>Recent Activity</h2>
            <p>User X registered</p>
            <p>User Y purchased an item</p>
        </div>
    </div>
</body>
</html>
