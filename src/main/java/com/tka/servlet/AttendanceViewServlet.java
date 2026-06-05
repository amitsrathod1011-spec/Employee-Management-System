package com.tka.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import com.tka.dao.AttendanceDao;
import com.tka.dao.EmployeeDao;
import com.tka.model.Employee;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AttendanceViewServlet")
public class AttendanceViewServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        EmployeeDao employeeDao =
                new EmployeeDao();

        AttendanceDao attendanceDao =
                new AttendanceDao();

        // Employee List
        List<Employee> employeeList =
                employeeDao.getAllEmployees();

        // Attendance Records
        ResultSet attendanceResultSet =
                attendanceDao.getAllAttendance();

        request.setAttribute(
                "employees",
                employeeList);

        request.setAttribute(
                "attendanceData",
                attendanceResultSet);

        RequestDispatcher rd =
                request.getRequestDispatcher(
                "attendance.jsp");

        rd.forward(
                request,
                response);
    }
}