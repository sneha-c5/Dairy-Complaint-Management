<%@ page import="java.sql.*" %>
<%@ page import="com.dairy.DatabaseUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>View Complaints</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            border-collapse: collapse;
            width: 90%;
            margin: auto;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .resolved {
            background-color: #d4edda; /* light green */
            color: #155724;
        }
        .pending {
            background-color: #fff3cd; /* light yellow */
            color: #856404;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>
    <h2 align="center">All Complaints</h2>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtils.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM complaints ORDER BY priority DESC, date_submitted ASC");
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Worker Name</th>
            <th>Complaint</th>
            <th>Priority</th>
            <th>Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            while (rs.next()) {
                String status = rs.getString("status");
                String rowClass = "pending";
                if ("Resolved".equalsIgnoreCase(status)) {
                    rowClass = "resolved";
                }
        %>
        <tr class="<%= rowClass %>">
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("worker_name") %></td>
            <td><%= rs.getString("complaint_text") %></td>
            <td><%= rs.getString("priority") %></td>
            <td><%= rs.getTimestamp("date_submitted") %></td>
            <td><%= status %></td>
            <td>
                <% if (!"Resolved".equalsIgnoreCase(status)) { %>
                    <a href="ResolveComplaintServlet?id=<%= rs.getInt("id") %>">Mark Resolved</a>
                <% } else { %>
                    ✔
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
    <%
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error fetching complaints.</p>");
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
