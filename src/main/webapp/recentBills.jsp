<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>Your Bill</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h1, h2 {
            color: black;
            text-align: center;
            margin: 0;
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.4);
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            margin-top: 20px;
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
        .btn {
            background-color: #0072ff;
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s, transform 0.3s;
            text-align: center;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #005bb5;
            transform: scale(1.05);
        }
        .btn:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(0, 114, 255, 0.5);
        }
        .result {
            background: #f4f4f4;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            width: 100%;
            max-width: 300px;
            margin-bottom: 20px;
        }
        .result span {
            display: block;
            font-size: 1.2em;
            color: #333;
            margin: 5px 0;
        }
        .result #unitCostDisplay {
            color: #0072ff;
        }
        .result #totalAmount {
            font-weight: bold;
            color: #ff5722;
        }
    </style>
    <script>
        function generateRandomUnits() {
            // Generate a random number of units between 100 and 500
            var randomUnits = Math.floor(Math.random() * (500 - 100 + 1)) + 100;
            localStorage.setItem('units', randomUnits);
            return randomUnits;
        }

        function retrieveUnits() {
            // Retrieve units from local storage
            var storedUnits = localStorage.getItem('units');
            if (storedUnits) {
                return parseInt(storedUnits, 10);
            } else {
                return generateRandomUnits(); // Generate and store units if not present
            }
        }

        function updateUnitCost() {
            var selectedState = document.getElementById("state").value;
            var unitCost = 0;

            // Set the cost per unit based on the selected state
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
            var units = retrieveUnits(); // Get units from local storage or generate new
            document.getElementById("units").value = units; // Set the units in the input field
            updateUnitCost(); // Set initial unit cost based on selected state
        };
    </script>
</head>
<body>
    <div class="container">
        <h1>Your Current Bill</h1>

        
        <form>
            <label for="state">Select State:</label>
            <select id="state" onchange="updateUnitCost()">
                <option value="4">Andhra Pradesh - ₹4/unit</option>
                <option value="5">Other State - ₹5/unit</option>
                <!-- Add more states as needed -->
            </select>
            <label for="units">Units:</label>
            <input type="number" id="units" min="0" readonly>
            <div class="result">
                <label>Cost per Unit:</label>
                <span id="unitCostDisplay">₹0</span>
                <label>Total Amount:</label>
                <span id="totalAmount">₹0.00</span>
            </div>
            <!-- No button here since calculation is auto-triggered by selection change -->
        </form>
    </div>
</body>
</html>
