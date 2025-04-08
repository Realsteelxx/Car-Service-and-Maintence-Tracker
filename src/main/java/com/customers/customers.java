package com.customers;

public class customers {

    private  String name;
    private  String email;
    private  String phone;

    public customers(String name, String email, String phone) {
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public void display() {
        System.out.println("Name: " + name+"Email: " + email+"Phone: " + phone);
    }
}
