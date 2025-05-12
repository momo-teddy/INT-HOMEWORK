<%@page import="za.ac.tut.entities.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Task Page</title>
    <style>
        body {
            background-color: #e6f0ff;
            color: #003366;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 40px;
        }

        h1 {
            color: #004080;
            margin-bottom: 30px;
        }

        form {
            display: inline-block;
            text-align: left;
            margin: 20px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 15px 0 5px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #004d99;
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

    <h1>Edit Task</h1>

    <form action="TaskManagementServlet" method="post">
        <input type="hidden" name="action" value="updateTask">
        <input type="hidden" name="taskId" value="<%= task.getId() %>">

        <label for="title">Task Title:</label>
        <input type="text" name="title" id="title" value="<%= task.getTitle() %>" required>

        <label for="description">Description:</label>
        <textarea name="description" id="description" rows="4" cols="50" required><%= task.getDescription() %></textarea>

        <button type="submit">Update Task</button>
    </form>

    <form action="TaskManagementServlet" method="post">
        <input type="hidden" name="action" value="viewTasks">
        <button type="submit">Cancel</button>
    </form>
</body>
</html>
