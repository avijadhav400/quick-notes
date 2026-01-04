package com.quicknotes.controller;

import com.quicknotes.dao.NoteDAO;
import com.quicknotes.model.Note;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/notes")
public class NotesListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userid = 1;

        NoteDAO dao = new NoteDAO();
        List<Note> notes = dao.getActiveNotes(userid);
        req.setAttribute("notes", notes);

        req.getRequestDispatcher("/jsp/notes-list.jsp")
                .forward(req, resp);


    }
}
