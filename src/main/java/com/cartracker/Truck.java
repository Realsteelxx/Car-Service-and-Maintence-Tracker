package com.cartracker;

public class Truck extends Vehicle {
    private String model;

    public Truck(String regNumber, String owner, String model) {
        super(regNumber, owner);
        this.model = model;
    }

    public String getModel() { return model; }

    @Override
    public void display() {
        System.out.println("Truck: " + getRegNumber() + " Owner: " + getOwner() + " Model: " + model);
    }
}
