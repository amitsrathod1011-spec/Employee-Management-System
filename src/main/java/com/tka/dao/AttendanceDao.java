package com.tka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tka.db.DBConnection;

public class AttendanceDao {

    // Insert Attendance
    public boolean markAttendance(
            int employeeId,
            String date,
            String status) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "INSERT INTO attendance(employee_id, attendance_date, status) VALUES(?,?,?)");

            ps.setInt(1, employeeId);
            ps.setString(2, date);
            ps.setString(3, status);

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Check if attendance already exists
    public boolean attendanceExists(
            int employeeId,
            String date) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT * FROM attendance WHERE employee_id=? AND attendance_date=?");

            ps.setInt(1, employeeId);
            ps.setString(2, date);

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Update attendance
    public boolean updateAttendance(
            int employeeId,
            String date,
            String status) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "UPDATE attendance SET status=? WHERE employee_id=? AND attendance_date=?");

            ps.setString(1, status);
            ps.setInt(2, employeeId);
            ps.setString(3, date);

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // View Attendance Records
    public ResultSet getAllAttendance() {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT a.attendance_id, " +
                    "a.employee_id, " +
                    "e.name, " +
                    "e.department, " +
                    "a.attendance_date, " +
                    "a.status " +
                    "FROM attendance a " +
                    "INNER JOIN employees e " +
                    "ON a.employee_id = e.id " +
                    "ORDER BY a.attendance_date DESC");

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
 // Employee Attendance History
    public ResultSet getAttendanceByEmployeeId(int employeeId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

            "SELECT attendance_date,status " +
            "FROM attendance " +
            "WHERE employee_id=? " +
            "ORDER BY attendance_date DESC");

            ps.setInt(1, employeeId);

            return ps.executeQuery();

        }

        catch(Exception e) {

            e.printStackTrace();
        }

        return null;
    }


    // Present Count

    public int getPresentCount(int employeeId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

            "SELECT COUNT(*) FROM attendance " +
            "WHERE employee_id=? " +
            "AND status='Present'");

            ps.setInt(1, employeeId);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        }

        catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }


    // Absent Count

    public int getAbsentCount(int employeeId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

            "SELECT COUNT(*) FROM attendance " +
            "WHERE employee_id=? " +
            "AND status='Absent'");

            ps.setInt(1, employeeId);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        }

        catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }


    // Total Attendance Count

    public int getTotalAttendance(int employeeId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

            "SELECT COUNT(*) FROM attendance " +
            "WHERE employee_id=?");

            ps.setInt(1, employeeId);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        }

        catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }


    // Attendance Percentage

    public double getAttendancePercentage(int employeeId) {

        int present =
                getPresentCount(employeeId);

        int total =
                getTotalAttendance(employeeId);

        if(total==0){

            return 0;
        }

        return ((double)present/total)*100;
    }
    public int getPresentToday() {

        int count = 0;

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

            "SELECT COUNT(*) FROM attendance "
            + "WHERE attendance_date=CURDATE() "
            + "AND status='Present'");

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                count = rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return count;
    }
}

