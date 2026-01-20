<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Dashboard</title>

    <link rel="stylesheet" href="style.css">

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f8fb;
            margin: 0;
            padding: 30px;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #1f3c88;
            font-weight: bold;
            margin-bottom: 20px;
        }

        h3 {
            color: #0b5ed7;
            font-weight: bold;
            margin-top: 30px;
            margin-bottom: 15px;
            border-bottom: 2px solid #cfd8dc;
            padding-bottom: 5px;
            text-align: center;
        }

        hr {
            border: none;
            height: 1px;
            background-color: #cfd8dc;
            margin: 30px 0;
        }

        /* ===== Forms ===== */
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            margin: 0 auto 30px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .appointment-form {
            max-width: 650px;
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-group {
            flex: 1;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        textarea {
            height: 90px;
        }

        .center-btn {
            text-align: center;
            margin-top: 15px;
        }

        input[type="submit"] {
            background-color: #0b5ed7;
            color: white;
            border: none;
            padding: 8px 18px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #084298;
        }

        /* ===== Logout Button ===== */
        form[action="logout.jsp"] {
            background: none;
            box-shadow: none;
            padding: 0;
            max-width: 100%;
            margin-bottom: 10px;
        }

        form[action="logout.jsp"] input[type="submit"] {
            background-color: #dc3545;
            float: right;
        }

        form[action="logout.jsp"] input[type="submit"]:hover {
            background-color: #b02a37;
        }

        /* ===== Tables ===== */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            margin-top: 15px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        th {
            background-color: #0b5ed7;
            color: white;
            padding: 10px;
            text-align: center;
        }

        td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>

<!-- ===== Logout ===== -->
<form action="logout.jsp" method="post">
    <input type="submit" value="Logout">
</form>

<hr>

<h2>Patient Dashboard</h2>

<%
    String patientUsername = (String) session.getAttribute("patient_username");
    if (patientUsername == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75");

    PreparedStatement psp = conn.prepareStatement(
        "SELECT * FROM patient WHERE username=?");
    psp.setString(1, patientUsername);
    ResultSet pr = psp.executeQuery();

    String patient_name = "";
    String patient_email = "";

    if (pr.next()) {
        patient_name = pr.getString("name");
        patient_email = pr.getString("email");
    }

    if ("book".equals(request.getParameter("action"))) {
        PreparedStatement psb = conn.prepareStatement(
            "INSERT INTO appointment(patient_name,email,date,message,doctor_id) VALUES(?,?,?,?,?)");
        psb.setString(1, patient_name);
        psb.setString(2, patient_email);
        psb.setString(3, request.getParameter("date"));
        psb.setString(4, request.getParameter("message"));
        psb.setInt(5, Integer.parseInt(request.getParameter("doctor_id")));
        psb.executeUpdate();
    }
%>

<!-- ================= BOOK APPOINTMENT ================= -->
<h3>Book Appointment</h3>

<form method="post" class="appointment-form">
    <input type="hidden" name="action" value="book">

    <div class="form-row">
        <div class="form-group">
            <label>Date:</label>
            <input type="date" name="date" required>
        </div>

        <div class="form-group">
            <label>Doctor:</label>
            <select name="doctor_id" required>
                <option value="">-- Select Doctor --</option>
                <%
                    Statement sd = conn.createStatement();
                    ResultSet rd = sd.executeQuery("SELECT * FROM doctor");
                    while (rd.next()) {
                %>
                <option value="<%= rd.getInt("doctor_id") %>">
                    <%= rd.getString("name") %> - <%= rd.getString("specialization") %>
                </option>
                <% } %>
            </select>
        </div>
    </div>

    <br>

    <label>Message:</label>
    <textarea name="message"></textarea>

    <div class="center-btn">
        <input type="submit" value="Book Appointment">
    </div>
</form>

<hr>

<!-- ================= MY APPOINTMENTS ================= -->
<h3>My Appointments</h3>

<table>
<tr>
    <th>Date</th>
    <th>Doctor</th>
    <th>Message / Diagnosis</th>
</tr>

<%
    PreparedStatement psx = conn.prepareStatement(
        "SELECT a.*, d.name AS doctorName FROM appointment a JOIN doctor d ON a.doctor_id=d.doctor_id WHERE a.email=?");
    psx.setString(1, patient_email);
    ResultSet ra = psx.executeQuery();

    while (ra.next()) {
%>
<tr>
    <td><%= ra.getDate("date") %></td>
    <td><%= ra.getString("doctorName") %></td>
    <td><%= ra.getString("message") %></td>
</tr>
<% } %>
</table>

<hr>

<!-- ================= AVAILABLE DOCTORS ================= -->
<h3>Available Doctors</h3>

<table>
<tr>
    <th>Name</th>
    <th>Email</th>
    <th>Specialization</th>
</tr>

<%
    Statement sd2 = conn.createStatement();
    ResultSet rd2 = sd2.executeQuery("SELECT * FROM doctor");

    while (rd2.next()) {
%>
<tr>
    <td><%= rd2.getString("name") %></td>
    <td><%= rd2.getString("email") %></td>
    <td><%= rd2.getString("specialization") %></td>
</tr>
<% } conn.close(); %>
</table>

</body>
</html>
