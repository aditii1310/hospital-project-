<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard - Login</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background: url('https://img.freepik.com/free-psd/abstract-blur-luxury-hospital-corridor-generative-ai_587448-2121.jpg') no-repeat center center/cover; /* Background image */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full screen height */
            margin: 0;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Dark overlay for better visibility */
        }
        .login-container {
            position: relative;
            background: white;
            padding: 2rem;
            border-radius: 15px; /* Rounded corners */
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3); /* Smooth shadow */
            text-align: center;
            width: 350px; /* Wider box */
            z-index: 1; /* Ensures form is above overlay */
            border: 3px solid #007bff; /* Blue border */
        }
        .login-container h2 {
            margin-bottom: 1rem;
            color: #007bff; /* Blue heading */
            font-size: 24px;
        }
        .login-container label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
            color: #333;
        }
        .login-container input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 2px solid #007bff; /* Blue border */
            border-radius: 8px;
            outline: none;
            font-size: 16px;
        }
        .login-container input:focus {
            border-color: #0056b3; /* Darker blue on focus */
            box-shadow: 0px 0px 8px rgba(0, 91, 187, 0.6);
        }
        .login-container button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 18px;
            cursor: pointer;
            border-radius: 8px;
            transition: 0.3s;
            font-weight: bold;
        }
        .login-container button:hover {
            background-color: #0056b3;
            box-shadow: 0px 0px 10px rgba(0, 91, 187, 0.7);
        }
    </style>
</head>
<body>

    <div class="overlay"></div> <!-- Dark overlay effect -->

    <div class="login-container">
        <h2>Doctor Login</h2>
        <form action="LoginServlet" method="post">
            <label>Enter Username:</label>
            <input type="text" name="username" required>
            <label>Enter Password:</label>
            <input type="password" name="password" required>
            <button type="submit">Login</button>
        </form>
    </div>

</body>
</html>
