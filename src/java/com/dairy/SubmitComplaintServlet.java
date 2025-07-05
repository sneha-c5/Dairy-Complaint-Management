package com.dairy;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class SubmitComplaintServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String workerName = request.getParameter("worker_name");
        String complaintText = request.getParameter("complaint_text");
        String priority = request.getParameter("priority");

        try {
            // Load MySQL driver and connect
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Insert query
            try (Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/dairy_db", "root", "Sneha@925_"
            )) {
                // Insert query
                String query = "INSERT INTO complaints (worker_name, complaint_text, priority, date_submitted) VALUES (?, ?, ?, NOW())";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setString(1, workerName);
                    ps.setString(2, complaintText);
                    ps.setString(3, priority);
                    
                    int rows = ps.executeUpdate();
                    
                    // Redirect to success page if inserted
                    if (rows > 0) {
                        response.sendRedirect("success.jsp");
                    } else {
                        response.sendRedirect("error.jsp");
                    }
                }
            }

        } catch (IOException | ClassNotFoundException | SQLException e) {
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("submit_complaint.jsp"); // Optional: redirect GET to form
    }
}
