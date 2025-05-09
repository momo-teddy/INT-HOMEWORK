/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.ejb.TaskFacadeLocal;
import za.ac.tut.entities.Task;
import za.ac.tut.entities.User;

/**
 *
 * @author Sylvia
 */
public class TaskManagementServlet extends HttpServlet {

    @EJB
    private TaskFacadeLocal taskFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addTask".equals(action)) {
            // Handle Add Task
            String title = request.getParameter("title");
            String description = request.getParameter("description");

            // Retrieve current user from session
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("currentUser");

            if (currentUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Create and persist the new task
            Task newTask = new Task();
            newTask.setTitle(title);
            newTask.setDescription(description);
            newTask.setUser(currentUser);

            try {
                taskFacade.create(newTask);
                // Redirect to confirmation page
                request.setAttribute("message", "Task successfully added.");
                request.getRequestDispatcher("addTaskOutcome.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error adding task. Please try again.");
                request.getRequestDispatcher("addTaskOutcome.jsp").forward(request, response);
            }

        } else if ("viewTasks".equals(action)) {
            // Handle View Tasks
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("currentUser");

            if (currentUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Fetch tasks for the logged-in user
            List<Task> tasks = taskFacade.findTasksByUser(currentUser);

            // Forward to task display page
            request.setAttribute("tasks", tasks);
            request.getRequestDispatcher("dashboard_outcome.jsp").forward(request, response);
        } else if ("updateTask".equals(action)) {
            handleUpdateTask(request, response);

        } else if ("deleteTask".equals(action)) {
            // Handle Delete Task
            handleDeleteTask(request, response);
        } else if ("editTask".equals(action)) {
            handleEditTask(request, response); // Correctly call a new handler for editing a task
        }
    }

    private void handleUpdateTask(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long taskId = Long.valueOf(request.getParameter("taskId"));
        String newTitle = request.getParameter("title");
        String newDescription = request.getParameter("description");

        try {
            Task taskToUpdate = taskFacade.find(taskId); // Find the task
            if (taskToUpdate != null) {
                taskToUpdate.setTitle(newTitle);
                taskToUpdate.setDescription(newDescription);
                taskFacade.edit(taskToUpdate); // Update the task
            }
            response.sendRedirect("viewTasks"); // Refresh task list
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error updating the task.");
            request.getRequestDispatcher("editTask.jsp").forward(request, response);
        }
    }

    private void handleDeleteTask(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long taskId = Long.valueOf(request.getParameter("taskId"));

        try {
            Task taskToDelete = taskFacade.find(taskId);
            if (taskToDelete != null) {
                taskFacade.remove(taskToDelete); // Delete the task
            }
            response.sendRedirect("viewTasks"); // Refresh task list
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error deleting the task.");
            request.getRequestDispatcher("dashboard_outcome.jsp").forward(request, response);
        }
    }

    private void handleEditTask(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long taskId = Long.valueOf(request.getParameter("taskId"));
        Task task = taskFacade.find(taskId); // Retrieve the task from the database

        if (task != null) {
            request.setAttribute("task", task); // Pass the task to editTask.jsp
            request.getRequestDispatcher("editTask.jsp").forward(request, response);
        } else {
            // If task is not found, redirect back to the task list or display an error
            request.setAttribute("error", "Task not found.");
            request.getRequestDispatcher("dashboard_outcome.jsp").forward(request, response);
        }
    }

}
