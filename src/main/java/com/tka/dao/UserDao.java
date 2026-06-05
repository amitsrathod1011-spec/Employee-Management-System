package com.tka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tka.db.DBConnection;

public class UserDao {

    // Get User Details By ID
    public ResultSet getUserById(int userId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT * FROM users WHERE id=?");

            ps.setInt(1, userId);

            return ps.executeQuery();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    // Update Profile
    public boolean updateProfile(
            int userId,
            String name,
            String email,
            String mobile) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "UPDATE users SET name=?, email=?, mobile=? WHERE id=?");

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setInt(4, userId);

            int result =
                    ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // Verify Current Password
    public boolean verifyPassword(
            int userId,
            String currentPassword) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT id FROM users WHERE id=? AND password=?");

            ps.setInt(1, userId);
            ps.setString(2, currentPassword);

            ResultSet rs =
                    ps.executeQuery();

            return rs.next();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // Change Password
    public boolean changePassword(
            int userId,
            String newPassword) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "UPDATE users SET password=? WHERE id=?");

            ps.setString(1, newPassword);
            ps.setInt(2, userId);

            int result =
                    ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
}