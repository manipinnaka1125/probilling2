package com.example.models;

import java.sql.Date;

public class Bill {
    private double amount;
    private Date date; // Change from String to java.sql.Date

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
