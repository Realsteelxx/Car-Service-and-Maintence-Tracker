package com.customers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/customersServlet")
public class customersServlet extends HttpServlet {

    private static final String DIRECTORY ="C:\\Users\\USER\\Desktop\\OOP Project\\user.info";
    private static final String CUSTOMERS_FILE = DIRECTORY+"\\user-data.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if("addCustomer".equals(action)) {
            addCustomer(request,response);
        }
        else if("deleteCustomer".equals(action)) {
            deleteCustomer(request,response);
        } else if ("updateCustomer".equals(action)) {
            updateCustomer(request,response);

        }
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("number");

        if(name == null || email == null || phone == null) {
            response.getWriter().println("Customer name and email are required");
            return;
        }

        try(BufferedWriter writer = new BufferedWriter(new FileWriter(CUSTOMERS_FILE,true))) {
            writer.write(name + "," + email + "," + phone );
            writer.newLine();
        }
        response.sendRedirect("customer-list.jsp");
    }
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nametoDelete = request.getParameter("name");

        File inputFile = new File(CUSTOMERS_FILE);
        File tempFile = new File(DIRECTORY+"\\temp_customers.txt");

        List<String> lines = new ArrayList<>();

        try(BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            while((line = reader.readLine()) != null) {
                if(!line.startsWith(nametoDelete+",")) {
                    lines.add(line);

                }
            }
        }

        try(BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            for(String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        }

        inputFile.delete();
        tempFile.renameTo(inputFile);
        response.sendRedirect("customer-list.jsp");

    }
    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
       String originalName = request.getParameter("originalName");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("number");
        if(name == null || email == null || phone == null) {
            response.getWriter().println("Customer name and email are required");
            return;
        }
        File inputFile = new File(CUSTOMERS_FILE);
        File tempFile = new File(DIRECTORY+"\\temp_customers.txt");

        List<String> lines = new ArrayList<>();

        try(BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            while((line = reader.readLine()) != null) {
                if(line.startsWith(originalName+",")) {
                    line = name+","+email+","+phone;

                }
                lines.add(line);
            }
        }
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            for(String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        }
        inputFile.delete();
        tempFile.renameTo(inputFile);
        response.sendRedirect("customer-list.jsp");
    }






}
