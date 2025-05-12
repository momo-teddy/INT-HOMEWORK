<%@page import="za.ac.tut.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            background-color: #e6f0ff;
            color: #003366;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 40px;
        }

        h2 {
            color: #004080;
            margin-bottom: 30px;
        }

        form {
            display: inline-block;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: left;
            margin: 10px auto;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 20px;
            margin-right: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0052a3;
        }

        .logout-form {
            margin-top: 30px;
        }
    </style>
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

    <!-- Logout -->
    <form action="LogoutServlet" method="post" class="logout-form">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
