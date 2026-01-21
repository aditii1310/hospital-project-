<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.SQLException"%> 
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
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
            "INSERT INTO employee 5367(id, f_name, l_name, dep, position, salary) VALUES (?, ?, ?, ?, ?, ?)"
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
%>
