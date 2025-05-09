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
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login</h1>

   
    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <p style="color:red;"><%= error %></p>
    <% 
        }
    %>

    <!-- Login form -->
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

    <!-- Link to Sign Up page -->
    <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
</body>
</html>
