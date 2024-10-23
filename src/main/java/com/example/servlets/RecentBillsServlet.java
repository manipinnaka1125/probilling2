package com.example.servlets;

import com.example.dao.UserDao;
import com.example.models.Bill;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/recentBills")
public class RecentBillsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = (Integer) request.getSession().getAttribute("userId");

        if (userId != null) {
            try {
                List<Bill> recentBills = userDao.getRecentBills(userId);
                request.setAttribute("recentBills", recentBills);
                request.getRequestDispatcher("recentBills.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
