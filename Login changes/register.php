<?php
// Start the session
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

// Function to redirect with an error message
function redirectWithError($message) {
    $_SESSION['error'] = $message;
    header("Location: register.php");
    exit();
}

// Handle the registration form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = getDBConnection();
    
    if (!$conn) {
        redirectWithError("Database connection failed");
    }

    // Sanitize and validate input fields
    $fname = sanitizeInput($_POST['Fname']);
    $lname = sanitizeInput($_POST['Lname']);
    $email = sanitizeInput($_POST['Email']);
    $password = sanitizeInput($_POST['Password']);
    $address = sanitizeInput($_POST['Address']);
    $pincode = sanitizeInput($_POST['Pincode']);
    $birthdate = sanitizeInput($_POST['Birthdate']);
    $contact_no = sanitizeInput($_POST['ContactNo']);
    $gender = sanitizeInput($_POST['Gender']);
    $city_id = isset($_POST['City_ID']) ? intval($_POST['City_ID']) : 0; // City_ID from dropdown

    // Check for empty fields
    if (empty($fname) || empty($lname) || empty($email) || empty($password) || empty($address) || empty($pincode) || empty($birthdate) || empty($contact_no) || empty($gender) || empty($city_id)) {
        $conn->close();
        redirectWithError("All fields are required.");
    }

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $conn->close();
        redirectWithError("Invalid email format.");
    }

    // Hash the password
    $hashed_password = password_hash($password, PASSWORD_BCRYPT);

    try {
        // Prepare the SQL statement
        $stmt = $conn->prepare("INSERT INTO customer_details_tbl (Fname, Lname, Email, Password, Address, Pincode, Birthdate, ContactNo, Gender, City_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        if (!$stmt) {
            throw new Exception("Failed to prepare statement");
        }

        // Bind parameters
        $stmt->bind_param("sssssssssi", $fname, $lname, $email, $hashed_password, $address, $pincode, $birthdate, $contact_no, $gender, $city_id);
        
        // Execute the statement
        if ($stmt->execute()) {
            // Registration successful
            $_SESSION['success'] = "Registration successful. Please login.";
            $stmt->close();
            $conn->close();
            header("Location: login.php");
            exit();
        } else {
            throw new Exception("Failed to execute query: " . $stmt->error);
        }
    } catch (Exception $e) {
        error_log("Registration error: " . $e->getMessage());
        if (isset($stmt)) {
            $stmt->close();
        }
        if (isset($conn)) {
            $conn->close();
        }
        redirectWithError("An error occurred during registration.");
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registeration - DesignYourStep</title>
    <link rel="stylesheet" href="register.css">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Montserrat:ital,wght@1,738&family=Playfair+Display:wght@800&family=Quicksand:wght@700&family=Varela+Round&display=swap" rel="stylesheet">
</head>
<body>
    <!-- <header class="header">
        <div class="logo">DesignYourStep</div>
        <nav class="navbar">
            <ul class="nav-list">
                <li><a href="index.html">Home</a></li>
                <li><a href="#products">Products</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="registeration.html">Sign Up</a></li>
            </ul>
        </nav>
    </header> -->
    <div class="image-container">
        <img src="Jordan_Right.png" alt="Shoe Image">
    </div>
    <div class="register-container">
        <div class="register-header">
            <h1 class="montserrat-welcome" style="font-family: 'Montserrat', sans-serif;">Start Crafting! </h1>
        </div>
        <form action="register.php" method="POST">
            <table>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="fn">First Name</label>
                            <input type="text" id="text" name="text" class="input" required>
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="ln">Last Name</label>
                            <input type="text" id="text" name="text" class="input" required>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" class="input" required>
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" class="input" required>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="adress">Address</label>
                            <textarea id="add" name="add" class="input" rows="2.5" required></textarea>
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="pincode">Pincode</label>
                            <input type="text" id="pin" name="pin" class="input" maxlength="6" required>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="dob">Date Of Birth</label>
                            <input type="date" id="date" name="dob" class="input" required>
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="contact">Contact No</label>
                            <input type="text" id="num" name="cnum" class="input" maxlength="10" required>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="gen">Gender</label>
                        <div class="gender">
                            
                            <div>
                                <label>
                                    <input type="radio" name="radio">
                                    <span>Male</span>
                                </label>
                                <label>
                                    <input type="radio" name="radio">
                                    <span>Female</span>
                                </label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button class="button">
                            Register
                            <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m6 17 5-5-5-5"></path><path d="m13 17 5-5-5-5"></path></svg>
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
