package com.tka.servlet;

import java.io.IOException;

import com.tka.dao.LeaveDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ApplyLeaveServlet")
public class ApplyLeaveServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get Session
            HttpSession session =
                    request.getSession(false);

            if(session == null) {

                response.getWriter().println(
                        "<h3>Session Expired. Please Login Again.</h3>");
                return;
            }

            // Get Employee ID from Session
            Integer employeeId =
                    (Integer) session.getAttribute(
                    "employeeId");

            if(employeeId == null) {

                response.getWriter().println(
                        "<h3>Employee ID Not Found In Session.</h3>");
                return;
            }

            // Get Form Data
            String leaveType =
                    request.getParameter("leaveType");

            String fromDate =
                    request.getParameter("fromDate");

            String toDate =
                    request.getParameter("toDate");

            String reason =
                    request.getParameter("reason");

            // Debug Console
            System.out.println("===== APPLY LEAVE =====");
            System.out.println("Employee ID : " + employeeId);
            System.out.println("Leave Type : " + leaveType);
            System.out.println("From Date : " + fromDate);
            System.out.println("To Date : " + toDate);
            System.out.println("Reason : " + reason);

            // Save Leave Request
            LeaveDao dao =
                    new LeaveDao();

            boolean result =
                    dao.applyLeave(
                    employeeId,
                    leaveType,
                    fromDate,
                    toDate,
                    reason);

            System.out.println(
                    "Apply Leave Result : " + result);

            if(result) {

                response.sendRedirect(
                        "LeavePageServlet");

            } else {

                response.getWriter().println(
                        "<h3>Failed To Apply Leave</h3>");
            }

        } catch(Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h3>Error :</h3><br>"
                    + e.getMessage());
        }
    }
}