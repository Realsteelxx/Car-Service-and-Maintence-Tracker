package com.cartracker;

import java.io.Serializable;

public class Vehicle implements Serializable {
    private String regNumber;
    private String owner;

    public Vehicle(String datum, String s) {
        this.regNumber = regNumber;
        this.owner = owner;
    }

    public String getRegNumber() { return regNumber; }
    public String getOwner() { return owner; }
    public void setOwner(String owner) { this.owner = owner; }

    public void display() {
        System.out.println("Vehicle: " + regNumber + " Owner: " + owner);
    }
}

