<%-- 
    Document   : addTaskOutcome
    Created on : Apr 26, 2025, 1:12:15 PM
    Author     : Sylvia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Task Added - Taskly</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            background: linear-gradient(135deg, #ffc0cb, #ff69b4, #ff1493);
            background-size: 200% 200%;
            animation: gradientMove 10s ease infinite;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #fff;
            text-align: center;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h1 {
            font-size: 2.2rem;
            margin-bottom: 10px;
        }

        .info {
            font-size: 1rem;
            margin-bottom: 25px;
        }

        button {
            background-color: #d63384;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            margin: 10px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #ad2d6d;
        }

        form {
            display: inline-block;
        }
    </style>
</head>
<body>

    <h1>
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "An unexpected error occurred." %>
    </h1>

    <div class="info">
        <% 
            String dueDate = (String) request.getAttribute("dueDate");
            if (dueDate != null) {
        %>
            <p><strong>Due Date:</strong> <%= dueDate %></p>
        <% 
            } 
        %>
        <p>What would you like to do next?</p>
    </div>

    <form action="dashboard.jsp" method="get">
        <button type="submit">Add Another Task</button>
    </form>

    <form action="TaskManagementServlet" method="post">
        <button type="submit" name="action" value="viewTasks">View Tasks</button>
    </form>

</body>
</html>

