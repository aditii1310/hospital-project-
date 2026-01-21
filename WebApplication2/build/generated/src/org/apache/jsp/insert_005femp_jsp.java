package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;

public final class insert_005femp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write(" \n");
      out.write(" \n");
      out.write(" \n");
      out.write(" \n");
      out.write("\n");
      out.write("\n");
 
int id = 0; 
if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) { 
    id = Integer.parseInt(request.getParameter("id")); 
} else { 
    id = 1; 
} 

String f_name = request.getParameter("f_name"); 
String l_name = request.getParameter("l_name"); 
String dep = request.getParameter("dep"); 
String position = request.getParameter("pos"); 
int salary = 0; 

try { 
    salary = Integer.parseInt(request.getParameter("sal")); 
} catch (NumberFormatException e) { 
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>"); 
    salary = 0; 
} 

String url = "jdbc:mysql://localhost:3306/admission_5367"; 
String username = "root"; 
String password = "root75"; 

Connection connection = null; 

try { 
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    connection = DriverManager.getConnection(url, username, password); 

    if (connection != null) { 
        PreparedStatement stmt = connection.prepareStatement(
            "INSERT INTO employee (id, f_name, l_name, dep, position, salary) VALUES (?, ?, ?, ?, ?, ?)"
        ); 
        stmt.setInt(1, id); 
        stmt.setString(2, f_name); 
        stmt.setString(3, l_name); 
        stmt.setString(4, dep); 
        stmt.setString(5, position); 
        stmt.setInt(6, salary); 
        
        int i = stmt.executeUpdate(); 
        out.println("<p style='color:green;'>" + i + " record inserted successfully.</p>"); 
    } else { 
        out.println("<p style='color:red;'>Connection to MySQL database failed!</p>"); 
    } 
} catch (SQLException e) { 
    out.println("<p style='color:red;'>Error: Unable to establish connection! " + e.getMessage() + "</p>"); 
} catch (ClassNotFoundException e) { 
    out.println("<p style='color:red;'>Error: MySQL JDBC Driver not found! " + e.getMessage() + "</p>");
} finally { 
    if (connection != null) { 
        try { 
            connection.close(); 
        } catch (SQLException e) { 
            out.println("<p style='color:red;'>Error: Unable to close connection! " + e.getMessage() + "</p>"); 
        } 
    } 
} 

      out.write('\n');
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
