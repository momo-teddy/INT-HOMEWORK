<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            body {
                background-color: #e6f0ff; /* light blue background */
                color: #003366; /* dark blue text */
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 40px;
                text-align: center;
            }
            h1 {
                color: #004080;
                margin-bottom: 20px;
            }
            form {
                display: inline-block;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: left;
            }
            label {
                display: block;
                margin-top: 10px;
                font-weight: bold;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }
            button {
                background-color: #0066cc;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                margin-top: 20px;
                width: 100%;
            }
            button:hover {
                background-color: #004080;
            }
            p a {
                color: #0066cc;
                text-decoration: none;
                font-weight: bold;
            }
            p a:hover {
                text-decoration: underline;
                color: #004080;
            }
            .error {
                color: red;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <h1>Login</h1>

        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <p class="error"><%= error %></p>
        <% 
            }
        %>

        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>

            <button type="submit">Login</button>
        </form>

        <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
    </body>
</html>
