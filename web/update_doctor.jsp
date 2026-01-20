<%@ page import="java.sql.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75"
    );

    PreparedStatement ps = conn.prepareStatement("SELECT * FROM doctor WHERE doctor_id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>

<h2>Update Doctor</h2>

<form action="update_doctor_process.jsp" method="post">
    <input type="hidden" name="doctor_id" value="<%= rs.getInt("doctor_id") %>">

    Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br><br>
    Email: <input type="email" name="email" value="<%= rs.getString("email") %>"><br><br>
    Specialization: <input type="text" name="specialization" value="<%= rs.getString("specialization") %>"><br><br>
    Username: <input type="text" name="username" value="<%= rs.getString("username") %>"><br><br>
    Password: <input type="text" name="password" value="<%= rs.getString("password") %>"><br><br>

    <input type="submit" value="Update">
</form>
