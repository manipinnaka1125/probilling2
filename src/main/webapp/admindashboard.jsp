<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Admin Dashboard</title>
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
            text-align: center;
            margin-bottom: 20px;
        }

        .navbar {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .navbar a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #e7f0ff;
            transition: background-color 0.3s, color 0.3s;
        }

        .navbar a:hover {
            background-color: #007BFF;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <div class="navbar">
            <a href="adminUserData.jsp">User Data</a>
            <a href="adminUpdateBills.jsp">Update Bills</a>
            <a href="adminlogout.jsp">adminlogout</a>
        </div>
    </div>
</body>
</html>
