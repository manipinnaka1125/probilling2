package com.example.servlets;

import com.example.dao.UserDao;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminUpdateBills")
public class AdminUpdateBillsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            double units = Double.parseDouble(request.getParameter("units"));
            java.sql.Date billDate = new java.sql.Date(System.currentTimeMillis()); // Current date

            userDao.updateUserBills(userId, units, billDate);
            response.sendRedirect("admindashboard.jsp?success=true");
        } catch (NumberFormatException e) {
            log("NumberFormatException: " + e.getMessage(), e);
            response.sendRedirect("error.jsp?message=Invalid+number+format");
        } catch (SQLException e) {
            log("SQLException: " + e.getMessage(), e);
            response.sendRedirect("error.jsp?message=Database+error");
        } catch (Exception e) {
            log("Exception: " + e.getMessage(), e);
            response.sendRedirect("error.jsp?message=An+unexpected+error+occurred");
        }
    }
}
