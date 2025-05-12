<%-- 
    Document   : dashboard
    Created on : Apr 26, 2025, 10:58:13 AM
    Author     : Sylvia
--%>

<%@page import="za.ac.tut.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Task - Taskly</title>
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
            position: relative;
            color: #333;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h2 {
            font-size: 2rem;
            color: #fff;
            margin-bottom: 20px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
        }

        form {
            background: #fff;
            padding: 30px 25px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 500px;
        }

        form div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
            box-sizing: border-box;
        }

        button {
            background-color: #d63384;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            margin-right: 10px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #ad2d6d;
        }

        /* Logout button */
        .logout-container {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .logout-container form {
            background: none;
            box-shadow: none;
            padding: 0;
        }

        .logout-container button {
            background-color: #dc3545;
            padding: 8px 14px;
            font-size: 13px;
        }

        .logout-container button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- Logout Button at Top-Right -->
<div class="logout-container">
    <form action="LogoutServlet" method="post">
        <button type="submit">Logout</button>
    </form>
</div>

<h2>Add a New Task</h2>
<form action="TaskManagementServlet" method="post">
    <div>
        <label for="title">Task Title:</label>
        <input type="text" name="title" id="title">
    </div>
    <div>
        <label for="description">Description:</label>
        <textarea name="description" id="description" rows="4" cols="50"></textarea>
    </div>
   
    
    <button type="submit" name="action" value="addTask">Add Task</button>
    <button type="submit" name="action" value="viewTasks">View Tasks</button>
</form>

</body>
</html>

