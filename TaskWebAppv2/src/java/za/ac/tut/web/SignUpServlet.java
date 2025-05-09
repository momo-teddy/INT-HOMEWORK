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
import za.ac.tut.bl.ejb.UserFacadeLocal;
import za.ac.tut.entities.User;

/**
 *
 * @author Sylvia
 */
public class SignUpServlet extends HttpServlet {

   @EJB
   private UserFacadeLocal userFacade;
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password); // Hash the password in a real app

        try {
            userFacade.create(user);
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            request.setAttribute("error", "Sign up failed.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
       
    }

   


