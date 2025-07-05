<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Dairy Management System</title>
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
        input, select {
            width: 95%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #dfe6e9;
            border-radius: 5px;
            font-size: 1em;
        }
        .btn {
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
        }
        .btn:hover {
            background: #74b9ff;
            color: #222;
        }
        .login-link {
            margin-top: 18px;
            display: block;
            color: #0984e3;
            text-decoration: none;
            font-size: 1em;
        }
        .login-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        <form action="RegisterComplaintServlet" method="post">
            <label for="reg-username">Username:</label>
            <input type="text" id="reg-username" name="username" required />

            <label for="reg-password">Password:</label>
            <input type="password" id="reg-password" name="password" required />

            <label for="reg-role">Role:</label>
            <select id="reg-role" name="role" required>
                <option value="">Select Role</option>
                <option value="worker">Worker</option>
                <option value="engineer">Engineer</option>
            </select>

            <button type="submit" class="btn">Register</button>
        </form>
        <a href="login.jsp" class="login-link">Already registered? Login here</a>
    </div>
</body>
</html>