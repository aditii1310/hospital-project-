<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('images/background.jpg'); /* Add the correct path to your image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .navbar {
            display: flex;
            justify-content: space-around;
            align-items: center;
            background-color: rgba(0, 123, 255, 0.7); /* Transparent background to see the image behind */
            padding: 1rem 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .navbar ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }
        .navbar ul li {
            margin: 0 1rem;
        }
        .navbar ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .navbar ul li a:hover {
            color: #f1c40f;
        }
        section {
            padding: 3rem;
            margin: 2rem auto;
            max-width: 1200px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: 2px solid #007bff; /* Blue border added */
        }
        section h1, section h2 {
            color: #333;
            text-align: center;
        }
        section p {
            text-align: center;
            font-size: 1.1rem;
            color: #666;
        }
        .form-container {
            background: #f9f9f9;
            border-radius: 8px;
            padding: 2rem;
            margin-top: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: 2px solid #007bff; /* Blue border added */
        }
        .form-container label {
            font-size: 1rem;
            margin-bottom: 0.5rem;
            display: block;
            color: #333;
        }
        .form-container input, .form-container select, .form-container textarea {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1.25rem;
            border-radius: 6px;
            border: 1px solid #ddd;
            font-size: 1rem;
            transition: border 0.3s ease;
        }
        .form-container input:focus, .form-container select:focus, .form-container textarea:focus {
            border: 1px solid #007bff;
            outline: none;
        }
        .form-container button {
            background-color: #007bff;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-container button:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 2rem;
        }
        table th, table td {
            padding: 1rem;
            text-align: center;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #007bff;
            color: white;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tr:hover {
            background-color: #f1f1f1;
        }
        table button {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            cursor: pointer;
        }
        table button:hover {
            background-color: #c0392b;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 1rem;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="#patients">Patient Registration</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>

    <section id="home">
        <h1>Welcome, Doctor!</h1>
        <p>Manage your patients and appointments efficiently.</p>
    </section>

    <section id="patients">
        <h2>Patient Registration</h2>
        <div class="form-container">
            <h3>Add New Patient</h3>
            <form method="post" action="addPatientServlet">
                
                
                <label for="firstName">First Name:</label> 
                <input type="text" name="firstName" required><br>

                <label for="lastName">Last Name:</label> 
                <input type="text" name="lastName" required><br>

                <label for="gender">Gender:</label>
                <select name="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select><br>

                <label for="dob">Date of Birth:</label> 
                <input type="date" name="dob" required><br>

                <label for="phoneNumber">Phone Number:</label> 
                <input type="text" name="phoneNumber" required><br>

                <label for="address">Address:</label> 
                <textarea name="address" required></textarea><br>

                <button type="submit">Add Patient</button>
                 <a href="updatePatientStatus.jsp">Update patient</a>
                
            </form>
            
        </div>

        <table>
            <thead>
                <tr>
                    <th>Patient ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
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
                %>
                <tr>
                    <td><%= rs.getString("patient_id") %></td>
                    <td><%= rs.getString("first_name") %></td>
                    <td><%= rs.getString("last_name") %></td>
                    <td><%= rs.getString("gender") %></td>
                    <td><%= rs.getString("date_of_birth") %></td>
                    <td><%= rs.getString("phone_number") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td>
                        <form method="post" action="updatePatientStatus">
                            <input type="hidden" name="patientId" value="<%= rs.getString("patient_id") %>">
                            <select name="status">
                                <option value="Pending">Pending</option>
                                <option value="Admitted">Admitted</option>
                                <option value="Discharged">Discharged</option>
                            </select>
                            <button type="submit">Update</button>
                        </form>
                        <form method="post" action="deletePatientServlet">
                            <input type="hidden" name="patientId" value="<%= rs.getString("patient_id") %>">
                            <button type="submit">Remove</button>
                        </form>
                    </td>
                </tr>
                <% 
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
                %>
            </tbody>
        </table>
    </section>

    <footer>
        <p>&copy; 2025 Hospital Management System</p>
    </footer>
</body>
</html>
