import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String date = request.getParameter("date");
        String message = request.getParameter("message");

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalsystem?useSSL=false", "root", "root75");

            // Insert appointment data into the database
            String query = "INSERT INTO appointments (name, email, date, message) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, date);
            pstmt.setString(4, message);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                out.println("<script>alert('Appointment booked successfully!');</script>");
                response.sendRedirect("doctorDashboard.jsp"); // Redirect to homepage or confirmation page
            } else {
                out.println("<script>alert('Failed to book appointment.');</script>");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        }
    }
}
