package com.quicknotes.dao;

import com.quicknotes.model.User;
import com.quicknotes.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    public User findByUsername(String username){
        String query = "select * from users where username = ?";
        User user = null;
        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                user = new User();
                user.setUserid(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }
}
