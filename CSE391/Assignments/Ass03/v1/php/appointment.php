<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <?php include 'header.php'; ?>

    <main class="content-wrapper fontb">
        <section class="login-section">
            <br> <br>
            <h2>Set Up an Appointment with your Mechanic</h2>
            <form action="#" method="post" style="width: 300px; margin: 20px auto;">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="uname" name="name" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="car_color">Car Color:</label>
                    <input type="text" id="car_color" name="car_color" required>
                </div>
                <div class="form-group">
                    <label for="car_license">Car License Number:</label>
                    <input type="text" id="car_license" name="car_license" required>
                </div>
                <div class="form-group">
                    <label for="car_engine">Car Engine Number:</label>
                    <input type="text" id="car_engine" name="car_engine" required>
                </div>
                <div class="form-group">
                    <label for="appointment_date">Appointment Date:</label>
                    <input type="date" id="appointment_date" name="appointment_date" required>
                </div>
                <div class="form-group">
                    <label for="mechanic">Desired Mechanic:</label>
                    <select id="mechanic" name="mechanic" required>
                        <option value="mechanic1">Mechanic 1</option>
                        <option value="mechanic2">Mechanic 2</option>
                        <option value="mechanic3">Mechanic 3</option>
    
                    </select>
                </div>
                <button type="submit" class="login" style="width: 100%;">SUBMIT</button>
            </form>
            <p style="color: black;">If you are already registered, <a href="login.php">click here</a> to login.</p>
            <br> <br>
        </section>
    </main>

    <?php include 'footer.php'; ?>
</body>
</html>
