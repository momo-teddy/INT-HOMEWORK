<%-- 
    Document   : dashboard
    Created on : Apr 26, 2025, 10:58:13 AM
    Author     : Sylvia
--%>

<%@page import="za.ac.tut.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Task Page</title>
    </head>
    <body>
    <h2>Add a New Task</h2>
    <%
        User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    %>
    <form action="TaskManagementServlet" method="post">
        <div>
            <label for="title">Task Title:</label>
            <input type="text" name="title" id="title" required>
        </div>
        <div>
            <label for="description">Description:</label>
            <textarea name="description" id="description" rows="4" cols="50"></textarea>
        </div>
        <button type="submit" name="action" value="addTask">Add Task</button>
        <button type="submit" name="action" value="viewTasks">View Tasks</button>
    </form>

    <!-- Include the outcome page to display tasks -->
    

    <!-- Logout -->
    <form action="LogoutServlet" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
