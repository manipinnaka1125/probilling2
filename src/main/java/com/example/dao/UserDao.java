package com.example.dao;

import com.example.models.User;
import com.example.models.Bill;
import com.example.models.Payment;
import com.example.utils.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {


    public void registerUser(User user) {
        String query = "INSERT INTO users (name, email, phone_number, password) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPhoneNumber());
            statement.setString(4, user.getPassword());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User loginUser(String email, String password) {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, email);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setPhoneNumber(resultSet.getString("phone_number"));
                user.setPassword(resultSet.getString("password"));
                user.setUnits(resultSet.getInt("units"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateUser(User user) {
        String query = "UPDATE users SET name = ?, phone_number = ?, password = ? WHERE email = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, user.getName());
            statement.setString(2, user.getPhoneNumber());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getEmail());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM users";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setPhoneNumber(resultSet.getString("phone_number"));
                user.setPassword(resultSet.getString("password"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public User getUserById(int id) {
        User user = null;
        String query = "SELECT * FROM users WHERE id = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setPhoneNumber(resultSet.getString("phone_number"));
                user.setPassword(resultSet.getString("password"));
               
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean deleteUser(int id) {
        String query = "DELETE FROM users WHERE id = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateUserBills(int userId, double units, java.sql.Date billDate) throws SQLException {
        String query = "UPDATE users SET units = ? WHERE id = ?";
        try (Connection connection = DBUtil.getConnection(); 
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setDouble(1, units);
            statement.setInt(2, userId);
            statement.executeUpdate();
        }
    }



    public List<Bill> getRecentBills(int userId) throws SQLException {
        List<Bill> bills = new ArrayList<>();
        String sql = "SELECT amount, date FROM bills WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Bill bill = new Bill();
                bill.setAmount(rs.getDouble("amount"));
                bill.setDate(rs.getDate("date")); // Set java.sql.Date directly
                bills.add(bill);
            }
        }

        return bills;
    }

    public List<Payment> getPaymentHistory(int userId) throws SQLException {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT amount, date FROM payments WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Payment payment = new Payment();
                payment.setAmount(rs.getDouble("amount"));
                payment.setDate(rs.getDate("date")); 
                payments.add(payment);
            }
        }

        return payments;
    }
    public Integer getUserUnits(String email, String password) {
        Integer units = null;
        try (Connection conn = DBUtil.getConnection()) {
            String query = "SELECT units FROM users WHERE email = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, email);
                stmt.setString(2, password);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        units = rs.getInt("units");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return units;
    }
}
