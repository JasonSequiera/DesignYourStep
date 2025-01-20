<?php
session_start();

// Database connection configuration
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'designyourstep');

// Create database connection
function getDBConnection() {
    try {
        $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        if ($conn->connect_error) {
            throw new Exception("Connection failed: " . $conn->connect_error);
        }
        return $conn;
    } catch (Exception $e) {
        error_log("Database connection error: " . $e->getMessage());
        return false;
    }
}

// Function to sanitize input data
function sanitizeInput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Function to redirect with error message
function redirectWithError($message) {
    $_SESSION['error'] = $message;
    header("Location: login.php"); // Redirect back to the same login page for error
    exit();
}

// Handle login form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = getDBConnection();
    
    if (!$conn) {
        redirectWithError("Database connection failed");
    }
    
    $email = sanitizeInput($_POST['email']);
    $password = sanitizeInput($_POST['password']);
    
    // Basic input validation
    if (empty($email) || empty($password)) {
        $conn->close();
        redirectWithError("Please fill in all fields");
    }
    
    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $conn->close();
        redirectWithError("Invalid email format");
    }
    
    try {
        // Prepare SQL statement using the existing database structure
        $stmt = $conn->prepare("SELECT Customer_ID, Email, Password, Fname FROM customer_details_tbl WHERE Email = ? LIMIT 1");
        if (!$stmt) {
            throw new Exception("Failed to prepare statement");
        }
        
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows === 1) {
            $user = $result->fetch_assoc();
            
            // Verify hashed password
            if (password_verify($password, $user['Password'])) {
                // Set session variables
                $_SESSION['user_id'] = $user['Customer_ID'];
                $_SESSION['user_name'] = $user['Fname'];
                $_SESSION['logged_in'] = true;
                $_SESSION['login_time'] = time();
                
                // Regenerate session ID for security
                session_regenerate_id(true);
                
                // Clean up
                $stmt->close();
                $conn->close();
                
                // Redirect to dashboard or home page
                header("Location: index.html");
                exit();
            }
        }
        
        // If we get here, login failed
        $stmt->close();
        $conn->close();
        redirectWithError("Invalid email or password");
        
    } catch (Exception $e) {
        // Log the error
        error_log("Login error: " . $e->getMessage());
        
        // Clean up
        if (isset($stmt)) {
            $stmt->close();
        }
        if (isset($conn)) {
            $conn->close();
        }
        
        redirectWithError("An error occurred during login");
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - DesignYourStep</title>
    <link rel="stylesheet" href="login.css">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Montserrat:ital,wght@1,738&family=Playfair+Display:wght@800&family=Quicksand:wght@700&family=Varela+Round&display=swap" rel="stylesheet">
</head>
<body>
    <div class="image-container">
        <img src="Images/Jordan_Left.jpg" alt="Shoe Image">
    </div>
    <div class="login-container">
        <div class="login-header">
            <br><br><br><br>
            <h1 class="montserrat-welcome" style="font-family: 'Montserrat', sans-serif;">Welcome Back! </h1>
            <p>Log in to Craft Your Style</p>
        </div>
        
        <!-- Display error message if any -->
        <?php if (isset($_SESSION['error'])): ?>
            <div class="error-message">
                <p><?php echo $_SESSION['error']; ?></p>
            </div>
            <?php unset($_SESSION['error']); ?>
        <?php endif; ?>

        <form action="login.php" method="POST">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" class="input" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="input" required>
            </div>
            <button class="button">
                Login
                <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m6 17 5-5-5-5"></path><path d="m13 17 5-5-5-5"></path></svg>
            </button>
        </form>
        <p class="footer-text">
            Don't have an account? <a href="registeration.html">Sign up</a>
        </p>
    </div>
</body>
</html>
