package com.quicknotes.dao;

import com.quicknotes.model.User;
import com.quicknotes.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    public User validate(String email, String password){
        String query = "select * from users where email = ? and password = ?";
        User user = null;
        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                user = new User();
                user.setUserid(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public boolean registerUser(String username, String email, String password) {
        String query = "insert into users (username, email, password) values (?, ?, ?)";
        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            return ps.executeUpdate()>0;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
