<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    String patientId = request.getParameter("patientId");

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalsystem", "root", "root75");

        String deleteQuery = "DELETE FROM patients WHERE patient_id = ?";
        stmt = conn.prepareStatement(deleteQuery);
        stmt.setString(1, patientId);

        int rowsDeleted = stmt.executeUpdate();

        if (rowsDeleted > 0) {
            out.println("<script>alert('Patient removed successfully!');window.location='doctorDashboard.jsp';</script>");
        } else {
            out.println("<script>alert('Error removing patient!');window.location='doctorDashboard.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Error: " + e.getMessage() + "');window.location='doctorDashboard.jsp';</script>");
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
