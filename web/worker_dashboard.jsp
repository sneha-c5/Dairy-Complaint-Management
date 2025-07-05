<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
   
    String username = (session != null) ? (String) session.getAttribute("username") : null;
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Worker Dashboard - Dairy Management System</title>
    <style>
        body {
            background: #f5f6fa;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 900px;
            margin: 60px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 24px rgba(44, 62, 80, 0.12);
            padding: 40px 32px 32px 32px;
        }
        h2 {
            color: #0984e3;
            margin-bottom: 18px;
            font-size: 1.7em;
            text-align: center;
        }
        .welcome {
            color: #2d3436;
            margin-bottom: 24px;
            font-size: 1.2em;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 24px;
            background: #fafbfc;
        }
        th, td {
            padding: 14px 10px;
            border-bottom: 1px solid #dfe6e9;
            text-align: left;
        }
        th {
            background: #0984e3;
            color: #fff;
            font-weight: 600;
        }
        tr:hover {
            background: #f1f2f6;
        }
        .btn {
            display: inline-block;
            margin: 12px 10px 0 0;
            padding: 10px 24px;
            background: #0984e3;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 1em;
            font-weight: 500;
            text-decoration: none;
            transition: background 0.2s;
            cursor: pointer;
        }
        .btn:hover {
            background: #74b9ff;
            color: #222;
        }
        .footer {
            margin-top: 40px;
            color: #b2bec3;
            font-size: 0.95em;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="welcome">
            Welcome, <b><%= username %></b>! Here is the status of your complaints.
        </div>
        <h2>Complaint Status</h2>
        
        <a href="submit_complaint.jsp" class="btn">Submit New Complaint</a>
        <a href="engineer_dashboard.jsp" class="btn">See the Complaint Status</a>
<!--        <form action="login.jsp" method="post" style="display:inline;">
            <button type="submit" class="btn">Logout</button>
        </form>-->
<a href="login.jsp">
<%
      session.setAttribute("username", null);
%>
    <button class="btn">Logout</button></a>
    </div>
    <div class="footer">
        &copy; <%= java.time.Year.now() %> Dairy Management System
    </div>
</body>
</html>