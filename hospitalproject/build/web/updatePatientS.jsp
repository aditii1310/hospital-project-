<%@ page import="java.sql.*" %>
<%
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
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Patient</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: bold;
            margin-top: 10px;
        }
        input, select, button {
            padding: 8px;
            margin-top: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            margin-top: 15px;
            background-color: #28a745;
            color: white;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

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

</body>
</html>
