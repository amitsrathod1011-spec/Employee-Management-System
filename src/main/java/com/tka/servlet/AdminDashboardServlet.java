
package com.tka.servlet;

import java.io.IOException;
import java.util.List;

import com.tka.dao.AttendanceDao;
import com.tka.dao.EmployeeDao;
import com.tka.dao.LeaveDao;
import com.tka.model.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            EmployeeDao employeeDao =
                    new EmployeeDao();

            AttendanceDao attendanceDao =
                    new AttendanceDao();

            LeaveDao leaveDao =
                    new LeaveDao();

            // Dashboard Statistics

            int totalEmployees =
                    employeeDao.getTotalEmployees();

            int departmentCount =
                    employeeDao.getDepartmentCount();

            int presentToday =
                    attendanceDao.getPresentToday();

            int pendingLeaves =
                    leaveDao.getPendingLeaves();

            request.setAttribute(
                    "totalEmployees",
                    totalEmployees);

            request.setAttribute(
                    "departmentCount",
                    departmentCount);

            request.setAttribute(
                    "presentToday",
                    presentToday);

            request.setAttribute(
                    "pendingLeaves",
                    pendingLeaves);

            // Search Employee

            String keyword =
                    request.getParameter("keyword");

            String department =
                    request.getParameter("department");

            if (keyword == null) {

                keyword = "";
            }

            if (department == null) {

                department = "";
            }

            List<Employee> employeeList =
                    employeeDao.searchEmployees(
                            keyword,
                            department);

            request.setAttribute(
                    "employeeList",
                    employeeList);

            // Forward to JSP

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "adminDashboard.jsp");

            rd.forward(
                    request,
                    response);

        }

        catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h3>Error : "
                    + e.getMessage()
                    + "</h3>");
        }
    }
}
