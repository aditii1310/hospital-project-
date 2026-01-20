<%@ page import="java.sql.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/hospital_db","root","root75"
    );

    PreparedStatement ps = conn.prepareStatement("DELETE FROM doctor WHERE doctor_id=?");
    ps.setInt(1, id);
    ps.executeUpdate();

    conn.close();
    response.sendRedirect("view_doctors.jsp");
%>
