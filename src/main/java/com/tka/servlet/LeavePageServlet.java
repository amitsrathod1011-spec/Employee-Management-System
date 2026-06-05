package com.tka.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import com.tka.dao.LeaveDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LeavePageServlet")
public class LeavePageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession(false);

            // Check Login Session
            if (session == null ||
                session.getAttribute("employeeId") == null) {

                response.sendRedirect("index.jsp");
                return;
            }

            int employeeId =
                    (Integer) session.getAttribute(
                    "employeeId");

            LeaveDao dao =
                    new LeaveDao();

            // Leave History
            ResultSet leaveData =
                    dao.getEmployeeLeaves(
                    employeeId);

            // Dashboard Cards
            int totalLeaves =
                    dao.getEmployeeTotalLeaves(
                    employeeId);

            int pendingLeaves =
                    dao.getEmployeePendingLeaves(
                    employeeId);

            int approvedLeaves =
                    dao.getEmployeeApprovedLeaves(
                    employeeId);

            int rejectedLeaves =
                    dao.getEmployeeRejectedLeaves(
                    employeeId);

            // Send Data To JSP

            request.setAttribute(
                    "leaveData",
                    leaveData);

            request.setAttribute(
                    "totalLeaves",
                    totalLeaves);

            request.setAttribute(
                    "pendingLeaves",
                    pendingLeaves);

            request.setAttribute(
                    "approvedLeaves",
                    approvedLeaves);

            request.setAttribute(
                    "rejectedLeaves",
                    rejectedLeaves);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                    "leave.jsp");

            rd.forward(
                    request,
                    response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h3>Error Loading Leave Page</h3>");

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>");
        }
    }
}