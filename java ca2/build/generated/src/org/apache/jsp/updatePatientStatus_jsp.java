package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

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
      response.setContentType("text/html");
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
      out.write("\n");

    String patientId = request.getParameter("patientId");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String firstName = "", lastName = "", gender = "", phoneNumber = "", address = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalsystem?useSSL=false", "root", "root75");

        String query = "SELECT * FROM patients WHERE patient_id = ?";
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
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>Update Patient</title>\n");
      out.write("    <style>\n");
      out.write("        body { font-family: Arial, sans-serif; text-align: center; }\n");
      out.write("        .container { width: 50%; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 10px; }\n");
      out.write("        input, select { width: 100%; padding: 10px; margin: 10px 0; }\n");
      out.write("        button { background: blue; color: white; padding: 10px; border: none; }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h2>Update Patient Details</h2>\n");
      out.write("        <form action=\"updatePatientServlet\" method=\"post\">\n");
      out.write("            <input type=\"hidden\" name=\"patientId\" value=\"");
      out.print( patientId );
      out.write("\">\n");
      out.write("            <label>First Name:</label>\n");
      out.write("            <input type=\"text\" name=\"firstName\" value=\"");
      out.print( firstName );
      out.write("\" required>\n");
      out.write("\n");
      out.write("            <label>Last Name:</label>\n");
      out.write("            <input type=\"text\" name=\"lastName\" value=\"");
      out.print( lastName );
      out.write("\" required>\n");
      out.write("\n");
      out.write("            <label>Gender:</label>\n");
      out.write("            <select name=\"gender\">\n");
      out.write("                <option value=\"Male\" ");
      out.print( gender.equals("Male") ? "selected" : "" );
      out.write(">Male</option>\n");
      out.write("                <option value=\"Female\" ");
      out.print( gender.equals("Female") ? "selected" : "" );
      out.write(">Female</option>\n");
      out.write("            </select>\n");
      out.write("\n");
      out.write("            <label>Phone Number:</label>\n");
      out.write("            <input type=\"text\" name=\"phoneNumber\" value=\"");
      out.print( phoneNumber );
      out.write("\" required>\n");
      out.write("\n");
      out.write("            <label>Address:</label>\n");
      out.write("            <input type=\"text\" name=\"address\" value=\"");
      out.print( address );
      out.write("\" required>\n");
      out.write("\n");
      out.write("            <button type=\"submit\">Update</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("\n");
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
