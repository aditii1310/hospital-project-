<%@ page import="java.sql.*" %>

<h2>All Doctors</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Specialization</th>
    <th>Username</th>
    <th>Action</th>
</tr>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75"
    );

    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM doctor");

    while (rs.next()) {
%>

<tr>
    <td><%= rs.getInt("doctor_id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("specialization") %></td>
    <td><%= rs.getString("username") %></td>
    <td>
        <a href="update_doctor.jsp?id=<%= rs.getInt("doctor_id") %>">Update</a> |
        <a href="delete_doctor.jsp?id=<%= rs.getInt("doctor_id") %>">Delete</a>
    </td>
</tr>

<%
    }
    conn.close();
%>
</table>
