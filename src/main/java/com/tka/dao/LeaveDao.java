package com.tka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tka.db.DBConnection;

public class LeaveDao {

    // Apply Leave
	public boolean applyLeave(
	        int employeeId,
	        String leaveType,
	        String fromDate,
	        String toDate,
	        String reason) {

	    try {

	        Connection con =
	                DBConnection.getConnection();

	        String sql =
	                "INSERT INTO leave_requests " +
	                "(employee_id,leave_type,from_date,to_date,reason,status) " +
	                "VALUES(?,?,?,?,?,?)";

	        PreparedStatement ps =
	                con.prepareStatement(sql);

	        ps.setInt(1, employeeId);
	        ps.setString(2, leaveType);
	        ps.setString(3, fromDate);
	        ps.setString(4, toDate);
	        ps.setString(5, reason);
	        ps.setString(6, "Pending");

	        int result =
	                ps.executeUpdate();

	        System.out.println(
	                "Leave Insert Result = " + result);

	        return result > 0;

	    } catch(Exception e) {

	        System.out.println(
	                "Leave Error = " + e.getMessage());

	        e.printStackTrace();
	    }

	    return false;
	}

    // View All Leave Requests (Admin)
    public ResultSet getAllLeaves() {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

                    "SELECT l.leave_id, " +
                    "e.id, " +
                    "e.name, " +
                    "e.department, " +
                    "l.leave_type, " +
                    "l.from_date, " +
                    "l.to_date, " +
                    "l.reason, " +
                    "l.status, " +
                    "l.applied_date " +
                    "FROM leave_requests l " +
                    "INNER JOIN employees e " +
                    "ON l.employee_id = e.id " +
                    "ORDER BY l.leave_id DESC");

            return ps.executeQuery();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    // Employee Leave History
    public ResultSet getEmployeeLeaves(
            int employeeId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

                    "SELECT * FROM leave_requests " +
                    "WHERE employee_id=? " +
                    "ORDER BY leave_id DESC");

            ps.setInt(1, employeeId);

            return ps.executeQuery();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    // Approve Leave
    public boolean approveLeave(
            int leaveId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

                    "UPDATE leave_requests " +
                    "SET status='Approved' " +
                    "WHERE leave_id=?");

            ps.setInt(1, leaveId);

            int result =
                    ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // Reject Leave
    public boolean rejectLeave(
            int leaveId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

                    "UPDATE leave_requests " +
                    "SET status='Rejected' " +
                    "WHERE leave_id=?");

            ps.setInt(1, leaveId);

            int result =
                    ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // Total Leave Requests
    public int getTotalLeaves() {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT COUNT(*) FROM leave_requests");

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }

    // Pending Leave Count
    public int getPendingLeaves() {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT COUNT(*) FROM leave_requests WHERE status='Pending'");

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }

    // Approved Leave Count
    public int getApprovedLeaves() {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT COUNT(*) FROM leave_requests WHERE status='Approved'");

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }

    // Rejected Leave Count
    public int getRejectedLeaves() {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT COUNT(*) FROM leave_requests WHERE status='Rejected'");

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }
    
 // Employee Total Leaves
    public int getEmployeeTotalLeaves(int employeeId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT COUNT(*) FROM leave_requests WHERE employee_id=?");

            ps.setInt(1, employeeId);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }

    // Employee Pending Leaves
    public int getEmployeePendingLeaves(int employeeId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT COUNT(*) FROM leave_requests WHERE employee_id=? AND status='Pending'");

            ps.setInt(1, employeeId);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }

    // Employee Approved Leaves
    public int getEmployeeApprovedLeaves(int employeeId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT COUNT(*) FROM leave_requests WHERE employee_id=? AND status='Approved'");

            ps.setInt(1, employeeId);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }

    // Employee Rejected Leaves
    public int getEmployeeRejectedLeaves(int employeeId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT COUNT(*) FROM leave_requests WHERE employee_id=? AND status='Rejected'");

            ps.setInt(1, employeeId);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                return rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }
    
}