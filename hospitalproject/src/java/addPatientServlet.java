
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

@WebServlet("/addPatientServlet")
public class addPatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String dob=request.getParameter("dob");
        String phone = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalsystem?useSSL=false", "root", "root75");
            
            // SQL Insert statement
            String sql = "INSERT INTO patients ( first_name, last_name, gender,date_of_birth, phone_number, address) VALUES (?, ?, ?, ?, ?,?)";
            pstmt = conn.prepareStatement(sql);
            
           
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, gender);
            pstmt.setString(4,dob);
            pstmt.setInt(5, Integer.parseInt(phone));
            pstmt.setString(6, address);
            
            // Execute update
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("doctorDashboard.jsp");
            } else {
                out.println("<h3>Failed to add patient.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
