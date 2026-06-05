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
}