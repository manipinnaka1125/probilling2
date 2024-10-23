<!-- navbar.jsp -->
<html>
<head>
    <style>
        .navbar {
            background-color: #333;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar .logout {
            float: right;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="dashboard.jsp">Home</a>
        <a href="accountSummary.jsp">Account Summary</a>
        
       <a href="displayBill.jsp">Your Bill</a>
        <a href="editProfile.jsp">Profile Management</a>
        <a href="logout.jsp" class="logout">Logout</a>
    </div>
</body>
</html>
