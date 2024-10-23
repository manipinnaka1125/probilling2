<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>
    <h1>Error</h1>
    <p>
        <% 
            String message = request.getParameter("message");
            if (message != null) {
                out.print("Error Message: " + message.replace("+", " "));
            } else {
                out.print("An unknown error occurred.");
            }
        %>
    </p>
    <a href="adminUpdateBills.jsp">Go Back</a>
</body>
</html>
