<%@ page import="java.sql.*" %>
<head>
<link rel="stylesheet" href="style.css">
<style>
    /* ===== Global Styles ===== */
    body {
        font-family: Arial, sans-serif;
        margin: 30px;
        background-color: #f7f7f7;
        color: #333;
    }

    h2, h3, h4 {
        font-weight: bold;
        color: #2c3e50;
        margin-top: 20px;
        margin-bottom: 10px;
    }

    hr {
        border: 1px solid #ccc;
        margin: 20px 0;
    }

    /* ===== Forms ===== */
    form {
        margin-bottom: 20px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="submit"],
    textarea {
        padding: 8px;
        margin-top: 5px;
        margin-bottom: 15px;
        width: 100%;
        max-width: 400px;
        box-sizing: border-box;
    }

    textarea {
        height: 80px;
    }

    input[type="submit"] {
        width: auto;
        background-color: #3498db;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        padding: 8px 15px;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
    }

    /* Logout button */
    form[action="logout.jsp"] input[type="submit"] {
        background-color: #e74c3c;
        padding: 6px 12px;
        margin: 0;
    }

    form[action="logout.jsp"] input[type="submit"]:hover {
        background-color: #c0392b;
    }

    /* ===== Tables ===== */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 30px;
        background-color: white;
        box-shadow: 0 0 5px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 10px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #3498db;
        color: white;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    /* Inline forms in table */
    form[style*="display:inline"] input[type="submit"] {
        padding: 5px 10px;
        margin: 0 5px 0 0;
        font-size: 0.9em;
    }
</style>
</head>

<body>

<!-- LOGOUT FIRST -->
<form action="logout.jsp" method="post" style="float:right;">
    <input type="submit" value="Logout">
</form>

<h2>Admin Dashboard</h2>
<hr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/hospital_db","root","root75");
%>

<!-- ================= DOCTOR SECTION ================= -->

<h3>Manage Doctors</h3>

<h4>Add Doctor</h4>
<form method="post">
<input type="hidden" name="action" value="add">
Name: <input type="text" name="name"><br>
Email: <input type="email" name="email"><br>
Specialization: <input type="text" name="specialization"><br>
Username: <input type="text" name="username" autocomplete="off"><br>
Password: <input type="password" name="password" autocomplete="new-password"><br>
<input type="submit" value="Add Doctor">
</form>

<%
if ("add".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"INSERT INTO doctor(name,email,specialization,username,password) VALUES(?,?,?,?,?)");
ps.setString(1, request.getParameter("name"));
ps.setString(2, request.getParameter("email"));
ps.setString(3, request.getParameter("specialization"));
ps.setString(4, request.getParameter("username"));
ps.setString(5, request.getParameter("password"));
ps.executeUpdate();
}

if ("delete".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"DELETE FROM doctor WHERE doctor_id=?");
ps.setInt(1, Integer.parseInt(request.getParameter("id")));
ps.executeUpdate();
}

if ("save".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"UPDATE doctor SET name=?,email=?,specialization=? WHERE doctor_id=?");
ps.setString(1, request.getParameter("name"));
ps.setString(2, request.getParameter("email"));
ps.setString(3, request.getParameter("specialization"));
ps.setInt(4, Integer.parseInt(request.getParameter("doctor_id")));
ps.executeUpdate();
}
%>

<h4>All Doctors</h4>
<table border="1">
<tr>
<th>Name</th><th>Email</th><th>Specialization</th><th>Username</th><th>Action</th>
</tr>

<%
ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM doctor");
while(rs.next()){
%>
<tr>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("email") %></td>
<td><%= rs.getString("specialization") %></td>
<td><%= rs.getString("username") %></td>
<td>
<form method="post" style="display:inline;">
<input type="hidden" name="action" value="update">
<input type="hidden" name="doctor_id" value="<%= rs.getInt("doctor_id") %>">
<input type="submit" value="Update">
</form>

<form method="post" style="display:inline;">
<input type="hidden" name="action" value="delete">
<input type="hidden" name="id" value="<%= rs.getInt("doctor_id") %>">
<input type="submit" value="Delete">
</form>
</td>
</tr>
<% } %>
</table>

<%
if ("update".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"SELECT * FROM doctor WHERE doctor_id=?");
ps.setInt(1, Integer.parseInt(request.getParameter("doctor_id")));
ResultSet edit = ps.executeQuery();
if(edit.next()){
%>

<h3>Edit Doctor</h3>
<form method="post">
<input type="hidden" name="action" value="save">
<input type="hidden" name="doctor_id" value="<%= edit.getInt("doctor_id") %>">
Name: <input type="text" name="name" value="<%= edit.getString("name") %>"><br>
Email: <input type="text" name="email" value="<%= edit.getString("email") %>"><br>
Specialization: <input type="text" name="specialization" value="<%= edit.getString("specialization") %>"><br>
<input type="submit" value="Save Changes">
</form>
<% }} %>

<hr>

<!-- ================= PATIENT SECTION ================= -->

<h3>All Patients</h3>

<%
if ("pdelete".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"DELETE FROM patient WHERE patient_id=?");
ps.setInt(1, Integer.parseInt(request.getParameter("patient_id")));
ps.executeUpdate();
}

