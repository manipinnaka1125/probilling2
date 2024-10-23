<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dao.UserDao" %>
<%@ page import="com.example.models.User" %>

<html>
<head>
    <title>Admin - User Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
        }

        .navbar {
            margin-bottom: 20px;
        }

        .navbar a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #007BFF;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Data</h1>
        <div class="navbar">
            <a href="admindashboard.jsp">Back to Dashboard</a>
        </div>
        
        <%
            try {
                UserDao userDao = new UserDao();
                List<User> users = userDao.getAllUsers(); // Ensure this method is correct
                
                if (users == null || users.isEmpty()) {
                    out.println("<p>No users found.</p>");
                } else {
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Password</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (User user : users) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getPhoneNumber() %></td>
                    <td><%= user.getPassword() %></td>
                    <td>
                        <a href="adminEditUser.jsp?id=<%= user.getId() %>">Edit</a>
                        <a href="adminDeleteUser.jsp?id=<%= user.getId() %>">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        %>
    </div>
</body>
</html>
