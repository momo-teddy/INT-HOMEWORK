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
        <title>Add Task Outcome Page</title>
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
