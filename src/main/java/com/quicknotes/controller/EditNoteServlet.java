package com.quicknotes.controller;

import com.quicknotes.dao.NoteDAO;
import com.quicknotes.model.Note;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/edit-note")
public class EditNoteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");

        if (idParam == null) {
            resp.sendRedirect(req.getContextPath() + "/notes");
            return;
        }

        int noteId = Integer.parseInt(idParam);

        NoteDAO dao = new NoteDAO();
        Note note = dao.getNoteById(noteId);

        if (note == null) {
            resp.sendRedirect(req.getContextPath() + "/notes");
            return;
        }

        req.setAttribute("note", note);
        req.getRequestDispatcher("/jsp/edit-note.jsp").forward(req, resp);
    }
}
