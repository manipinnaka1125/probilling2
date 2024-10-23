<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.dao.UserDao" %>
<%@ page import="com.example.models.User" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>Account Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color:grey;
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
            text-align: center;
            margin-bottom: 20px;
        }

        .details {
            margin: 20px 0;
        }

        .details p {
            font-size: 18px;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Account Summary</h1>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            UserDao userDao = new UserDao();
            User userDetails = userDao.getUserById(user.getId());
        %>
        <div class="details">
        <p><strong>userid:</strong><%=userDetails.getId()%></p>
            <p><strong>Name:</strong> <%= userDetails.getName() %></p>
            <p><strong>Email:</strong> <%= userDetails.getEmail() %></p>
            <p><strong>Phone Number:</strong> <%= userDetails.getPhoneNumber() %></p>
           
        </div>
    </div>
</body>
</html>
