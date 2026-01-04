package com.quicknotes.controller;

import com.quicknotes.dao.NoteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/delete-note")
public class DeleteNoteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        NoteDAO dao = new NoteDAO();
        dao.softDeleteNote(id);

        resp.sendRedirect(req.getContextPath()+"/notes");
    }
}
