<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Receptionist Dashboard</title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f8fb;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            font-weight: bold;
            color: #1f3c88;
            margin-bottom: 20px;
        }

        h2 {
            color: #0b5ed7;
            font-weight: bold;
            margin-top: 30px;
            margin-bottom: 15px;
            border-bottom: 2px solid #cfd8dc;
            padding-bottom: 5px;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 250px;
            padding: 6px;
            margin-left: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #0b5ed7;
            color: white;
            border: none;
            padding: 8px 16px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #084298;
        }

        form[action="logout.jsp"] input[type="submit"] {
            background-color: #dc3545;
        }

        form[action="logout.jsp"] input[type="submit"]:hover {
            background-color: #b02a37;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            margin-top: 15px;
        }

        th {
            background-color: #0b5ed7;
            color: white;
            padding: 10px;
            text-align: center;
            font-weight: bold;
        }

        td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        hr {
            border: none;
            height: 1px;
            background-color: #cfd8dc;
            margin: 30px 0;
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type=number] {
            -moz-appearance: textfield;
        }
    </style>
</head>

<body>

<h1>Receptionist Dashboard</h1>

<form action="logout.jsp" method="post" style="text-align:right;">
    <input type="submit" value="Logout">
</form>

<hr>

<h2>Update Patient Vitals</h2>

<form method="post">
    <input type="hidden" name="action" value="vitals">

    Patient ID: <input type="number" name="patient_id" required><br><br>
    Temperature: <input type="number" step="0.1" name="temperature" required><br><br>
    Blood Pressure: <input type="number" step="0.1" name="blood_pressure" required><br><br>
    Pulse: <input type="number" name="pulse" required><br><br>
    Oxygen Level: <input type="number" step="0.1" name="oxygen_level" required><br><br>
    Recovery Notes:
    <input type="text" name="recovery_notes"
           pattern="[A-Za-z\s]+" required><br><br>

    <input type="submit" value="Update Vitals">
</form>

<hr>

<h2>Manage Medicine Stock</h2>

<form method="post">
    <input type="hidden" name="action" value="addMedicine">
    Medicine Name: <input type="text" name="med_name"><br><br>
    Quantity: <input type="text" name="quantity"><br><br>
    Expiry Date: <input type="date" name="expiry_date"><br><br>
    <input type="submit" value="Add Medicine">
</form>

<form method="post">
    <input type="hidden" name="action" value="medicine">
    Medicine ID: <input type="text" name="med_id"><br><br>
    New Quantity: <input type="text" name="quantity"><br><br>
    <input type="submit" value="Update Medicine">
</form>

<form method="post">
    <input type="hidden" name="action" value="deleteMedicine">
    Medicine ID: <input type="text" name="med_id"><br><br>
    <input type="submit" value="Delete Medicine">
</form>

<hr>

<h2>Generate Bill</h2>

<form method="post">
    <input type="hidden" name="action" value="billing">
    Patient ID: <input type="text" name="patient_id"><br><br>
    Doctor ID: <input type="text" name="doctor_id"><br><br>
    Consultation Fee: <input type="text" name="consultation_fee"><br><br>
    Medicine Cost: <input type="text" name="medicine_cost"><br><br>
    <input type="submit" value="Generate Bill">
</form>

<hr>

<%
String action = request.getParameter("action");

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75");

    if("vitals".equals(action)){
        PreparedStatement ps = con.prepareStatement(
        "INSERT INTO patient_vitals VALUES (?,?,?,?,?,?)");

        ps.setInt(1, Integer.parseInt(request.getParameter("patient_id")));
        ps.setDouble(2, Double.parseDouble(request.getParameter("temperature")));
        ps.setDouble(3, Double.parseDouble(request.getParameter("blood_pressure")));
        ps.setInt(4, Integer.parseInt(request.getParameter("pulse")));
        ps.setDouble(5, Double.parseDouble(request.getParameter("oxygen_level")));
        ps.setString(6, request.getParameter("recovery_notes"));
        ps.executeUpdate();
    }

    if("addMedicine".equals(action)){
        PreparedStatement ps = con.prepareStatement(
        "INSERT INTO medicine_stock(med_name, quantity, expiry_date) VALUES (?,?,?)");
        ps.setString(1, request.getParameter("med_name"));
        ps.setInt(2, Integer.parseInt(request.getParameter("quantity")));
        ps.setString(3, request.getParameter("expiry_date"));
        ps.executeUpdate();
    }

    if("medicine".equals(action)){
        PreparedStatement ps = con.prepareStatement(
        "UPDATE medicine_stock SET quantity=? WHERE med_id=?");
        ps.setInt(1, Integer.parseInt(request.getParameter("quantity")));
        ps.setInt(2, Integer.parseInt(request.getParameter("med_id")));
        ps.executeUpdate();
    }

    if("deleteMedicine".equals(action)){
        PreparedStatement ps = con.prepareStatement(
        "DELETE FROM medicine_stock WHERE med_id=?");
        ps.setInt(1, Integer.parseInt(request.getParameter("med_id")));
        ps.executeUpdate();
    }

    if("billing".equals(action)){
        double fee = Double.parseDouble(request.getParameter("consultation_fee"));
        double med = Double.parseDouble(request.getParameter("medicine_cost"));

        PreparedStatement ps = con.prepareStatement(
        "INSERT INTO billing(patient_id, doctor_id, consultation_fee, medicine_cost, total_amount) VALUES (?,?,?,?,?)");
        ps.setInt(1, Integer.parseInt(request.getParameter("patient_id")));
        ps.setInt(2, Integer.parseInt(request.getParameter("doctor_id")));
        ps.setDouble(3, fee);
        ps.setDouble(4, med);
        ps.setDouble(5, fee + med);
        ps.executeUpdate();
    }

} catch(Exception e){
    out.println("Error: "+e);
}
%>

<h2>All Patient Vitals</h2>

<table border="1">
<tr>
    <th>Temp</th>
    <th>BP</th>
    <th>Pulse</th>
    <th>Oxygen</th>
</tr>

<%
try{
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(
        "SELECT temperature, blood_pressure, pulse, oxygen_level FROM patient_vitals");

    while(rs.next()){
%>
<tr>
    <td><%=rs.getString(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(4)%></td>
</tr>
<% }
} catch(Exception e){} %>
</table>

<h2>Medicine Stock</h2>

<table border="1">
<tr>
    <th>Medicine Name</th>
    <th>Expiry Date</th>
</tr>

<%
try{
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(
        "SELECT med_name, expiry_date FROM medicine_stock");

    while(rs.next()){
%>
<tr>
    <td><%=rs.getString(1)%></td>
    <td><%=rs.getString(2)%></td>
</tr>
<% }
} catch(Exception e){} %>
</table>

<h2>Billing Records</h2>

<table border="1">
<tr>
    <th>Consultation Fee</th>
    <th>Medicine Cost</th>
    <th>Total Amount</th>
    <th>Bill Date</th>
</tr>

<%
try{
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(
        "SELECT consultation_fee, medicine_cost, total_amount, bill_date FROM billing");

    while(rs.next()){
%>
<tr>
    <td><%=rs.getDouble(1)%></td>
    <td><%=rs.getDouble(2)%></td>
    <td><%=rs.getDouble(3)%></td>
    <td><%=rs.getString(4)%></td>
</tr>
<% }
} catch(Exception e){} %>
</table>

</body>
</html>
