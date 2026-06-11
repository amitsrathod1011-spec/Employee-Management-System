
package com.tka.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import com.tka.dao.AttendanceDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EmployeeAttendanceServlet")
public class EmployeeAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession(false);

            if(session == null){

                response.sendRedirect("index.jsp");
                return;
            }

            Integer employeeId =
                    (Integer)session.getAttribute(
                    "employeeId");

            if(employeeId == null){

                response.sendRedirect("index.jsp");
                return;
            }

            System.out.println(
            "Employee ID = " + employeeId);

            AttendanceDao dao =
                    new AttendanceDao();

            ResultSet attendanceList =
                    dao.getAttendanceByEmployeeId(
                            employeeId);

            int presentCount =
                    dao.getPresentCount(
                            employeeId);

            int absentCount =
                    dao.getAbsentCount(
                            employeeId);

            int totalAttendance =
                    dao.getTotalAttendance(
                            employeeId);

            double attendancePercentage =
                    dao.getAttendancePercentage(
                            employeeId);

            request.setAttribute(
                    "attendanceList",
                    attendanceList);

            request.setAttribute(
                    "presentCount",
                    presentCount);

            request.setAttribute(
                    "absentCount",
                    absentCount);

            request.setAttribute(
                    "totalAttendance",
                    totalAttendance);

            request.setAttribute(
                    "attendancePercentage",
                    attendancePercentage);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                    "employeeAttendance.jsp");

            rd.forward(
                    request,
                    response);

        }

        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(

            "Error : "

            + e.getMessage());
        }

    }

}
