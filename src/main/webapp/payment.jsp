<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>Payment</title>
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
        .payment-details {
            display: none;
            flex-direction: column;
            align-items: center;
        }
        .payment-details label, .payment-details input {
            margin: 5px 0;
        }
    </style>
    <script>
        function showPaymentDetails() {
            var paymentMethod = document.getElementById("paymentMethod").value;
            var detailsDivs = document.getElementsByClassName("payment-details");
            for (var i = 0; i < detailsDivs.length; i++) {
                detailsDivs[i].style.display = "none";
            }
            if (paymentMethod === "upi") {
                document.getElementById("upiDetails").style.display = "flex";
            } else if (paymentMethod === "bank") {
                document.getElementById("bankDetails").style.display = "flex";
            } else if (paymentMethod === "atm") {
                document.getElementById("atmDetails").style.display = "flex";
            } else if (paymentMethod === "debitCard") {
                document.getElementById("debitCardDetails").style.display = "flex";
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Payment Options</h1>
        <form action="PaymentServlet" method="post">
            <label for="paymentMethod">Select Payment Method:</label>
            <select id="paymentMethod" name="paymentMethod" onchange="showPaymentDetails()">
                <option value="upi">UPI</option>
                <option value="bank">Bank Transfer</option>
                <option value="atm">ATM</option>
                <option value="debitCard">Debit Card</option>
                <!-- Add more payment methods as needed -->
            </select>

            <div id="upiDetails" class="payment-details">
                <label for="upiId">UPI ID:</label>
                <input type="text" id="upiId" name="upiId">
            </div>

            <div id="bankDetails" class="payment-details">
                <label for="accountNumber">Bank Account Number:</label>
                <input type="text" id="accountNumber" name="accountNumber">
                <label for="ifscCode">IFSC Code:</label>
                <input type="text" id="ifscCode" name="ifscCode">
            </div>

            <div id="atmDetails" class="payment-details">
                <label for="atmCardNumber">ATM Card Number:</label>
                <input type="text" id="atmCardNumber" name="atmCardNumber">
                <label for="atmPin">ATM Pin:</label>
                <input type="password" id="atmPin" name="atmPin">
            </div>

            <div id="debitCardDetails" class="payment-details">
                <label for="debitCardNumber">Debit Card Number:</label>
                <input type="text" id="debitCardNumber" name="debitCardNumber">
                <label for="debitCardExpiry">Expiry Date:</label>
                <input type="text" id="debitCardExpiry" name="debitCardExpiry" placeholder="MM/YY">
                <label for="debitCardCvv">CVV:</label>
                <input type="password" id="debitCardCvv" name="debitCardCvv">
            </div>

            <button type="submit" class="pay-button">Proceed to Pay</button>
        </form>
    </div>
</body>
</html>
