package com.quicknotes.controller;

import com.quicknotes.dao.NoteDAO;
import com.quicknotes.model.Note;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/view-note")
public class ViewNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        NoteDAO dao = new NoteDAO();
        Note note = dao.getNoteById(id);

        req.setAttribute("note", note);
        req.getRequestDispatcher("/jsp/view-note.jsp").forward(req, resp);
    }
}
