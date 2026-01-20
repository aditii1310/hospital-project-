<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>

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
                linear-gradient(rgba(255,255,255,0.85), rgba(255,255,255,0.85)),
                url("https://images.unsplash.com/photo-1579684385127-1ef15d508118?auto=format&fit=crop&w=1950&q=80");
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        form {
            background: #ffffff;
            padding: 35px 40px;
            width: 400px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        h2 {
            margin-bottom: 25px;
            color: #0d47a1;
            font-size: 26px;
            text-align: center;
        }

        label {
            color: #0d47a1;
            font-weight: bold;
            font-size: 14px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 14px;
            border-radius: 6px;
            border: 1px solid #bbdefb;
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #1976d2, #0d47a1);
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-link {
            margin-top: 15px;
            text-align: center;
        }

        .login-link a {
            color: #0d47a1;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</head>

<body>

<form method="post">
    <h2>Create Account</h2>

    <label>Select Role</label>
<select name="role" id="role" required onchange="showSpecialization()">
    <option value="patient">Patient</option>
    <option value="doctor">Doctor</option>
    <option value="receptionist">Receptionist</option>
</select>

<!-- Specialization field, hidden by default -->
<div id="specializationDiv" style="display:none; margin-top:10px;">
    <label>Specialization</label>
    <select name="specialization" id="specialization">
        <option value="General" selected>General</option>
        <option value="Cardiologist">Cardiologist</option>
        <option value="Dermatologist">Dermatologist</option>
        <option value="Neurologist">Neurologist</option>
        <option value="Pediatrician">Pediatrician</option>
    </select>
</div>

<script>
function showSpecialization() {
    var role = document.getElementById("role").value;
    var specDiv = document.getElementById("specializationDiv");
    if(role === "doctor") {
        specDiv.style.display = "block"; // show specialization dropdown
    } else {
        specDiv.style.display = "none"; // hide for other roles
    }
}
</script>

    </select>

    <label>Name</label>
    <input type="text" name="name">

    <label>Email</label>
    <input type="email" name="email">

    <label>Phone</label>
    <input type="text" name="phone">

    <label>Username</label>
    <input type="text" name="username" required>

    <label>Password</label>
    <input type="password" name="password" required>

    <button type="submit" name="signup">Sign Up</button>

    <div class="login-link">
        <a href="login.jsp">Already have an account? Login</a>
    </div>
</form>

<%
if(request.getParameter("signup") != null){
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75");

    String role = request.getParameter("role");

    if(role.equals("patient")){
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO patient(name,email,phone,username,password) VALUES(?,?,?,?,?)");
        ps.setString(1, request.getParameter("name"));
        ps.setString(2, request.getParameter("email"));
        ps.setString(3, request.getParameter("phone"));
        ps.setString(4, request.getParameter("username"));
        ps.setString(5, request.getParameter("password"));
        ps.executeUpdate();
    }

    else if(role.equals("doctor")){
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO doctor(name,email,specialization,username,password) VALUES(?,?,?,?,?)");
        ps.setString(1, request.getParameter("name"));
        ps.setString(2, request.getParameter("email"));
        ps.setString(3, "Not Assigned");
        ps.setString(4, request.getParameter("username"));
        ps.setString(5, request.getParameter("password"));
        ps.executeUpdate();
    }

    
    else if(role.equals("receptionist")){
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO receptionist(username,password,name,email,phone) VALUES(?,?,?,?,?)");

    ps.setString(1, request.getParameter("username"));
    ps.setString(2, request.getParameter("password"));
    ps.setString(3, request.getParameter("name"));
    ps.setString(4, request.getParameter("email"));
    ps.setString(5, request.getParameter("phone"));

    int rows = ps.executeUpdate();
    out.println("Rows inserted: " + rows); // DEBUG
}


    out.println("<script>alert('Registration Successful');location.href='login.jsp';</script>");
}
%>

</body>
</html>
