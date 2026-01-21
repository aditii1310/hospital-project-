package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class updatePatientS_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');

    String patientId = request.getParameter("patientId");
    String firstName = "", lastName = "", gender = "", phoneNumber = "", address = "";

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalsystem?useSSL=false&allowPublicKeyRetrieval=true", "root", "root75");
         PreparedStatement stmt = conn.prepareStatement("SELECT * FROM patients WHERE patient_id = ?")) {
        
        stmt.setString(1, patientId);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            firstName = rs.getString("first_name");
            lastName = rs.getString("last_name");
            gender = rs.getString("gender");
            phoneNumber = rs.getString("phone_number");
            address = rs.getString("address");
        }
        rs.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>Update Patient</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("            max-width: 400px;\n");
      out.write("            margin: 50px auto;\n");
      out.write("            padding: 20px;\n");
      out.write("            border: 1px solid #ccc;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);\n");
      out.write("        }\n");
      out.write("        h2 {\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        form {\n");
      out.write("            display: flex;\n");
      out.write("            flex-direction: column;\n");
      out.write("        }\n");
      out.write("        label {\n");
      out.write("            font-weight: bold;\n");
      out.write("            margin-top: 10px;\n");
      out.write("        }\n");
      out.write("        input, select, button {\n");
      out.write("            padding: 8px;\n");
      out.write("            margin-top: 5px;\n");
      out.write("            font-size: 16px;\n");
      out.write("            border: 1px solid #ccc;\n");
      out.write("            border-radius: 5px;\n");
      out.write("        }\n");
      out.write("        button {\n");
      out.write("            margin-top: 15px;\n");
      out.write("            background-color: #28a745;\n");
      out.write("            color: white;\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("        button:hover {\n");
      out.write("            background-color: #218838;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <h2>Update Patient Details</h2>\n");
      out.write("    <form action=\"updatePatientServlet\" method=\"post\">\n");
      out.write("        <input type=\"hidden\" name=\"patientId\" value=\"");
      out.print( patientId );
      out.write("\">\n");
      out.write("\n");
      out.write("        <label>First Name:</label>\n");
      out.write("        <input type=\"text\" name=\"firstName\" value=\"");
      out.print( firstName );
      out.write("\" required>\n");
      out.write("\n");
      out.write("        <label>Last Name:</label>\n");
      out.write("        <input type=\"text\" name=\"lastName\" value=\"");
      out.print( lastName );
      out.write("\" required>\n");
      out.write("\n");
      out.write("        <label>Gender:</label>\n");
      out.write("        <select name=\"gender\">\n");
      out.write("            <option value=\"Male\" ");
      out.print( gender.equals("Male") ? "selected" : "" );
      out.write(">Male</option>\n");
      out.write("            <option value=\"Female\" ");
      out.print( gender.equals("Female") ? "selected" : "" );
      out.write(">Female</option>\n");
      out.write("        </select>\n");
      out.write("\n");
      out.write("        <label>Phone Number:</label>\n");
      out.write("        <input type=\"text\" name=\"phoneNumber\" value=\"");
      out.print( phoneNumber );
      out.write("\" required>\n");
      out.write("\n");
      out.write("        <label>Address:</label>\n");
      out.write("        <input type=\"text\" name=\"address\" value=\"");
      out.print( address );
      out.write("\" required>\n");
      out.write("\n");
      out.write("        <button type=\"submit\">Update</button>\n");
      out.write("    </form>\n");
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
