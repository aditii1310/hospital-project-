<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital Login</title>

    <!-- ADDED CSS ONLY -->
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            min-height: 100vh;
            background:
                linear-gradient(rgba(255,255,255,0.88), rgba(255,255,255,0.88)),
                url("https://images.unsplash.com/photo-1579684385127-1ef15d508118");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            text-align: center;
        }

        form {
            background: #ffffff;
            padding: 35px 40px;
            width: 380px;
            border-radius: 12px;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.25);
        }

        h2 {
            margin-bottom: 25px;
            color: #0d47a1;
            font-size: 26px;
            font-weight: bold;
            text-align: center;
        }

        label {
            color: #0d47a1;
            font-weight: bold;
            font-size: 14px;
        }

        input, select {
            width: 100%;
            padding: 10px 12px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #bbdefb;
            font-size: 14px;
            outline: none;
        }

        input:focus, select:focus {
            border-color: #1976d2;
            box-shadow: 0 0 6px rgba(25, 118, 210, 0.5);
        }

        button {
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            background: linear-gradient(135deg, #1976d2, #0d47a1);
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            opacity: 0.9;
        }

        .error {
            margin-top: 15px;
            color: red;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>

<body>

<div class="container">

    <form method="post">
        <h2>Login</h2>

        <label>Login As:</label><br>
        <select name="role">
            <option value="admin">Admin</option>
            <option value="doctor">Doctor</option>
            <option value="patient">Patient</option>
            <option value="receptionist">Receptionist</option>
        </select><br><br>

        <label>Username:</label><br>
        <input type="text" name="username" required><br><br>

        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>

        <button type="submit">Login</button>
    </form>

<%
String role = request.getParameter("role");
String user = request.getParameter("username");
String pass = request.getParameter("password");

if (user != null && pass != null) {

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db", "root", "root75"
    );

    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean valid = false;

    if ("admin".equals(role)) {
        ps = con.prepareStatement(
            "SELECT * FROM admin WHERE username=? AND password=?"
        );

    } else if ("doctor".equals(role)) {
        ps = con.prepareStatement(
            "SELECT * FROM doctor WHERE username=? AND password=?"
        );

    } else if ("patient".equals(role)) {
        ps = con.prepareStatement(
            "SELECT * FROM patient WHERE username=? AND password=?"
        );

    } else if ("receptionist".equals(role)) {
        ps = con.prepareStatement(
            "SELECT * FROM receptionist WHERE username=? AND password=?"
        );
    }

    ps.setString(1, user);
    ps.setString(2, pass);
    rs = ps.executeQuery();

    if (rs.next()) {
        valid = true;
    }

    if (valid) {

        if ("admin".equals(role)) {
            session.setAttribute("admin_username", user);
            response.sendRedirect("adminDashboard.jsp");

        } else if ("doctor".equals(role)) {
            session.setAttribute("doctor_username", user);
            response.sendRedirect("doctorDashboard.jsp");

        } else if ("patient".equals(role)) {
            session.setAttribute("patient_username", user);
            response.sendRedirect("patientDashboard.jsp");

        } else if ("receptionist".equals(role)) {
            session.setAttribute("receptionist_username", user);
            response.sendRedirect("reception.jsp");
        }

    } else {
%>
        <div class="error">Invalid Username or Password!</div>
<%
    }
}
%>

</div>

</body>
</html>
