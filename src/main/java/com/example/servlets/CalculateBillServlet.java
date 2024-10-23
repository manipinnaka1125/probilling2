package com.example.servlets;

import com.example.dao.UserDao;
import com.example.models.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/calculateBill")
public class CalculateBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch selected state and calculate cost
        String state = request.getParameter("state");
        int units = Integer.parseInt(request.getParameter("units"));

        double unitCost;
        if ("4".equals(state)) {
            unitCost = 4;
        } else {
            unitCost = 5;
        }

        double totalAmount = unitCost * units;

        // Set attributes to forward to JSP
        request.setAttribute("unitCost", unitCost);
        request.setAttribute("totalAmount", totalAmount);

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("billSummary.jsp");
        dispatcher.forward(request, response);
    } 
}
