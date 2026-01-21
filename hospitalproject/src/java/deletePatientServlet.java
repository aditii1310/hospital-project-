import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class deletePatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("patientId");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalsystem?useSSL=false", "root", "root75");
            String query = "DELETE FROM patients WHERE patient_id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, patientId);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("doctorDashboard.jsp"); // Redirect to dashboard after deletion
            } else {
                response.getWriter().println("Delete failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
