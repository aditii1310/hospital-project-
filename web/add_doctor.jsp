<%-- 
    Document   : add_doctor.jsp
    Created on : 20 Nov, 2025, 8:20:13 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h2>Add New Doctor</h2>

<form action="add_doctor_process.jsp" method="post">
    Name: <input type="text" name="name"><br><br>
    Email: <input type="email" name="email"><br><br>
    Specialization: <input type="text" name="specialization"><br><br>
    Username: <input type="text" name="username"><br><br>
    Password: <input type="password" name="password"><br><br>

    <input type="submit" value="Add Doctor">
</form>

    </body>
</html>
