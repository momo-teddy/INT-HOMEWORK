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
    <title>Your Tasks - Taskly</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #ffc0cb, #ffe6f0);
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            position: relative;
        }

        h1 {
            margin-top: 40px;
            font-size: 2rem;
            color: #d63384;
        }

        .task-list {
            margin-top: 30px;
            width: 90%;
            max-width: 800px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .task-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .task-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 8px;
            color: #d63384;
        }

        .task-desc {
            margin-bottom: 12px;
            font-size: 0.95rem;
        }

        .task-actions {
            display: flex;
            gap: 10px;
        }

        .task-actions form {
            display: inline;
        }

        .task-actions button {
            background-color: #d63384;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            font-size: 0.9rem;
            cursor: pointer;
        }

        .task-actions button:hover {
            background-color: #b52a6a;
        }

        .navigation {
            margin-top: 40px;
            display: flex;
            gap: 15px;
        }

        .navigation button {
            background-color: #6f42c1; /* New color for both buttons */
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            font-size: 0.95rem;
            cursor: pointer;
        }

        .navigation button:hover {
            background-color: #59359b;
        }

        p {
            margin-top: 40px;
            font-size: 1.1rem;
            color: #555;
        }

        /* Logout button top-right */
        .logout-container {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .logout-container form {
            margin: 0;
        }

        .logout-container button {
            background-color: #dc3545;
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            font-size: 0.9rem;
            cursor: pointer;
        }

        .logout-container button:hover {
            background-color: #b02a37;
        }
    </style>
</head>
<body>

<!-- Logout button at top right -->
<div class="logout-container">
    <form action="LogoutServlet" method="post">
        <button type="submit">Logout</button>
    </form>
</div>

<h1>Your Tasks</h1>

<div class="task-list">
<%
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
    if (tasks != null && !tasks.isEmpty()) {
        for (int i = 0; i < tasks.size(); i++) {
            Task task = tasks.get(i);
%>
    <div class="task-card">
        <div class="task-title"><%= task.getTitle() %></div>
        <div class="task-desc"><%= task.getDescription() %></div>
        
        <div class="task-actions">
            <!-- Edit Task -->
            <form action="TaskManagementServlet" method="post">
                <input type="hidden" name="taskId" value="<%= task.getId() %>">
                <button type="submit" name="action" value="editTask">Edit</button>
            </form>
            <!-- Delete Task -->
            <form action="TaskManagementServlet" method="post">
                <input type="hidden" name="taskId" value="<%= task.getId() %>">
                <button type="submit" name="action" value="deleteTask">Delete</button>
            </form>
        </div>
    </div>
<%
        }
    } else {
%>
    <p>No tasks found. Start by adding a new one!</p>
<%
    }
%>
</div>

<div class="navigation">
    <form action="dashboard.jsp" method="get">
        <button type="submit">Back to Dashboard</button>
    </form>
</div>

</body>
</html>



