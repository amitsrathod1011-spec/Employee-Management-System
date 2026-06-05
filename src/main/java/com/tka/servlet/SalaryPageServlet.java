package com.tka.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import com.tka.dao.EmployeeDao;
import com.tka.dao.SalaryDao;
import com.tka.model.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SalaryPageServlet")
public class SalaryPageServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            EmployeeDao employeeDao =
                    new EmployeeDao();

            SalaryDao salaryDao =
                    new SalaryDao();

            // Employee List
            List<Employee> employeeList =
                    employeeDao.getAllEmployees();

            // Salary Records
            ResultSet salaryData =
                    salaryDao.getAllSalaryRecords();

            // Dashboard Cards
            double totalSalary =
                    salaryDao.getTotalSalary();

            double totalBonus =
                    salaryDao.getTotalBonus();

            double totalDeduction =
                    salaryDao.getTotalDeduction();

            double totalNetSalary =
                    salaryDao.getTotalNetSalary();

            // Send Data To JSP

            request.setAttribute(
                    "employees",
                    employeeList);

            request.setAttribute(
                    "salaryData",
                    salaryData);

            request.setAttribute(
                    "totalSalary",
                    totalSalary);

            request.setAttribute(
                    "totalBonus",
                    totalBonus);

            request.setAttribute(
                    "totalDeduction",
                    totalDeduction);

            request.setAttribute(
                    "totalNetSalary",
                    totalNetSalary);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                    "salary.jsp");

            rd.forward(
                    request,
                    response);

        } catch(Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h3>Error : "
                    + e.getMessage()
                    + "</h3>");
        }
    }
}