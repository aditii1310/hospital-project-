<%@ page import="java.sql.*" %>

<h2>All Patients</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Username</th>
</tr>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75"
    );

    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM patient");

    while (rs.next()) {
%>

<tr>
    <td><%= rs.getInt("patient_id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("phone") %></td>
    <td><%= rs.getString("username") %></td>
</tr>

<%
    }
    conn.close();
%>
</table>
