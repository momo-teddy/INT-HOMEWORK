<%-- 
    Document   : dashboard_outcome
    Created on : Apr 26, 2025, 1:18:14 PM
    Author     : Sylvia
--%>

<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Tasks</title>
</head>
<body>
    <h1>Your Tasks</h1>

    <!-- Display the list of tasks -->
    <ul>
        <%
            List<Task> tasks = (List<Task>) request.getAttribute("tasks");
            if (tasks != null && !tasks.isEmpty()) {
                for (int i = 0; i < tasks.size(); i++) {
                    Task task = tasks.get(i); // Retrieve task at index i
        %>
                    <li>
                        <strong><%= task.getTitle() %></strong>: <%= task.getDescription() %>
                        <!-- Edit Task -->
                        <form action="TaskManagementServlet" method="post" style="display:inline;">
                            <button type="submit" name="action" value="editTask">Edit</button>
                            <input type="hidden" name="taskId" value="<%= task.getId() %>">
                        </form>
                        <!-- Delete Task -->
                        <form action="TaskManagementServlet" method="post" style="display:inline;">
                            <button type="submit" name="action" value="deleteTask">Delete</button>
                            <input type="hidden" name="taskId" value="<%= task.getId() %>">
                        </form>
                    </li>
        <%
                }
            } else {
        %>
            <p>No tasks found. Start by adding a new one!</p>
        <%
            }
        %>
    </ul>

    <!-- Options to navigate -->
    <form action="dashboard.jsp" method="get">
        <button type="submit">Back to Dashboard</button>
    </form>
    <form action="LogoutServlet" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
