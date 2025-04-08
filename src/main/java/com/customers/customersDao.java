package com.customers;

import  java.io.*;
import java.util.ArrayList;
import java.util.List;



public class customersDao {

    private List<customers> customersList;
    private static final String DIRECTORY = "C:\\Users\\USER\\Desktop\\OOP Project\\user.info";
    private static final String CUSTOMER_FILE =DIRECTORY+ "\\user-data.txt";

    public customersDao() {
        customersList = new ArrayList< >();
        ensureDirectoryExits();
        loadCustomers();
    }

    private void ensureDirectoryExits() {
        File dir = new File(DIRECTORY);
        if (!dir.exists()) {
            dir.mkdir();
        }
    }
    public void addCustomer(customers customer) {
        customersList.add(customer);
        saveCustomerFile(customer);
    }

    private void saveCustomerFile(customers customer) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(CUSTOMER_FILE, true))) {
            writer.write(customer.getName()+","+customer.getEmail()+","+customer.getPhone());
            writer.newLine();


        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void loadCustomers() {
        File file = new File(CUSTOMER_FILE);
        if (!file.exists());
        try(BufferedReader reader = new BufferedReader(new FileReader(CUSTOMER_FILE)) ){
            String line;
            while ((line = reader.readLine())!=null){
                String[] data = line.split(",");
                if(data.length == 3){
                    customersList.add(new customers(data[0],data[1],data[2]));
                }
            }
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }

    public List<customers> getCustomers() {
        return customersList;
    }
    public void updateCustomer( String originalName,customers UpdatedCustomer) {
        for (int i = 0; i < customersList.size(); i++) {
            if(customersList.get(i).getName().equals(originalName)){
                customersList.set(i,UpdatedCustomer);
                saveAllCustomers();
            }

        }
    }
    private void saveAllCustomers() {
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(CUSTOMER_FILE))){
            for (customers customer : customersList) {
                writer.write(customer.getName()+","+customer.getEmail()+","+customer.getPhone());
                writer.newLine();
            }
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }

}
