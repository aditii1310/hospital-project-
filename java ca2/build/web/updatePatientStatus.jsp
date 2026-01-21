<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
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
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Patient</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .container { width: 50%; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 10px; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; }
        button { background: blue; color: white; padding: 10px; border: none; }
    </style>
</head>
<body>

    <div class="container">
        <h2>Update Patient Details</h2>
        <form action="updatePatientServlet" method="post">
            <input type="hidden" name="patientId" value="<%= patientId %>">
            <label>First Name:</label>
            <input type="text" name="firstName" value="<%= firstName %>" required>

            <label>Last Name:</label>
            <input type="text" name="lastName" value="<%= lastName %>" required>

            <label>Gender:</label>
            <select name="gender">
                <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
                <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
            </select>

            <label>Phone Number:</label>
            <input type="text" name="phoneNumber" value="<%= phoneNumber %>" required>

            <label>Address:</label>
            <input type="text" name="address" value="<%= address %>" required>

            <button type="submit">Update</button>
        </form>
    </div>

</body>
</html>
