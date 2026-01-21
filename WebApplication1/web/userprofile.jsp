<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>User Profile</h2>
    <p>Welcome, <%= session.getAttribute("user_name") %></p>
</body>
</html>
