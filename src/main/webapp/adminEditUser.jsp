<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.dao.UserDao" %>
<%@ page import="com.example.models.User" %>

<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Edit User</h1>
        <div class="navbar">
            <a href="adminUserData.jsp">Back to User Data</a>
        </div>
        
        <%
            int userId = Integer.parseInt(request.getParameter("id"));
            UserDao userDao = new UserDao();
            User user = userDao.getUserById(userId); // Assume you have this method in UserDao

            if (user == null) {
                out.println("User not found!");
                return;
            }
        %>
        
        <form action="user" method="post">
            <input type="hidden" name="action" value="updateProfile">
            <input type="hidden" name="id" value="<%= user.getId() %>">
            
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= user.getName() %>" required><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required><br>
            
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="<%= user.getPhoneNumber() %>" required><br>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required><br>
            
            <input type="submit" value="Update User">
        </form>
    </div>
</body>
</html>
