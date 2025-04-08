package com.cartracker;

public class Car extends Vehicle {
    private String model;

    public Car(String regNumber, String owner, String model) {
        super(regNumber, owner);
        this.model = model;
    }

    public String getModel() { return model; }

    @Override
    public void display() {
        System.out.println("Car: " + getRegNumber() + " Owner: " + getOwner() + " Model: " + model);
    }
}

