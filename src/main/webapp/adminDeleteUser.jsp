<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.dao.UserDao" %>
<%@ page import="com.example.models.User" %>

<html>
<head>
    <title>Delete User</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Delete User</h1>
        <%
            int userId = Integer.parseInt(request.getParameter("id"));
            UserDao userDao = new UserDao();
            boolean deleted = userDao.deleteUser(userId); // Assume you have this method in UserDao
            
            if (deleted) {
                out.println("User deleted successfully!");
            } else {
                out.println("User not found or could not be deleted.");
            }
        %>
        
        <a href="adminUserData.jsp">Back to User Data</a>
    </div>
</body>
</html>
