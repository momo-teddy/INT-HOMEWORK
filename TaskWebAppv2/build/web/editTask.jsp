<%-- 
    Document   : editTask
    Created on : Apr 26, 2025, 1:40:07 PM
    Author     : Sylvia
--%>

<%@page import="za.ac.tut.entities.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Task Page</title>
    </head>
    <body>
        <%
        // Retrieve the task object from the request attribute
        Task task = (Task) request.getAttribute("task");
        if (task == null) {
            // If the task object is null, redirect back to the dashboard
            response.sendRedirect("dashboard.jsp");
            return;
        }
    %>
        <h1>Edit Task</h1>
        <form action="TaskManagementServlet" method="post">
        <!-- Hidden fields to identify the task and specify the action -->
        <input type="hidden" name="action" value="updateTask">
        <input type="hidden" name="taskId" value="<%= task.getId() %>">

        <div>
            <label for="title">Task Title:</label>
            <input type="text" name="title" id="title" value="<%= task.getTitle() %>" required>
        </div>
        <div>
            <label for="description">Description:</label>
            <textarea name="description" id="description" rows="4" cols="50" required><%= task.getDescription() %></textarea>
        </div>
        <button type="submit">Update Task</button>
    </form>

    <!-- Cancel button to return to the task list -->
    <form action="TaskManagementServlet" method="post">
        <input type="hidden" name="action" value="viewTasks">
        <button type="submit">Cancel</button>
    </form>
    </body>
</html>
