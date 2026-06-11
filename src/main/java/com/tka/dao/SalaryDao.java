package com.tka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tka.db.DBConnection;

public class SalaryDao {

    // Add Salary
    public boolean addSalary(
            int employeeId,
            double basicSalary,
            double bonus,
            double deduction,
            double netSalary,
            String salaryMonth) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "INSERT INTO salary(employee_id,basic_salary,bonus,deduction,net_salary,salary_month) VALUES(?,?,?,?,?,?)");

            ps.setInt(1, employeeId);
            ps.setDouble(2, basicSalary);
            ps.setDouble(3, bonus);
            ps.setDouble(4, deduction);
            ps.setDouble(5, netSalary);
            ps.setString(6, salaryMonth);

            int result = ps.executeUpdate();

            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // View All Salary Records
    public ResultSet getAllSalaryRecords() {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT s.salary_id, " +
                    "e.id, " +
                    "e.name, " +
                    "e.department, " +
                    "s.basic_salary, " +
                    "s.bonus, " +
                    "s.deduction, " +
                    "s.net_salary, " +
                    "s.salary_month " +
                    "FROM salary s " +
                    "INNER JOIN employees e " +
                    "ON s.employee_id = e.id " +
                    "ORDER BY s.salary_id DESC");

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Get Salary By ID
    public ResultSet getSalaryById(int salaryId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT s.salary_id, " +
                    "s.employee_id, " +
                    "e.name, " +
                    "e.department, " +
                    "s.basic_salary, " +
                    "s.bonus, " +
                    "s.deduction, " +
                    "s.net_salary, " +
                    "s.salary_month " +
                    "FROM salary s " +
                    "INNER JOIN employees e " +
                    "ON s.employee_id = e.id " +
                    "WHERE s.salary_id=?");

            ps.setInt(1, salaryId);

            return ps.executeQuery();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    // Update Salary
    public boolean updateSalary(
            int salaryId,
            double basicSalary,
            double bonus,
            double deduction,
            double netSalary,
            String salaryMonth) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "UPDATE salary SET " +
                    "basic_salary=?, " +
                    "bonus=?, " +
                    "deduction=?, " +
                    "net_salary=?, " +
                    "salary_month=? " +
                    "WHERE salary_id=?");

            ps.setDouble(1, basicSalary);
            ps.setDouble(2, bonus);
            ps.setDouble(3, deduction);
            ps.setDouble(4, netSalary);
            ps.setString(5, salaryMonth);
            ps.setInt(6, salaryId);

            int rows =
                    ps.executeUpdate();

            System.out.println("Rows Updated = " + rows);

            return rows > 0;

        } catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }
    // Delete Salary
    public boolean deleteSalary(int salaryId) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "DELETE FROM salary WHERE salary_id=?");

            ps.setInt(1, salaryId);

            int result =
                    ps.executeUpdate();

            return result > 0;

        } catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // Check Duplicate Salary
    public boolean salaryExists(
            int employeeId,
            String salaryMonth) {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT * FROM salary WHERE employee_id=? AND salary_month=?");

            ps.setInt(1, employeeId);
            ps.setString(2, salaryMonth);

            ResultSet rs =
                    ps.executeQuery();

            return rs.next();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    // Total Salary
    public double getTotalSalary() {

        double totalSalary = 0;

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT SUM(basic_salary) FROM salary");

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                totalSalary =
                        rs.getDouble(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return totalSalary;
    }

    // Total Bonus
    public double getTotalBonus() {

        double totalBonus = 0;

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT SUM(bonus) FROM salary");

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                totalBonus =
                        rs.getDouble(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return totalBonus;
    }

    // Total Deduction
    public double getTotalDeduction() {

        double totalDeduction = 0;

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT SUM(deduction) FROM salary");

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                totalDeduction =
                        rs.getDouble(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return totalDeduction;
    }

    // Total Net Salary
    public double getTotalNetSalary() {

        double totalNetSalary = 0;

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT SUM(net_salary) FROM salary");

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                totalNetSalary =
                        rs.getDouble(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return totalNetSalary;
    }
    
    
 // ===============================
 // Employee Salary Record
 // ===============================

 public ResultSet getEmployeeSalary(int employeeId) {

     try {

         Connection con =
                 DBConnection.getConnection();

         PreparedStatement ps =
                 con.prepareStatement(

         "SELECT * FROM salary " +
         "WHERE employee_id=? " +
         "ORDER BY salary_id DESC LIMIT 1");

         ps.setInt(1, employeeId);

         return ps.executeQuery();

     }

     catch(Exception e) {

         e.printStackTrace();
     }

     return null;
 }


 // ===============================
 // Per Day Salary
 // ===============================

 public double getPerDaySalary(int employeeId) {

     double perDay = 0;

     try {

         ResultSet rs =
                 getEmployeeSalary(employeeId);

         if(rs.next()) {

             double basicSalary =
                     rs.getDouble("basic_salary");

             perDay =
                     basicSalary / 30.0;
         }

     }

     catch(Exception e) {

         e.printStackTrace();
     }

     return perDay;
 }


 // ===============================
 // Attendance Based Salary
 // ===============================

 public double getEarnedSalary(
         int employeeId,
         int presentDays) {

     double earnedSalary = 0;

     try {

         ResultSet rs =
                 getEmployeeSalary(employeeId);

         if(rs.next()) {

             double basicSalary =
                     rs.getDouble("basic_salary");

             double bonus =
                     rs.getDouble("bonus");

             double deduction =
                     rs.getDouble("deduction");

             double perDay =
                     basicSalary / 30.0;

             earnedSalary =
                     (perDay * presentDays)
                     + bonus
                     - deduction;
         }

     }

     catch(Exception e) {

         e.printStackTrace();
     }

     return earnedSalary;
 }
 
    
}