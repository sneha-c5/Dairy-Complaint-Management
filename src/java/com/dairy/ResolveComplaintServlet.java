package com.dairy;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ResolveComplaintServlet extends HttpServlet {
    
    // Handle GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String complaintId = request.getParameter("id");
        
        if (complaintId != null) {
            try {
                // Database connection (Assume you have a method to get the DB connection)
                Connection conn = DatabaseUtils.getConnection();
                
                // SQL query to mark complaint as resolved
                String query = "UPDATE complaints SET status = 'Resolved' WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setInt(1, Integer.parseInt(complaintId));
                
                int rowsUpdated = stmt.executeUpdate();
                
                if (rowsUpdated > 0) {
                    // Redirect to a success page or engineer dashboard
                    response.sendRedirect("engineer_dashboard.jsp?status=resolved");
                } else {
                    // Handle error case, no rows updated
                    response.sendRedirect("error.jsp?message=Complaint Not Found");
                }
                
                
            } catch (SQLException e) {
                // Log the error and show an error page
                response.sendRedirect("error.jsp?message=Database Error");
            } catch (IOException | NumberFormatException ex) {
                Logger.getLogger(ResolveComplaintServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            // Invalid ID or missing parameter
            response.sendRedirect("error.jsp?message=Invalid Complaint ID");
        }
    }
}
