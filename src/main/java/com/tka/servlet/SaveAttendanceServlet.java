
package com.tka.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import com.tka.dao.AttendanceDao;
import com.tka.dao.EmployeeDao;
import com.tka.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SaveAttendanceServlet")
public class SaveAttendanceServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        EmployeeDao employeeDao =
                new EmployeeDao();

        AttendanceDao attendanceDao =
                new AttendanceDao();

        List<Employee> employees =
                employeeDao.getAllEmployees();

        String today =
                LocalDate.now().toString();

        for(Employee emp : employees){

            String status =
                    request.getParameter(
                    "status_" + emp.getId());

            if(status != null){

                if(attendanceDao.attendanceExists(
                        emp.getId(),
                        today)) {

                    attendanceDao.updateAttendance(
                            emp.getId(),
                            today,
                            status);

                } else {

                    attendanceDao.markAttendance(
                            emp.getId(),
                            today,
                            status);
                }
            }
        }

        response.sendRedirect(
                "AttendanceViewServlet");
    }
}
