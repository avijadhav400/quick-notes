package com.quicknotes.dao;

import com.quicknotes.model.Note;
import com.quicknotes.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoteDAO {

    public List<Note> getActiveNotes(int userid) {
        List<Note> notes = new ArrayList<>();
        String query = "select * from notes where user_id = ? and status = 'ACTIVE' ORDER BY created_at desc;";

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Note n = new Note();
                n.setNoteId(rs.getInt("note_id"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                notes.add(n);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return notes;
    }

    public void addNote(int userid, String title, String content) {
        String query = "insert into notes (user_id, title, content) values (?, ?, ?)";
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userid);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.executeUpdate();

            ps.close();


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Note getNoteById(int id) {
        String query = "select * from notes where note_id = ?";
        Note note = null;
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                note = new Note();
                note.setNoteId(rs.getInt("note_id"));
                note.setTitle(rs.getString("title"));
                note.setContent(rs.getString("content"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return note;
    }

    public void softDeleteNote(int id) {
        String query = "update notes set status = 'DELETED' where note_id = ?";

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateNote(int noteId, String title, String content) {
        String query = "update notes set title = ? , content = ? where note_id = ?";
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, noteId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
