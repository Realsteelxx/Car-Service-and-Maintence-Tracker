package com.cartracker;

public class Motorcycle extends Vehicle {
    private String model;

    public Motorcycle(String regNumber, String owner, String model) {
        super(regNumber, owner);
        this.model = model;
    }

    public String getModel() { return model; }

    @Override
    public void display() {
        System.out.println("Motorcycle: " + getRegNumber() + " Owner: " + getOwner() + " Model: " + model);
    }
}
