package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class updatePatientStatus_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Update Patient</title>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <h2>Update Patient Phone Number</h2>\n");
      out.write("    ");

        String patientId = request.getParameter("patientId");
        String firstName = "";
        String lastName = "";
        String gender = "";
        String phoneNumber = "";
        String address = "";
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalsystem?useSSL=false", "root", "root75");
            
            String query = "SELECT first_name, last_name, gender, phone_number, address FROM patients WHERE patient_id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, patientId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                firstName = rs.getString("first_name");
                lastName = rs.getString("last_name");
                gender = rs.getString("gender");
                phoneNumber = rs.getString("phone_number");
                address = rs.getString("address");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    
      out.write("\n");
      out.write("    \n");
      out.write("    <form action=\"updatePatientServlet\" method=\"post\">\n");
      out.write("        <input type=\"hidden\" name=\"patientId\" value=\"");
      out.print( patientId );
      out.write("\" />\n");
      out.write("        <input type=\"hidden\" name=\"firstName\" value=\"");
      out.print( firstName );
      out.write("\" />\n");
      out.write("        <input type=\"hidden\" name=\"lastName\" value=\"");
      out.print( lastName );
      out.write("\" />\n");
      out.write("        <input type=\"hidden\" name=\"gender\" value=\"");
      out.print( gender );
      out.write("\" />\n");
      out.write("       \n");
      out.write("        <input type=\"hidden\" name=\"address\" value=\"");
      out.print( address );
      out.write("\" />\n");
      out.write("        <p><strong>First Name:</strong> ");
      out.print( firstName );
      out.write("</p>\n");
      out.write("        <p><strong>Last Name:</strong> ");
      out.print( lastName );
      out.write("</p>\n");
      out.write("        <p><strong>Gender:</strong> ");
      out.print( gender );
      out.write("</p>\n");
      out.write("        <p><strong>Address:</strong> ");
      out.print( address );
      out.write("</p>\n");
      out.write("        <label for=\"phoneNumber\">New Phone Number:</label>\n");
      out.write("        <input type=\"text\" id=\"phoneNumber\" name=\"phoneNumber\" value=\"");
      out.print( phoneNumber );
      out.write("\" required />\n");
      out.write("        <br><br>\n");
      out.write("        <input type=\"submit\" value=\"Update Phone Number\" />\n");
      out.write("    </form>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
