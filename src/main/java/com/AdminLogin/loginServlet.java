package com.AdminLogin;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

    private static final String FILE_PATH ="C:\\Users\\USER\\Desktop\\OOP Project\\user.info\\credentials.txt" ;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isValid = validateAdmin(username, password);
        if(isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", username);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("vehicle_list.jsp");
        }
    }

    private boolean validateAdmin(String username, String password) {
        File file = new File(FILE_PATH);

        try {
            // Create file with default credentials if it doesn't exist
            if(!file.exists()) {
                file.createNewFile();
                FileWriter writer = new FileWriter(file);
                writer.write("admin,admin123\n");
                writer.close();
            }

            // Read file to validate credentials
            Scanner sc = new Scanner(file);
            while(sc.hasNextLine()) {
                String line = sc.nextLine();
                String[] parts = line.split(",");
                if(parts.length == 2 && parts[0].equals(username) && parts[1].equals(password)) {
                    sc.close();
                    return true;
                }
            }
            sc.close();
        } catch(IOException e) {
            e.printStackTrace();
        }
        return false;
    }

   /* public static void addAdmin(String username, String password) throws IOException {
        FileWriter writer = new FileWriter(FILE_PATH, true);
        writer.write(username + "," + password + "\n");
        writer.close();
    }*/
}