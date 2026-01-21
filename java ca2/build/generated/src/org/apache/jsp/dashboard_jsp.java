package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Hospital Management System</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"logo\">HospitalCare</div>\n");
      out.write("            <ul class=\"nav-links\">\n");
      out.write("                <li><a href=\"#home\">Home</a></li>\n");
      out.write("                <li><a href=\"#appointment\">Appointment Booking</a></li>\n");
      out.write("                <li><a href=\"#about\">About</a></li>\n");
      out.write("                <li><a href=\"#contact\">Contact</a></li>\n");
      out.write("                <li><a href=\"#location\">Location</a></li>\n");
      out.write("                <li><a href=\"logout.jsp\">Logout</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("    <!-- Home Section -->\n");
      out.write("    <section id=\"home\" class=\"section\">\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <h1>Welcome to HospitalCare</h1>\n");
      out.write("            <p>Your health is our priority. Explore our services and book an appointment with ease.</p>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- Appointment Booking Section -->\n");
      out.write("    <section id=\"appointment\" class=\"section\">\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <h2>Book Your Appointment</h2>\n");
      out.write("            <form action=\"AppointmentServlet\" method=\"POST\">\n");
      out.write("                <input type=\"text\" name=\"name\" placeholder=\"Your Name\" required>\n");
      out.write("                <input type=\"email\" name=\"email\" placeholder=\"Your Email\" required>\n");
      out.write("                <input type=\"date\" name=\"date\" required>\n");
      out.write("                <textarea name=\"message\" placeholder=\"Your Message (Optional)\"></textarea>\n");
      out.write("                <button type=\"submit\">Book Now</button>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- About Section -->\n");
      out.write("    <section id=\"about\" class=\"section\">\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <h2>About Us</h2>\n");
      out.write("            <p>We are a multi-specialty hospital providing top-notch healthcare services with modern facilities and a compassionate team of experts.</p>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- Contact Section -->\n");
      out.write("    <section id=\"contact\" class=\"section\">\n");
      out.write("        <div class=\"content\">\n");
      out.write("             <h1>Contact Us</h1>\n");
      out.write("             <br>\n");
      out.write("        \n");
      out.write("        <form>\n");
      out.write("            <label for='name'>Enter Name:</label>\n");
      out.write("            <input type='text' name='t1' id='name' placeholder='Enter Name'>\n");
      out.write("            <br><br>\n");
      out.write("             <label for='email'>Enter Email:</label>\n");
      out.write("            <input type='text' name='t2' id='email' placeholder=\"Enter Email\">\n");
      out.write("            <br><br>\n");
      out.write("            <label for='phone'>Enter Phone:</label>\n");
      out.write("            <input type='text' name='t2' id='email' placeholder=\"Enter Email\">\n");
      out.write("            <br><br>\n");
      out.write("            <label for='Message'>Enter Message:</label>\n");
      out.write("            <textarea name='t2' id='email' placeholder=\"Enter Message\"></textarea>\n");
      out.write("            <br><br>\n");
      out.write("            <input type='submit' value='submit' onclick='message()'>\n");
      out.write("        </form>\n");
      out.write("        <script>\n");
      out.write("            function message(){\n");
      out.write("                alert(\" Message Sent Succesfully\")\n");
      out.write("            }\n");
      out.write("            </script>\n");
      out.write("           \n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- Location Section -->\n");
      out.write("    <section id=\"location\" class=\"section\">\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <h2>Our Location</h2>\n");
      out.write("            <p>Visit us at our central facility in Wellness City. Find us on the map below:</p>\n");
      out.write("            <iframe\n");
      out.write("                src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3154.0190188785065!2d-122.08424948502353!3d37.42206597982386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fba21dbefdc91%3A0xa3c792f8b5d5f0b1!2sGoogleplex!5e0!3m2!1sen!2sin!4v1637068387231!5m2!1sen!2sin\"\n");
      out.write("                width=\"100%\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>\n");
      out.write("        </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <footer>\n");
      out.write("        <p>&copy; 2025 HospitalCare. All rights reserved.</p>\n");
      out.write("    </footer>\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        // Smooth scroll\n");
      out.write("        $('nav a').on('click', function(event) {\n");
      out.write("            if (this.hash !== '') {\n");
      out.write("                event.preventDefault();\n");
      out.write("                const hash = this.hash;\n");
      out.write("                $('html, body').animate({\n");
      out.write("                    scrollTop: $(hash).offset().top - 70\n");
      out.write("                }, 800);\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    </script>\n");
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
