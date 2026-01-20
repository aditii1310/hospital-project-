<%@ page import="java.sql.*" %>

<%
    int id = Integer.parseInt(request.getParameter("doctor_id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String specialization = request.getParameter("specialization");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75"
    );

    PreparedStatement ps = conn.prepareStatement(
        "UPDATE doctor SET name=?, email=?, specialization=?, username=?, password=? WHERE doctor_id=?"
    );

    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, specialization);
    ps.setString(4, username);
    ps.setString(5, password);
    ps.setInt(6, id);

    ps.executeUpdate();
    conn.close();
    response.sendRedirect("view_doctors.jsp");
%>
