<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entities.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Your Tasks</title>
    <style>
        body {
            background-color: #e6f0ff;
            color: #003366;
            font-family: Arial, sans-serif;
            padding: 40px;
            text-align: center;
        }

        h1 {
            color: #004080;
            margin-bottom: 30px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            max-width: 600px;
            margin: 0 auto 30px auto;
            text-align: left;
        }

        li {
            background-color: white;
            border: 1px solid #b3c6ff;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        strong {
            color: #003366;
            font-size: 18px;
        }

        form {
            display: inline;
        }

        button {
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 6px 12px;
            margin-left: 8px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        button:hover {
            background-color: #004d99;
        }

        .navigation {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <h1>Your Tasks</h1>

    <ul>
        <%
            List<Task> tasks = (List<Task>) request.getAttribute("tasks");
            if (tasks != null && !tasks.isEmpty()) {
                for (Task task : tasks) {
        %>
            <li>
                <strong><%= task.getTitle() %></strong>: <%= task.getDescription() %>
                <form action="TaskManagementServlet" method="post">
                    <input type="hidden" name="action" value="editTask">
                    <input type="hidden" name="taskId" value="<%= task.getId() %>">
                    <button type="submit">Edit</button>
                </form>
                <form action="TaskManagementServlet" method="post">
                    <input type="hidden" name="action" value="deleteTask">
                    <input type="hidden" name="taskId" value="<%= task.getId() %>">
                    <button type="submit">Delete</button>
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

    <div class="navigation">
        <form action="dashboard.jsp" method="get" style="display:inline;">
            <button type="submit">Back to Dashboard</button>
        </form>
        <form action="LogoutServlet" method="post" style="display:inline;">
            <button type="submit">Logout</button>
        </form>
    </div>
</body>
</html>
