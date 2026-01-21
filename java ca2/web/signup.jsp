<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup - Hospital Management</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body{
            background:url('https://img.freepik.com/free-psd/abstract-blur-luxury-hospital-corridor-generative-ai_587448-2121.jpg');
            background-repeat:no-repeat;
            background-size:cover;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Signup</h1>
        <form action="SignupServlet" method="POST">
            <input type="text" name="username" placeholder="Enter Username" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <button type="submit">Sign Up</button>
        </form>
        <p>Already have an account? <a href="login.jsp">Login here</a>.</p>
    </div>
</body>
</html>
