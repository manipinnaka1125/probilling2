<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Update Bills</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f2f2f2;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        max-width: 500px;
        margin: 20px;
        background: #fff;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        background: linear-gradient(145deg, #ffffff, #f9f9f9);
        transition: transform 0.3s, box-shadow 0.3s;
    }
    .container:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
    }
    h1 {
        color: #333;
        text-align: center;
        margin-bottom: 20px;
        font-size: 2em;
        font-weight: bold;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    label {
        font-size: 1.2em;
        margin: 10px 0;
        color: #555;
        font-weight: bold;
    }
    input[type="text"] {
        font-size: 1em;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 8px;
        width: 100%;
        max-width: 300px;
        margin-bottom: 20px;
        transition: border-color 0.3s, box-shadow 0.3s;
    }
    input[type="text"]:focus {
        border-color: #0072ff;
        box-shadow: 0 0 8px rgba(0, 114, 255, 0.4);
        outline: none;
    }
    input[type="submit"] {
        background: #0072ff;
        color: #fff;
        border: none;
        padding: 12px 20px;
        font-size: 1em;
        border-radius: 8px;
        cursor: pointer;
        transition: background 0.3s, transform 0.3s;
    }
    input[type="submit"]:hover {
        background: #005bb5;
        transform: translateY(-2px);
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Update Bills</h1>
        <form action="adminUpdateBills" method="post">
            <label for="userId">User ID:</label>
            <input type="text" id="userId" name="userId" required pattern="\d+"><br><br>
           
            <label for="units">Units:</label>
            <input type="text" id="units" name="units" required pattern="\d+(\.\d{1,2})?"><br><br>
            <input type="submit" value="Update Bill">
        </form>
    </div>
</body>
</html>
