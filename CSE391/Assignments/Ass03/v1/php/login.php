<link rel="stylesheet" href="../style.css">

<?php
include 'header.php';
include 'db_connect.php';  

// Checking if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usernameOrEmail = $_POST['username_or_email'];
    $password = $_POST['password'];
 
    $sql = "SELECT * FROM Client WHERE Username = '$usernameOrEmail' OR Email = '$usernameOrEmail'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        // User found
        $row = $result->fetch_assoc();
        $storedPassword = $row['PasswordHash'];  

        if (password_verify($password, $storedPassword)) {
 
            // echo "Login successful!";
            // Redirect to dashboard or other page
            // header("Location: dashboard.php");
        } else {
            echo "Invalid password";
        }
    } else {
        echo "User not found";
    }
}
?>

<main class="content-wrapper fontb">
    <section class="login-section">
        <h2>Login</h2>
        <form action="#" method="post">
            <div class="form-group">
                <label for="username_or_email">Email/Username:</label>
                <input type="text" id="username_or_email" name="username_or_email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="login">Login</button>
        </form>
        <p style="color: black;">If you are not registered, <a href="signup.php">click here</a> to sign up.</p>
    </section>
</main>

<?php include 'footer.php'; ?>
