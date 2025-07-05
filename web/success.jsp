<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6ffed;
            text-align: center;
            padding: 50px;
        }
        .message {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            padding: 30px;
            display: inline-block;
            border-radius: 8px;
            color: #155724;
            font-size: 18px;
        }
        
        .endpoint{
            margin-top: 25px;
        }
        
        a{
            text-decoration: none;
            color: Black;
        }
    </style>
</head>
<body>
    <div class="message">
        ✅ Your complaint has been submitted successfully!
    </div>
    
    <div class="endpoint">
        <p>Want to add complaint again?</p> <br>
        ✅ <a href="submit_complaint.jsp">YES</a><br>
        ❌ <a href="login.jsp">NO</a>
    </div>
</body>
</html>


