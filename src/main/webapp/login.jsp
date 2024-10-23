<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #2d2d2d, #4d4d4d);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .welcome-message {
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            color: #fff;
            font-size: 24px;
            font-weight: bold;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 8px;
            text-align: left;
            font-weight: 600;
        }
        input[type="email"],
        input[type="password"] {
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
        }
        button {
            padding: 12px;
            border: none;
            border-radius: 8px;
            background-color: #007bff;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .error {
            color: #d9534f;
            margin-top: 10px;
        }
        .register-link {
            margin-top: 20px;
        }
        .register-link a {
            color: #007bff;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="welcome-message">Welcome to the Electricity Billing System</div>
    <div class="container">
        <h1>Login</h1>
        <form action="user" method="post">
            <input type="hidden" name="action" value="login">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
        <% if (request.getParameter("error") != null) { %>
            <p class="error">Invalid email or password</p>
        <% } %>
        <p class="register-link">Don't have an account? <a href="register.jsp">Register here</a></p>
        
       <p class="admin-link">login as admin? <a href="adminlogin.jsp">Admin Login</a></p>
    </div>
</body>
</html>
