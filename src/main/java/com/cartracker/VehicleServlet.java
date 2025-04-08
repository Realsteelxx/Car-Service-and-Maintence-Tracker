package com.cartracker;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/VehicleServlet")
public class VehicleServlet extends HttpServlet {
    private static final String DIRECTORY = "C:\\Users\\USER\\Desktop\\OOP Project\\vehicle.info";
    private static final String VEHICLE_FILE = DIRECTORY + "\\vehicle_data.txt";
    private static final String SERVICE_FILE = DIRECTORY + "\\service_records.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addVehicle".equals(action)) {
            addVehicle(request, response);

        } else if ("deleteVehicle".equals(action)) {
            deleteVehicle(request, response);
        }
    }

    // ✅ Add a new vehicle
    private void addVehicle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regNumber = request.getParameter("id");
        String owner = request.getParameter("owner");
        String model = request.getParameter("model");
        String type = request.getParameter("type");

        if (regNumber == null || owner == null || model == null || type == null) {
            response.getWriter().write("Invalid input!");
            return;
        }

        // Save to file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(VEHICLE_FILE, true))) {
            writer.write(regNumber + "," + owner + "," + model + "," + type);
            writer.newLine();
        }

        response.sendRedirect("vehicle_list.jsp");
    }



    // ✅ Delete a vehicle
    private void deleteVehicle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regNumberToDelete = request.getParameter("id");

        File inputFile = new File(VEHICLE_FILE);
        File tempFile = new File(DIRECTORY + "\\temp_vehicle_data.txt");

        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.startsWith(regNumberToDelete + ",")) {
                    lines.add(line);
                }
            }
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        }

        inputFile.delete();
        tempFile.renameTo(inputFile);

        response.sendRedirect("vehicle_list.jsp");
    }
}
