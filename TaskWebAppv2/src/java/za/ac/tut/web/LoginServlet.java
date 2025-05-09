/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import za.ac.tut.bl.ejb.UserFacadeLocal;
import za.ac.tut.entities.User;

/**
 *
 * @author Sylvia
 */
public class LoginServlet extends HttpServlet {

    @EJB
   private UserFacadeLocal userFacade;

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Find user by username and password
            User user = userFacade.findUserByUsernameAndPassword(username, password);

            if (user != null) {
                // If user exists, set session attribute and redirect to dashboard
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                response.sendRedirect("dashboard.jsp");
            } else {
                // If login fails, display error message
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Log exception and display error
            e.printStackTrace();
            request.setAttribute("error", "An error occurred during login. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
        
    }




