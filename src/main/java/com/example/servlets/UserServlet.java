package com.example.servlets;

import com.example.dao.UserDao;
import com.example.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            registerUser(request, response);
        } else if ("login".equals(action)) {
            loginUser(request, response);
        } else if ("updateProfile".equals(action)) {
            updateProfile(request, response);
        } else {
            response.sendRedirect("error.jsp"); // Redirect to an error page if action is unknown
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setPassword(password);

        userDao.registerUser(user);

        response.sendRedirect("login.jsp");
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDao.loginUser(email, password);

        if (user != null) {
            Integer units = userDao.getUserUnits(email, password); // Fetch units
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("units", units); // Store units in session
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String password = request.getParameter("password");

            user.setName(name);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setPassword(password);

            userDao.updateUser(user);

            // Update the user in the session
            request.getSession().setAttribute("user", user);

            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
