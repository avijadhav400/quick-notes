package com.quicknotes.controller;

import com.quicknotes.dao.NoteDAO;
import com.quicknotes.dao.UserDAO;
import com.quicknotes.model.Note;
import com.quicknotes.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/notes")
public class NotesListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        HttpSession session = req.getSession();
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        User user =(User) session.getAttribute("user");

        int userid = user.getUserid();

        NoteDAO dao = new NoteDAO();
        List<Note> notes = dao.getActiveNotes(userid);
        req.setAttribute("notes", notes);

        req.getRequestDispatcher("/jsp/notes-list.jsp")
                .forward(req, resp);


    }
}
