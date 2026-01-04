package com.quicknotes.controller;


import com.quicknotes.dao.NoteDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/update-note")
public class UpdateNoteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int noteId = Integer.parseInt(req.getParameter("noteId"));
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        NoteDAO dao = new NoteDAO();
        dao.updateNote(noteId, title, content);

        resp.sendRedirect(req.getContextPath() + "/notes");
    }
}
