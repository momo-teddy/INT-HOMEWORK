<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Task Outcome</title>
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
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        form {
            display: inline-block;
            margin: 10px;
        }

        button {
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 10px 20px;
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
    <h1>
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "An unexpected error occurred." %>
    </h1>

    <p>What would you like to do next?</p>

    <form action="dashboard.jsp" method="get">
        <button type="submit">Add Another Task</button>
    </form>

    <form action="TaskManagementServlet" method="post">
        <button type="submit" name="action" value="viewTasks">View Tasks</button>
    </form>
</body>
</html>
