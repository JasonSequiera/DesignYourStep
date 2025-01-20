<?php 
session_start();

// Variables to hold error message
$error = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $email = $_POST['email'];
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $phone_number = $_POST['phone_number'];

    // Basic validation
    if (empty($username) || empty($password) || empty($confirm_password) || empty($email) || empty($first_name) || empty($last_name) || empty($phone_number)) {
        $error = 'Please fill out all fields';
    } elseif ($password !== $confirm_password) {
        $error = 'Passwords do not match';
    } else {
        // Here you would add your logic to register the user
        // Assuming you have a function called register_user
        // $is_registered = register_user($username, $password, $email, $first_name, $last_name, $phone_number);
        
        // if ($is_registered) {
        //     header("location: login.php");
        // } else {
        //     $error = 'Registration failed, please try again';
        // }
        
        $error = 'Registration logic goes here'; // Temporary for demonstration
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="admin/style.css">
    <style>
        .input-container {
            position: relative;
            margin: 20px auto;
            width: 200px;
        }
        h1 {
            text-align: center;
            color: #4A1173; /* New color */
            margin-bottom: 20px;
        }
        body {
            background-image: url("images/234.jpeg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }
        .register-container {
            width: 300px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in-out;
        }
        .input-container {
            position: relative;
            margin: 20px auto;
            width: 200px;
        }
        .input-container input[type="text"], .input-container input[type="password"], .input-container input[type="email"], .input-container input[type="tel"] {
            font-size: 20px;
            width: 100%;
            border: none;
            border-bottom: 2px solid #7ED1D1;
            padding: 5px 0;
            background-color: transparent;
            outline: none;
        }
        .input-container .label {
            position: absolute;
            top: 0;
            left: 0;
            color: #ccc;
            transition: all 0.3s ease;
            pointer-events: none;
        }
        .input-container input[type="text"]:focus ~ .label,
        .input-container input[type="text"]:valid ~ .label,
        .input-container input[type="password"]:focus ~ .label,
        .input-container input[type="password"]:valid ~ .label,
        .input-container input[type="email"]:focus ~ .label,
        .input-container input[type="email"]:valid ~ .label,
        .input-container input[type="tel"]:focus ~ .label,
        .input-container input[type="tel"]:valid ~ .label {
            top: -20px;
            font-size: 16px;
            color: #7ED1D1;
        }
        .input-container .underline {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 2px;
            width: 100%;
            background-color: #AA81C9;
            transform: scaleX(0);
            transition: all 0.3s ease;
        }
        .input-container input[type="text"]:focus ~ .underline,
        .input-container input[type="text"]:valid ~ .underline,
        .input-container input[type="password"]:focus ~ .underline,
        .input-container input[type="password"]:valid ~ .underline,
        .input-container input[type="email"]:focus ~ .underline,
        .input-container input[type="email"]:valid ~ .underline,
        .input-container input[type="tel"]:focus ~ .underline,
        .input-container input[type="tel"]:valid ~ .underline {
            transform: scaleX(1);
        }
        button {
            padding: 0.8em 1.8em;
            border: 2px solid #AA81C9;
            position: relative;
            overflow: hidden;
            background-color: transparent;
            text-align: center;
            text-transform: uppercase;
            font-size: 16px;
            transition: .3s;
            z-index: 1;
            font-family: inherit;
            color: #17C3B2;
            width: 49%;
            top: 50%;
            left: 25%;
        }
        button::before {
            content: '';
            width: 0;
            height: 300%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(45deg);
            background: #AA81C9;
            transition: .5s ease;
            display: block;
            z-index: -1;
        }
        button:hover::before {
            width: 95%;
        }
        button:hover {
            color: #111;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h1>Register</h1>
        <?php if ($error): ?>
            <div class="alert alert-danger">
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php endif; ?>
        <form action="register.php" method="post">
            <div class="input-container">
                <input type="text" name="username" id="username" required>
                <label for="username" class="label">Username</label>
                <div class="underline"></div>
            </div>
            <div class="input-container">
                <input type="password" name="password" id="password" required>
                <label for="password" class="label">Password</label>
                <div class="underline"></div>
            </div>
            <div class="input-container">
                <input type="password" name="confirm_password" id="confirm_password" required>
                <label for="confirm_password" class="label">Confirm Password</label>
                <div class="underline"></div>
            </div>
            <div class="input-container">
                <input type="email" name="email" id="email" required>
                <label for="email" class="label">Email</label>
                <div class="underline"></div>
            </div>
            <div class="input-container">
                <input type="text" name="first_name" id="first_name" required>
                <label for="first_name" class="label">First Name</label>
                <div class="underline"></div>
            </div>
            <div class="input-container">
                <input type="text" name="last_name" id="last_name" required>
                <label for="last_name" class="label">Last Name</label>
                <div class="underline"></div>
            </div>
            <div class="input-container">
                <input type="tel" name="phone_number" id="phone_number" required>
                <label for="phone_number" class="label">Phone Number</label>
                <div class="underline"></div>
            </div>
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
