<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<%@ page import="com.example.models.User" %> <!-- Import the User class -->
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <% 
            User user = (User) session.getAttribute("user"); // Retrieve the user object from session
            if (user == null) {
                response.sendRedirect("login.jsp"); // Redirect to login if user is not found
                return;
            }
        %>
        <h1>Welcome, <%= user.getName() %>!</h1>
        <p class="message">Our electricity billing system aims to provide accurate, secure, and seamless management of your electricity bills. It is designed to offer a high-performance experience, ensuring easy access to your account details, billing history, and payment options.</p>

        <div class="slider">
            <div class="slides">
                <div class="slide">
             
                <center> <img src="images/slide1.jpg" alt="Slide 1"> </center>   
                 
                </div>
                
            </div>
        </div>
    </div>

    
</body>
</html>
