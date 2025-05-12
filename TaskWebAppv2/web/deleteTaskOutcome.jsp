<%-- 
    Document   : deleteTaskOutcome
    Created on : May 12, 2025, 7:57:44 PM
    Author     : Sylvia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Deleted</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #ffc0cb, #ffe6f0);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }

        h1 {
            color: #d63384;
            font-size: 2rem;
        }

        p {
            margin-top: 15px;
            font-size: 1.1rem;
            color: #555;
        }

        .navigation {
            margin-top: 30px;
            display: flex;
            gap: 15px;
        }

        .navigation button {
            background-color: #007bff;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            font-size: 0.95rem;
            cursor: pointer;
        }

        .navigation button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h1>Task Deleted Successfully 🗑️</h1>
    <p>The task has been removed from your list.</p>

    <div class="navigation">
        <!-- Back to Dashboard -->
        <form action="dashboard.jsp" method="get">
            <button type="submit">Back to Dashboard</button>
        </form>

        <!-- View Tasks -->
        <form action="TaskManagementServlet" method="post">
            <input type="hidden" name="action" value="viewTasks">
            <button type="submit">View Tasks</button>
        </form>
    </div>

</body>
</html>
