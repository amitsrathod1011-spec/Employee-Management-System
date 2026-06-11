
package com.tka.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import com.tka.dao.AttendanceDao;
import com.tka.dao.SalaryDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EmployeeSalaryServlet")
public class EmployeeSalaryServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession(false);

            if (session == null) {

                response.sendRedirect("index.jsp");
                return;
            }

            Integer employeeId =
                    (Integer) session.getAttribute("employeeId");

            if (employeeId == null) {

                response.sendRedirect("index.jsp");
                return;
            }

            SalaryDao salaryDao =
                    new SalaryDao();

            AttendanceDao attendanceDao =
                    new AttendanceDao();

            ResultSet salaryData =
                    salaryDao.getEmployeeSalary(employeeId);

            int presentDays =
                    attendanceDao.getPresentCount(employeeId);

            int absentDays =
                    attendanceDao.getAbsentCount(employeeId);

            double attendancePercentage =
                    attendanceDao.getAttendancePercentage(employeeId);

            if (salaryData != null && salaryData.next()) {

                double basicSalary =
                        salaryData.getDouble("basic_salary");

                double bonus =
                        salaryData.getDouble("bonus");

                double deduction =
                        salaryData.getDouble("deduction");

                double adminNetSalary =
                        salaryData.getDouble("net_salary");

                String salaryMonth =
                        salaryData.getString("salary_month");

                double perDaySalary =
                        basicSalary / 30.0;

                double earnedSalary =
                        (perDaySalary * presentDays)
                        + bonus
                        - deduction;

                request.setAttribute(
                        "basicSalary",
                        basicSalary);

                request.setAttribute(
                        "bonus",
                        bonus);

                request.setAttribute(
                        "deduction",
                        deduction);

                request.setAttribute(
                        "adminNetSalary",
                        adminNetSalary);

                request.setAttribute(
                        "salaryMonth",
                        salaryMonth);

                request.setAttribute(
                        "presentDays",
                        presentDays);

                request.setAttribute(
                        "absentDays",
                        absentDays);

                request.setAttribute(
                        "attendancePercentage",
                        attendancePercentage);

                request.setAttribute(
                        "perDaySalary",
                        perDaySalary);

                request.setAttribute(
                        "earnedSalary",
                        earnedSalary);
            }

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                    "employeeSalary.jsp");

            rd.forward(request, response);

        }

        catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error : " + e.getMessage());
        }
    }
}
