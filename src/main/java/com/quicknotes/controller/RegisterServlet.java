package com.quicknotes.controller;

import com.quicknotes.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

        UserDAO dao = new UserDAO();
        boolean registered = dao.registerUser(username, email, password);

        if(registered){
            resp.sendRedirect(req.getContextPath() + "/login?msg=registered");
        }else{
            req.setAttribute("error", "Registration failed. Please try again.");
            req.getRequestDispatcher("/jsp/register.jsp").forward(req, resp);
        }

    }
}
