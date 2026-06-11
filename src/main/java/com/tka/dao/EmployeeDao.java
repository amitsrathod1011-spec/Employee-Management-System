
package com.tka.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tka.db.DBConnection;
import com.tka.model.Employee;

public class EmployeeDao {

    // Get All Employees
    public List<Employee> getAllEmployees() {

        List<Employee> list = new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT * FROM employees");

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Employee emp =
                        new Employee();

                emp.setId(
                        rs.getInt("id"));

                emp.setName(
                        rs.getString("name"));

                emp.setEmail(
                        rs.getString("email"));

                emp.setDepartment(
                        rs.getString("department"));

                emp.setSalary(
                        rs.getDouble("salary"));

                list.add(emp);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // Get Employee ID By Email
    public int getEmployeeIdByEmail(String email) {

        int employeeId = 0;

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT id FROM employees WHERE email=?");

            ps.setString(1, email);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                employeeId =
                        rs.getInt("id");
            }

            rs.close();
            ps.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return employeeId;
    }

    // Total Employees
    public int getTotalEmployees() {

        int count = 0;

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT COUNT(*) FROM employees");

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                count =
                        rs.getInt(1);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return count;
    }

    // Total Departments
    public int getDepartmentCount() {

        int count = 0;

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT COUNT(DISTINCT department) FROM employees");

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                count =
                        rs.getInt(1);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return count;
    }

    // Search Employees
    public List<Employee> searchEmployees(
            String keyword,
            String department) {

        List<Employee> list =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
            "SELECT * FROM employees " +
            "WHERE name LIKE ? " +
            "AND department LIKE ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(
                    1,
                    "%" + keyword + "%");

            ps.setString(
                    2,
                    "%" + department + "%");

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Employee emp =
                        new Employee();

                emp.setId(
                        rs.getInt("id"));

                emp.setName(
                        rs.getString("name"));

                emp.setEmail(
                        rs.getString("email"));

                emp.setDepartment(
                        rs.getString("department"));

                emp.setSalary(
                        rs.getDouble("salary"));

                list.add(emp);
            }

            rs.close();
            ps.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

}

