package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Doctor Dashboard - Login</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"styles.css\">\n");
      out.write("    <style>\n");
      out.write("        body { \n");
      out.write("            font-family: Arial, sans-serif; \n");
      out.write("            background: url('https://img.freepik.com/free-psd/abstract-blur-luxury-hospital-corridor-generative-ai_587448-2121.jpg') no-repeat center center/cover; /* Background image */\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: center;\n");
      out.write("            height: 100vh; /* Full screen height */\n");
      out.write("            margin: 0;\n");
      out.write("        }\n");
      out.write("        .overlay {\n");
      out.write("            position: absolute;\n");
      out.write("            top: 0;\n");
      out.write("            left: 0;\n");
      out.write("            width: 100%;\n");
      out.write("            height: 100%;\n");
      out.write("            background: rgba(0, 0, 0, 0.5); /* Dark overlay for better visibility */\n");
      out.write("        }\n");
      out.write("        .login-container {\n");
      out.write("            position: relative;\n");
      out.write("            background: white;\n");
      out.write("            padding: 2rem;\n");
      out.write("            border-radius: 15px; /* Rounded corners */\n");
      out.write("            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3); /* Smooth shadow */\n");
      out.write("            text-align: center;\n");
      out.write("            width: 350px; /* Wider box */\n");
      out.write("            z-index: 1; /* Ensures form is above overlay */\n");
      out.write("            border: 3px solid #007bff; /* Blue border */\n");
      out.write("        }\n");
      out.write("        .login-container h2 {\n");
      out.write("            margin-bottom: 1rem;\n");
      out.write("            color: #007bff; /* Blue heading */\n");
      out.write("            font-size: 24px;\n");
      out.write("        }\n");
      out.write("        .login-container label {\n");
      out.write("            font-weight: bold;\n");
      out.write("            display: block;\n");
      out.write("            margin: 10px 0 5px;\n");
      out.write("            color: #333;\n");
      out.write("        }\n");
      out.write("        .login-container input {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 12px;\n");
      out.write("            margin-bottom: 15px;\n");
      out.write("            border: 2px solid #007bff; /* Blue border */\n");
      out.write("            border-radius: 8px;\n");
      out.write("            outline: none;\n");
      out.write("            font-size: 16px;\n");
      out.write("        }\n");
      out.write("        .login-container input:focus {\n");
      out.write("            border-color: #0056b3; /* Darker blue on focus */\n");
      out.write("            box-shadow: 0px 0px 8px rgba(0, 91, 187, 0.6);\n");
      out.write("        }\n");
      out.write("        .login-container button {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 12px;\n");
      out.write("            background-color: #007bff;\n");
      out.write("            border: none;\n");
      out.write("            color: white;\n");
      out.write("            font-size: 18px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            transition: 0.3s;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("        .login-container button:hover {\n");
      out.write("            background-color: #0056b3;\n");
      out.write("            box-shadow: 0px 0px 10px rgba(0, 91, 187, 0.7);\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <div class=\"overlay\"></div> <!-- Dark overlay effect -->\n");
      out.write("\n");
      out.write("    <div class=\"login-container\">\n");
      out.write("        <h2>Doctor Login</h2>\n");
      out.write("        <form action=\"LoginServlet\" method=\"post\">\n");
      out.write("            <label>Enter Username:</label>\n");
      out.write("            <input type=\"text\" name=\"username\" required>\n");
      out.write("            <label>Enter Password:</label>\n");
      out.write("            <input type=\"password\" name=\"password\" required>\n");
      out.write("            <button type=\"submit\">Login</button>\n");
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
