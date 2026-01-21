import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatePatientServlet")
public class updatePatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("patientId");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalsystem?useSSL=false&allowPublicKeyRetrieval=true", "root", "root75");

            String query = "UPDATE patients SET first_name = ?, last_name = ?, gender = ?, phone_number = ?, address = ? WHERE patient_id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, gender);
            stmt.setString(4, phoneNumber);
            stmt.setString(5, address);
            stmt.setString(6, patientId);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("doctorDashboard.jsp?message=Patient updated successfully");
            } else {
                response.getWriter().println("<script>alert('Update failed!');window.location='doctorDashboard.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error: " + e.getMessage() + "');window.location='doctorDashboard.jsp';</script>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
