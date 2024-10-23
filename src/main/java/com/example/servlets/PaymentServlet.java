package com.example.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentMethod = request.getParameter("paymentMethod");

        // Handle the payment details based on the selected payment method
        switch (paymentMethod) {
            case "upi":
                String upiId = request.getParameter("upiId");
                // Process UPI payment with upiId
                break;
            case "bank":
                String accountNumber = request.getParameter("accountNumber");
                String ifscCode = request.getParameter("ifscCode");
                // Process bank transfer with accountNumber and ifscCode
                break;
            case "atm":
                String atmCardNumber = request.getParameter("atmCardNumber");
                String atmPin = request.getParameter("atmPin");
                // Process ATM payment with atmCardNumber and atmPin
                break;
            case "debitCard":
                String debitCardNumber = request.getParameter("debitCardNumber");
                String debitCardExpiry = request.getParameter("debitCardExpiry");
                String debitCardCvv = request.getParameter("debitCardCvv");
                // Process debit card payment with debitCardNumber, debitCardExpiry, and debitCardCvv
                break;
            default:
                // Handle unknown payment method
                break;
        }

        // Redirect to a confirmation page or display a success message
        response.sendRedirect(request.getContextPath() + "/paymentSuccess.jsp");
    }
}
