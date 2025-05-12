<%-- 
    Document   : login
    Created on : Apr 26, 2025, 10:47:59 AM
    Author     : Sylvia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login - Taskly</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            background: linear-gradient(135deg, #ffc0cb, #ff69b4, #ff1493);
            background-size: 200% 200%;
            animation: gradientMove 10s ease infinite;
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        form {
            background: #fff;
            padding: 30px 25px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            color: #333;
            width: 90%;
            max-width: 400px;
            text-align: left;
        }

        form div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        button {
            width: 100%;
            background-color: #d63384;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #ad2d6d;
        }

        p {
            margin-top: 20px;
            font-size: 14px;
        }

        a {
            color: #fff;
            font-weight: bold;
            text-decoration: underline;
        }

        .error {
            color: #ff4d4d;
            margin-bottom: 15px;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Login to Taskly</h1>

    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <% 
        }
    %>

    <form action="LoginServlet" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
        </div>
        <button type="submit">Login</button>
    </form>

    <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
</body>
</html>

