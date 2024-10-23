package com.example.models;

import java.sql.Date; // Import java.sql.Date

public class Payment {
    private double amount;
    private Date date; // Use java.sql.Date for database compatibility

    // Getter and Setter for amount
    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    // Getter and Setter for date
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
