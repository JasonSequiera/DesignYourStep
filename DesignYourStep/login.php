<?php 
session_start();

// Check if the user is already logged in
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true) {
    if ($_SESSION['role'] === 'admin') {
        header("location: admin/dashboard.php");
        exit;
    } else {
        // Redirect to user dashboard or home page
        header("location: user_dashboard.php"); // Replace with the user dashboard page
        exit;
    }
}

// Variables to hold error message
$error = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Define admin credentials
    $admin_username = 'admin';
    $admin_password = 'password';

    // Check if the provided credentials match the admin credentials
    if ($username == $admin_username && $password == $admin_password) {
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        $_SESSION['role'] = 'admin';
        header("location: admin/dashboard.php");
        exit;
    } else {
        $error = 'Incorrect username or password'; // Temporary for demonstration
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="admin/style.css">
    <style>
        /* General Reset and Centering */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f0f0; /* Optional: for better visibility */
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
        }

        .card {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 350px;
            width: 300px;
            flex-direction: column;
            gap: 35px;
            background: #e3e3e3;
            box-shadow: 8px 8px 16px #c8c8c8, -8px -8px 16px #fefefe;
            border-radius: 8px;
            padding: 20px; /* Optional: add padding for better spacing */
        }

        .login {
            color: #000;
            text-transform: uppercase;
            letter-spacing: 2px;
            display: block;
            font-weight: bold;
            font-size: x-large;
        }

        .inputBox {
            position: relative;
            width: 250px;
        }

        .inputBox input {
            width: 100%;
            padding: 10px;
            outline: none;
            border: none;
            color: #000;
            font-size: 1em;
            background: transparent;
            border-left: 2px solid #000;
            border-bottom: 2px solid #000;
            transition: 0.1s;
            border-bottom-left-radius: 8px;
        }

        .inputBox span {
            margin-top: 5px;
            position: absolute;
            left: 0;
            bottom: 25%;
            transform: translateY(-4px);
            margin-left: 10px;
            padding: 10px;
            pointer-events: none;
            font-size: 12px;
            color: #000;
            text-transform: uppercase;
            transition: 0.5s;
            letter-spacing: 3px;
            border-radius: 8px;
        }

        .inputBox input:valid~span,
        .inputBox input:focus~span {
            transform: translateX(113px) translateY(-25px);
            font-size: 0.8em;
            padding: 5px 10px;
            background: #000;
            letter-spacing: 0.2em;
            color: #fff;
            border: 2px;
        }

        .inputBox input:valid,
        .inputBox input:focus {
            border: 2px solid #000;
            border-radius: 8px;
        }

        .enter {
            height: 45px;
            width: 100px;
            border-radius: 5px;
            border: 2px solid #000;
            cursor: pointer;
            background-color: transparent;
            transition: 0.5s;
            text-transform: uppercase;
            font-size: 10px;
            letter-spacing: 2px;
            margin-bottom: 1em;
            color: black;
        }

        .enter:hover {
            background-color: rgb(0, 0, 0);
            color: white;
        }

        body {
            width: 100%;
            height: 100%;
            --s: 37px; /* control the size */

            --c: #0000, #282828 0.5deg 119.5deg, #0000 120deg;
            --g1: conic-gradient(from 60deg at 56.25% calc(425% / 6), var(--c));
            --g2: conic-gradient(from 180deg at 43.75% calc(425% / 6), var(--c));
            --g3: conic-gradient(from -60deg at 50% calc(175% / 12), var(--c));
            background: var(--g1), var(--g1) var(--s) calc(1.73 * var(--s)), var(--g2),
                var(--g2) var(--s) calc(1.73 * var(--s)), var(--g3) var(--s) 0,
                var(--g3) 0 calc(1.73 * var(--s)) #1e1e1e;
            background-size: calc(2 * var(--s)) calc(3.46 * var(--s));
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <a class="login">Log in</a>
            <div class="inputBox">
                <form method="POST" action="">
                    <input type="text" name="username" required="required" id="username">
                    <span>Username</span>
            </div>

            <div class="inputBox">
                <input type="password" name="password" required="required" id="password">
                <span>Password</span>
            </div>

            <button class="enter" type="submit">Enter</button>
            </form>
            <?php if ($error): ?>
                <p><?php echo htmlspecialchars($error); ?></p>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
