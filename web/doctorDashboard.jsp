<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px 50px;
            background-color: #f4f7f8;
            color: #333;
        }

        h2, h3 {
            text-align: center;
            font-weight: bold;
            color: #2c3e50;
        }

        hr {
            border: 1px solid #ccc;
            margin: 20px 0;
        }

        /* ===== Add Patient Form ===== */
        .add-patient-form {
            background-color: #ffffff;
            width: 350px;
            margin: 0 auto 30px auto; /* center form and add bottom spacing */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 3px 10px rgba(0,0,0,0.1);
        }

        .add-patient-form input[type=text],
        .add-patient-form input[type=email],
        .add-patient-form input[type=password] {
            display: block;
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .add-patient-form button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 4px;
            background-color: #2980b9;
            color: white;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        .add-patient-form button:hover {
            background-color: #3498db;
        }

        /* ===== Tables ===== */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #2980b9;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #ecf0f1;
        }

        button {
            padding: 7px 15px;
            margin: 5px 0;
            border: none;
            border-radius: 4px;
            background-color: #2980b9;
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background-color: #3498db;
        }

        .logout-btn {
            float: right;
            background-color: #e74c3c;
        }

        .logout-btn:hover {
            background-color: #c0392b;
        }

        .form-inline input[type=text], .form-inline input[type=email] {
            width: 90px;
        }
    </style>
</head>
<body>

<form action="logout.jsp" method="post" style="text-align:right;">
    <input type="submit" value="Logout" class="logout-btn">
</form>

<hr>
<h2>Doctor Dashboard</h2>
<hr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75"
    );

    // ADD PATIENT
    if(request.getParameter("add") != null){
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO patient(name,email,phone,username,password) VALUES(?,?,?,?,?)"
        );
        ps.setString(1, request.getParameter("name"));
        ps.setString(2, request.getParameter("email"));
        ps.setString(3, request.getParameter("phone"));
        ps.setString(4, request.getParameter("username"));
        ps.setString(5, request.getParameter("password"));
        ps.executeUpdate();
        out.println("<script>alert('Patient Added');location='doctorDashboard.jsp';</script>");
    }

    // UPDATE PATIENT (NO USERNAME / PASSWORD)
    if(request.getParameter("update") != null){
        PreparedStatement ps = con.prepareStatement(
            "UPDATE patient SET name=?, email=?, phone=? WHERE patient_id=?"
        );
        ps.setString(1, request.getParameter("name"));
        ps.setString(2, request.getParameter("email"));
        ps.setString(3, request.getParameter("phone"));
        ps.setInt(4, Integer.parseInt(request.getParameter("patient_id")));
        ps.executeUpdate();
        out.println("<script>alert('Patient Updated');location='doctorDashboard.jsp';</script>");
    }

    // DELETE PATIENT
    if(request.getParameter("delete") != null){
        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM patient WHERE patient_id=?"
        );
        ps.setInt(1, Integer.parseInt(request.getParameter("patient_id")));
        ps.executeUpdate();
        out.println("<script>alert('Patient Deleted');location='doctorDashboard.jsp';</script>");
    }

    // ACCEPT / REJECT APPOINTMENT
    if(request.getParameter("accept") != null){
        PreparedStatement ps = con.prepareStatement(
            "UPDATE appointment SET status='Approved' WHERE appointment_id=?"
        );
        ps.setInt(1, Integer.parseInt(request.getParameter("appointment_id")));
        ps.executeUpdate();
    }

    if(request.getParameter("reject") != null){
        PreparedStatement ps = con.prepareStatement(
            "UPDATE appointment SET status='Rejected' WHERE appointment_id=?"
        );
        ps.setInt(1, Integer.parseInt(request.getParameter("appointment_id")));
        ps.executeUpdate();
    }
%>

<!-- ================= ADD PATIENT ================= -->
<h3>Add Patient</h3>

<div class="add-patient-form">
    <form method="post" autocomplete="off">
        <input type="text" style="display:none">
        <input type="password" style="display:none">

        Name: <input type="text" name="name" required>
        Email: <input type="email" name="email" required>
        Phone: <input type="text" name="phone" required>

        Username: <input type="text" name="username" autocomplete="off" placeholder="Enter username" required>
        Password: <input type="password" name="password" autocomplete="new-password" placeholder="Enter password" required>

        <button type="submit" name="add">Add Patient</button>
    </form>
</div>

<hr>

<!-- ================= PATIENT LIST ================= -->
<h3>Patient List</h3>
<table>
<tr>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Edit</th>
    <th>Delete</th>
</tr>

<%
ResultSet rs = con.createStatement().executeQuery("SELECT * FROM patient");
while(rs.next()){
%>
<tr>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("phone") %></td>

    <td>
        <form method="post" class="form-inline">
            <input type="hidden" name="patient_id" value="<%= rs.getInt("patient_id") %>">
            <input type="text" name="name" value="<%= rs.getString("name") %>">
            <input type="email" name="email" value="<%= rs.getString("email") %>">
            <input type="text" name="phone" value="<%= rs.getString("phone") %>">
            <button name="update">Save</button>
        </form>
    </td>

    <td>
        <form method="post">
            <input type="hidden" name="patient_id" value="<%= rs.getInt("patient_id") %>">
            <button name="delete">Delete</button>
        </form>
    </td>
</tr>
<% } %>
</table>

<hr>

<!-- ================= APPOINTMENTS ================= -->
<h3>Appointments</h3>
<table>
<tr>
    <th>Patient Name</th>
    <th>Email</th>
    <th>Date</th>
    <th>Message</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
ResultSet rsa = con.createStatement().executeQuery(
    "SELECT appointment_id, patient_name, email, date, message, status FROM appointment"
);
while(rsa.next()){
%>
<tr>
<form method="post">
    <td><%= rsa.getString("patient_name") %></td>
    <td><%= rsa.getString("email") %></td>
    <td><%= rsa.getString("date") %></td>
    <td><%= rsa.getString("message") %></td>
    <td><%= rsa.getString("status") %></td>
    <td>
        <input type="hidden" name="appointment_id" value="<%= rsa.getInt("appointment_id") %>">
        <button name="accept">Accept</button>
        <button name="reject">Reject</button>
    </td>
</form>
</tr>
<% } %>
</table>

<%
} catch(Exception e){
    out.println("Error: " + e.getMessage());
}
%>

</body>
</html>
