package com.quicknotes.controller;

import com.quicknotes.dao.NoteDAO;
import com.quicknotes.model.User;
import com.quicknotes.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/add-note")
public class AddNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/add-note.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User)session.getAttribute("user");
        int userid = user.getUserid();

        String title = req.getParameter("title");
        String content = req.getParameter("content");

        NoteDAO dao = new NoteDAO();
        dao.addNote(userid, title, content);

        resp.sendRedirect(req.getContextPath() + "/notes?msg=saved");
    }
}
