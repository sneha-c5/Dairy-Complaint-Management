<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%

    String username = (session != null) ? (String) session.getAttribute("username") : null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Dairy Management System</title>
    <style>
        body {
            background: #f5f6fa;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 400px;
            margin: 80px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 24px rgba(44, 62, 80, 0.12);
            padding: 40px 32px 32px 32px;
            text-align: center;
        }
        h2 {
            color: #0984e3;
            margin-bottom: 18px;
            font-size: 1.5em;
        }
        label {
            display: block;
            margin-bottom: 6px;
            color: #636e72;
            font-weight: 500;
            text-align: left;
        }
        input {
            width: 95%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #dfe6e9;
            border-radius: 5px;
            font-size: 1em;
        }
        .btn, .option-btn, .logout-btn {
            width: 100%;
            padding: 12px 0;
            background: #0984e3;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 1em;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s;
            margin-bottom: 10px;
            text-decoration: none;
            display: block;
        }
        .btn:hover, .option-btn:hover, .logout-btn:hover {
            background: #74b9ff;
            color: #222;
        }
        .register-link {
            margin-top: 18px;
            display: block;
            color: #0984e3;
            text-decoration: none;
            font-size: 1em;
        }
        .register-link:hover {
            text-decoration: underline;
        }
        .footer {
            margin-top: 40px;
            color: #b2bec3;
            font-size: 0.95em;
        }
        .welcome {
            color: #2d3436;
            margin-bottom: 24px;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div class="container">
        <% if (username == null) { %>
            <h2>Login</h2>
            <form action="LoginComplaintServlet" method="post">
                <label for="login-username">Username:</label>
                <input type="text" id="login-username" name="username" required />

                <label for="login-password">Password:</label>
                <input type="password" id="login-password" name="password" required />

                <button type="submit" class="btn">Login</button>
            </form>
            <a href="register.jsp" class="register-link">New user? Register here</a>
        <% } else { %>
          <div class="container">
        <div class="welcome">
            Welcome, <b><%= username %></b>! Here is the status of your complaints.
        </div>
        <h2>Complaint Status</h2>
        
        <a href="submit_complaint.jsp" class="btn">Submit New Complaint</a>
        <a href="engineer_dashboard.jsp" class="btn">See the Complaint Status</a>
        <form action="LogoutServlet" method="post" style="display:inline;">
            <button type="submit" class="btn">Logout</button>
        </form>
    </div>
    <div class="footer">
        &copy; <%= java.time.Year.now() %> Dairy Management System
    </div>
        <% } %>
    </div>
    <div class="footer" align="center">
        &copy; <%= java.time.Year.now() %> Dairy Management System
    </div>
</body>
</html>
