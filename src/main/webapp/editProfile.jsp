<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<%@ page import="com.example.models.User" %> <!-- Import the User class -->
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding-top: 60px; /* Adjust based on your navbar height */
        }

        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px); /* Adjust based on your navbar height */
        }

        .card {
            background-color: #fff;
            padding: 2em;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 1em;
        }

        label {
            display: block;
            margin: 0.5em 0 0.2em 0;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 0.5em;
            margin-bottom: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }

        button {
            padding: 0.75em 2em;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .form-group {
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <%@ include file="navbar.jsp" %>
    </div>
    <%
        User user = (User) session.getAttribute("user"); 
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    <div class="container">
        <div class="card">
            <h1>Edit Profile</h1>
            <form action="user" method="post">
                <input type="hidden" name="action" value="updateProfile">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= user.getName() %>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" value="<%= user.getPhoneNumber() %>" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required>
                </div>
                <button type="submit">Update Profile</button>
            </form>
        </div>
    </div>
</body>
</html>
