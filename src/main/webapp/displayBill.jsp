<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>Display Bill</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        .container {
            max-width: 800px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            margin-top: 20px;
            background: linear-gradient(145deg, #ffffff, #f9f9f9);
        }
        h1 {
            color: #333;
            text-align: center;
            margin: 0;
            padding-bottom: 20px;
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
        select, input {
            font-size: 1em;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 100%;
            max-width: 300px;
            margin-bottom: 20px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        select:focus, input:focus {
            border-color: #0072ff;
            box-shadow: 0 0 8px rgba(0, 114, 255, 0.4);
            outline: none;
        }
        .result {
            background: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            width: 100%;
            max-width: 350px;
            margin-bottom: 20px;
            background: linear-gradient(145deg, #f5f5f5, #ffffff);
        }
        .result label {
            font-size: 1.1em;
            color: #333;
        }
        .result span {
            display: block;
            font-size: 1.3em;
            color: #333;
            margin: 5px 0;
        }
        .result #unitCostDisplay {
            color: #0072ff;
            font-weight: bold;
        }
        .result #totalAmount {
            font-weight: bold;
            color: #ff5722;
        }
        .pay-button {
            font-size: 1.2em;
            padding: 10px 20px;
            color: #fff;
            background-color: #0072ff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .pay-button:hover {
            background-color: #005bb5;
        }
    </style>
    <script>
        function retrieveUnits() {
            var storedUnits = '<%= session.getAttribute("units") %>';
            if (storedUnits) {
                return parseInt(storedUnits, 10);
            } else {
                return 0; // Default if no units are found
            }
        }

        function updateUnitCost() {
            var selectedState = document.getElementById("state").value;
            var unitCost = 0;

            if (selectedState === "4") {
                unitCost = 4; // Fixed cost for Andhra Pradesh
            } else if (selectedState === "5") {
                unitCost = 5; // Fixed cost for Other States
            }

            document.getElementById("unitCostDisplay").innerText = "₹" + unitCost;
            calculateTotal();
        }

        function calculateTotal() {
            var unitCost = parseFloat(document.getElementById("unitCostDisplay").innerText.replace("₹", "")) || 0;
            var units = parseFloat(document.getElementById("units").value) || 0;
            var total = unitCost * units;
            document.getElementById("totalAmount").innerText = "Total Amount to Pay: ₹" + total.toFixed(2);
        }
        
        window.onload = function() {
            var units = retrieveUnits();
            document.getElementById("units").value = units;
            updateUnitCost();
        };
    </script>
</head>
<body>
    <div class="container">
        <h1>Display Bill</h1>
        <form>
            <label for="state">Select State:</label>
            <select id="state" onchange="updateUnitCost()">
                <option value="4">Andhra Pradesh - ₹4/unit</option>
                <option value="5">Other State - ₹5/unit</option>
            </select>
            <label for="units">Units:</label>
            <input type="number" id="units" min="0" readonly>
            <div class="result">
                <label>Cost per Unit:</label>
                <span id="unitCostDisplay">₹0</span>
                <label>Total Amount:</label>
                <span id="totalAmount">₹0.00</span>
            </div>
            <button type="button" class="pay-button" onclick="window.location.href='payment.jsp'">Pay Bill</button>
        </form>
    </div>
</body>
</html>