if ("psave".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"UPDATE patient SET name=?,email=?,phone=? WHERE patient_id=?");
ps.setString(1, request.getParameter("name"));
ps.setString(2, request.getParameter("email"));
ps.setString(3, request.getParameter("phone"));
ps.setInt(4, Integer.parseInt(request.getParameter("patient_id")));
ps.executeUpdate();
}
%>

<table border="1">
<tr>
<th>Name</th><th>Email</th><th>Phone</th><th>Username</th><th>Action</th>
</tr>

<%
ResultSet rp = conn.createStatement().executeQuery("SELECT * FROM patient");
while(rp.next()){
%>
<tr>
<td><%= rp.getString("name") %></td>
<td><%= rp.getString("email") %></td>
<td><%= rp.getString("phone") %></td>
<td><%= rp.getString("username") %></td>
<td>
<form method="post" style="display:inline;">
<input type="hidden" name="action" value="pupdate">
<input type="hidden" name="patient_id" value="<%= rp.getInt("patient_id") %>">
<input type="submit" value="Update">
</form>

<form method="post" style="display:inline;">
<input type="hidden" name="action" value="pdelete">
<input type="hidden" name="patient_id" value="<%= rp.getInt("patient_id") %>">
<input type="submit" value="Delete">
</form>
</td>
</tr>
<% } %>
</table>

<%
if ("pupdate".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"SELECT * FROM patient WHERE patient_id=?");
ps.setInt(1, Integer.parseInt(request.getParameter("patient_id")));
ResultSet pe = ps.executeQuery();
if(pe.next()){
%>

<h3>Edit Patient</h3>
<form method="post">
<input type="hidden" name="action" value="psave">
<input type="hidden" name="patient_id" value="<%= pe.getInt("patient_id") %>">
Name: <input type="text" name="name" value="<%= pe.getString("name") %>"><br>
Email: <input type="text" name="email" value="<%= pe.getString("email") %>"><br>
Phone: <input type="text" name="phone" value="<%= pe.getString("phone") %>"><br>
<input type="submit" value="Save Changes">
</form>
<% }} %>

<hr>

<!-- ================= RECEPTIONIST SECTION ================= -->

<h3>Manage Receptionists</h3>

<h4>Add Receptionist</h4>
<form method="post">
<input type="hidden" name="action" value="radd">
Name: <input type="text" name="rname"><br>
Email: <input type="email" name="remail"><br>
Phone: <input type="text" name="rphone"><br>
Username: <input type="text" name="rusername" autocomplete="off"><br>
Password: <input type="password" name="rpassword" autocomplete="new-password"><br>
<input type="submit" value="Add Receptionist">
</form>

<%
if ("radd".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"INSERT INTO receptionist(name,email,phone,username,password) VALUES(?,?,?,?,?)");
ps.setString(1, request.getParameter("rname"));
ps.setString(2, request.getParameter("remail"));
ps.setString(3, request.getParameter("rphone"));
ps.setString(4, request.getParameter("rusername"));
ps.setString(5, request.getParameter("rpassword"));
ps.executeUpdate();
}

if ("rdelete".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"DELETE FROM receptionist WHERE receptionist_id=?");
ps.setInt(1, Integer.parseInt(request.getParameter("rid")));
ps.executeUpdate();
}

if ("rsave".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"UPDATE receptionist SET name=?,email=?,phone=? WHERE receptionist_id=?");
ps.setString(1, request.getParameter("name"));
ps.setString(2, request.getParameter("email"));
ps.setString(3, request.getParameter("phone"));
ps.setInt(4, Integer.parseInt(request.getParameter("receptionist_id")));
ps.executeUpdate();
}
%>

<h4>All Receptionists</h4>
<table border="1">
<tr>
<th>Name</th><th>Email</th><th>Phone</th><th>Username</th><th>Action</th>
</tr>

<%
ResultSet rr = conn.createStatement().executeQuery("SELECT * FROM receptionist");
while(rr.next()){
%>
<tr>
<td><%= rr.getString("name") %></td>
<td><%= rr.getString("email") %></td>
<td><%= rr.getString("phone") %></td>
<td><%= rr.getString("username") %></td>
<td>
<form method="post" style="display:inline;">
<input type="hidden" name="action" value="rupdate">
<input type="hidden" name="receptionist_id" value="<%= rr.getInt("receptionist_id") %>">
<input type="submit" value="Update">
</form>

<form method="post" style="display:inline;">
<input type="hidden" name="action" value="rdelete">
<input type="hidden" name="rid" value="<%= rr.getInt("receptionist_id") %>">
<input type="submit" value="Delete">
</form>
</td>
</tr>
<% } %>
</table>

<%
if ("rupdate".equals(request.getParameter("action"))) {
PreparedStatement ps = conn.prepareStatement(
"SELECT * FROM receptionist WHERE receptionist_id=?");
ps.setInt(1, Integer.parseInt(request.getParameter("receptionist_id")));
ResultSet re = ps.executeQuery();
if(re.next()){
%>

<h3>Edit Receptionist</h3>
<form method="post">
<input type="hidden" name="action" value="rsave">
<input type="hidden" name="receptionist_id" value="<%= re.getInt("receptionist_id") %>">
Name: <input type="text" name="name" value="<%= re.getString("name") %>"><br>
Email: <input type="text" name="email" value="<%= re.getString("email") %>"><br>
Phone: <input type="text" name="phone" value="<%= re.getString("phone") %>"><br>
<input type="submit" value="Save Changes">
</form>
<% }} %>

<%
conn.close();
%>
