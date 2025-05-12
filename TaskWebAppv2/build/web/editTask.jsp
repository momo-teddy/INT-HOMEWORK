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
    <title>Edit Task - Taskly</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #ffc0cb, #ffe6f0);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }

        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
            width: 90%;
            max-width: 600px;
        }

        h1 {
            text-align: center;
            color: #d63384;
            margin-bottom: 25px;
        }

        form div {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #555;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        button {
            background-color: #d63384;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            margin-right: 10px;
        }

        button:hover {
            background-color: #b52a6a;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%
        Task task = (Task) request.getAttribute("task");
        if (task == null) {
            response.sendRedirect("dashboard.jsp");
            return;
        }
    %>

    <div class="container">
        <h1>Edit Task</h1>

        <form action="TaskManagementServlet" method="post">
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

            <div class="action-buttons">
                <button type="submit">Update Task</button>
        </form>

                <form action="TaskManagementServlet" method="post">
                    <input type="hidden" name="action" value="viewTasks">
                    <button type="submit">Cancel</button>
                </form>
            </div>
    </div>
</body>
</html>

