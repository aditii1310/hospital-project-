package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public final class doctorDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Doctor Dashboard</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"styles.css\">\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: 'Arial', sans-serif;\n");
      out.write("            background-image: url('images/background.jpg'); /* Add the correct path to your image */\n");
      out.write("            background-size: cover;\n");
      out.write("            background-position: center;\n");
      out.write("            background-attachment: fixed;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            box-sizing: border-box;\n");
      out.write("        }\n");
      out.write("        .navbar {\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: space-around;\n");
      out.write("            align-items: center;\n");
      out.write("            background-color: rgba(0, 123, 255, 0.7); /* Transparent background to see the image behind */\n");
      out.write("            padding: 1rem 0;\n");
      out.write("            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n");
      out.write("        }\n");
      out.write("        .navbar ul {\n");
      out.write("            list-style: none;\n");
      out.write("            display: flex;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("        }\n");
      out.write("        .navbar ul li {\n");
      out.write("            margin: 0 1rem;\n");
      out.write("        }\n");
      out.write("        .navbar ul li a {\n");
      out.write("            text-decoration: none;\n");
      out.write("            color: white;\n");
      out.write("            font-weight: bold;\n");
      out.write("            transition: color 0.3s ease;\n");
      out.write("        }\n");
      out.write("        .navbar ul li a:hover {\n");
      out.write("            color: #f1c40f;\n");
      out.write("        }\n");
      out.write("        section {\n");
      out.write("            padding: 3rem;\n");
      out.write("            margin: 2rem auto;\n");
      out.write("            max-width: 1200px;\n");
      out.write("            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */\n");
      out.write("            border-radius: 10px;\n");
      out.write("            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n");
      out.write("            border: 2px solid #007bff; /* Blue border added */\n");
      out.write("        }\n");
      out.write("        section h1, section h2 {\n");
      out.write("            color: #333;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        section p {\n");
      out.write("            text-align: center;\n");
      out.write("            font-size: 1.1rem;\n");
      out.write("            color: #666;\n");
      out.write("        }\n");
      out.write("        .form-container {\n");
      out.write("            background: #f9f9f9;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            padding: 2rem;\n");
      out.write("            margin-top: 2rem;\n");
      out.write("            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\n");
      out.write("            border: 2px solid #007bff; /* Blue border added */\n");
      out.write("        }\n");
      out.write("        .form-container label {\n");
      out.write("            font-size: 1rem;\n");
      out.write("            margin-bottom: 0.5rem;\n");
      out.write("            display: block;\n");
      out.write("            color: #333;\n");
      out.write("        }\n");
      out.write("        .form-container input, .form-container select, .form-container textarea {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 0.75rem;\n");
      out.write("            margin-bottom: 1.25rem;\n");
      out.write("            border-radius: 6px;\n");
      out.write("            border: 1px solid #ddd;\n");
      out.write("            font-size: 1rem;\n");
      out.write("            transition: border 0.3s ease;\n");
      out.write("        }\n");
      out.write("        .form-container input:focus, .form-container select:focus, .form-container textarea:focus {\n");
      out.write("            border: 1px solid #007bff;\n");
      out.write("            outline: none;\n");
      out.write("        }\n");
      out.write("        .form-container button {\n");
      out.write("            background-color: #007bff;\n");
      out.write("            color: white;\n");
      out.write("            padding: 0.75rem 1.5rem;\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 6px;\n");
      out.write("            font-size: 1rem;\n");
      out.write("            cursor: pointer;\n");
      out.write("            transition: background-color 0.3s ease;\n");
      out.write("        }\n");
      out.write("        .form-container button:hover {\n");
      out.write("            background-color: #0056b3;\n");
      out.write("        }\n");
      out.write("        table {\n");
      out.write("            width: 100%;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("            margin-top: 2rem;\n");
      out.write("        }\n");
      out.write("        table th, table td {\n");
      out.write("            padding: 1rem;\n");
      out.write("            text-align: center;\n");
      out.write("            border: 1px solid #ddd;\n");
      out.write("        }\n");
      out.write("        table th {\n");
      out.write("            background-color: #007bff;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        table tr:nth-child(even) {\n");
      out.write("            background-color: #f9f9f9;\n");
      out.write("        }\n");
      out.write("        table tr:hover {\n");
      out.write("            background-color: #f1f1f1;\n");
      out.write("        }\n");
      out.write("        table button {\n");
      out.write("            background-color: #e74c3c;\n");
      out.write("            color: white;\n");
      out.write("            border: none;\n");
      out.write("            padding: 0.5rem 1rem;\n");
      out.write("            border-radius: 6px;\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("        table button:hover {\n");
      out.write("            background-color: #c0392b;\n");
      out.write("        }\n");
      out.write("        footer {\n");
      out.write("            background-color: #333;\n");
      out.write("            color: white;\n");
      out.write("            text-align: center;\n");
      out.write("            padding: 1rem;\n");
      out.write("            position: fixed;\n");
      out.write("            width: 100%;\n");
      out.write("            bottom: 0;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <nav class=\"navbar\">\n");
      out.write("        <ul>\n");
      out.write("            <li><a href=\"#home\">Home</a></li>\n");
      out.write("            <li><a href=\"#patients\">Patient Registration</a></li>\n");
      out.write("            <li><a href=\"logout.jsp\">Logout</a></li>\n");
      out.write("        </ul>\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <section id=\"home\">\n");
      out.write("        <h1>Welcome, Doctor!</h1>\n");
      out.write("        <p>Manage your patients and appointments efficiently.</p>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <section id=\"patients\">\n");
      out.write("        <h2>Patient Registration</h2>\n");
      out.write("        <div class=\"form-container\">\n");
      out.write("            <h3>Add New Patient</h3>\n");
      out.write("            <form method=\"post\" action=\"addPatientServlet\">\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <label for=\"firstName\">First Name:</label> \n");
      out.write("                <input type=\"text\" name=\"firstName\" required><br>\n");
      out.write("\n");
      out.write("                <label for=\"lastName\">Last Name:</label> \n");
      out.write("                <input type=\"text\" name=\"lastName\" required><br>\n");
      out.write("\n");
      out.write("                <label for=\"gender\">Gender:</label>\n");
      out.write("                <select name=\"gender\">\n");
      out.write("                    <option value=\"Male\">Male</option>\n");
      out.write("                    <option value=\"Female\">Female</option>\n");
      out.write("                </select><br>\n");
      out.write("\n");
      out.write("                <label for=\"dob\">Date of Birth:</label> \n");
      out.write("                <input type=\"date\" name=\"dob\" required><br>\n");
      out.write("\n");
      out.write("                <label for=\"phoneNumber\">Phone Number:</label> \n");
      out.write("                <input type=\"text\" name=\"phoneNumber\" required><br>\n");
      out.write("\n");
      out.write("                <label for=\"address\">Address:</label> \n");
      out.write("                <textarea name=\"address\" required></textarea><br>\n");
      out.write("\n");
      out.write("                <button type=\"submit\">Add Patient</button>\n");
      out.write("                 <a href=\"updatePatientStatus.jsp\">Update patient</a>\n");
      out.write("                \n");
      out.write("            </form>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <table>\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Patient ID</th>\n");
      out.write("                    <th>First Name</th>\n");
      out.write("                    <th>Last Name</th>\n");
      out.write("                    <th>Gender</th>\n");
      out.write("                    <th>Date of Birth</th>\n");
      out.write("                    <th>Phone Number</th>\n");
      out.write("                    <th>Address</th>\n");
      out.write("                    <th>Status</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");
 
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalsystem", "root", "root75");
                        stmt = conn.createStatement();
                        String query = "SELECT * FROM patients";
                        rs = stmt.executeQuery(query);
                        while (rs.next()) {
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print( rs.getString("patient_id") );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString("first_name") );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString("last_name") );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString("gender") );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString("date_of_birth") );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString("phone_number") );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString("address") );
      out.write("</td>\n");
      out.write("                    <td>\n");
      out.write("                        <form method=\"post\" action=\"updatePatientStatus\">\n");
      out.write("                            <input type=\"hidden\" name=\"patientId\" value=\"");
      out.print( rs.getString("patient_id") );
      out.write("\">\n");
      out.write("                            <select name=\"status\">\n");
      out.write("                                <option value=\"Pending\">Pending</option>\n");
      out.write("                                <option value=\"Admitted\">Admitted</option>\n");
      out.write("                                <option value=\"Discharged\">Discharged</option>\n");
      out.write("                            </select>\n");
      out.write("                            <button type=\"submit\">Update</button>\n");
      out.write("                        </form>\n");
      out.write("                        <form method=\"post\" action=\"deletePatientServlet\">\n");
      out.write("                            <input type=\"hidden\" name=\"patientId\" value=\"");
      out.print( rs.getString("patient_id") );
      out.write("\">\n");
      out.write("                            <button type=\"submit\">Remove</button>\n");
      out.write("                        </form>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");
 
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='8'>Error fetching patients: " + e.getMessage() + "</td></tr>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <footer>\n");
      out.write("        <p>&copy; 2025 Hospital Management System</p>\n");
      out.write("    </footer>\n");
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
