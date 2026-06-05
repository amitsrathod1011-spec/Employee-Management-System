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

@WebServlet("/AttendancePageServlet")
public class AttendancePageServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        EmployeeDao employeeDao =
                new EmployeeDao();

        AttendanceDao attendanceDao =
                new AttendanceDao();

        List<Employee> employees =
                employeeDao.getAllEmployees();

        ResultSet rs =
                attendanceDao.getAllAttendance();

        request.setAttribute(
                "employees",
                employees);

        request.setAttribute(
                "attendanceData",
                rs);

        request.getRequestDispatcher(
                "attendance.jsp")
                .forward(
                request,
                response);
    }
}