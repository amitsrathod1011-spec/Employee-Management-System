package com.tka.servlet;

import java.io.IOException;

import com.tka.dao.LeaveDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ApplyLeaveServlet")
public class ApplyLeaveServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Open Apply Leave Page
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd =
                request.getRequestDispatcher(
                "applyLeave.jsp");

        rd.forward(request, response);
    }

    // Save Leave
    @Override
    protected void doPost(
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

            String leaveType =
                    request.getParameter(
                    "leaveType");

            String fromDate =
                    request.getParameter(
                    "fromDate");

            String toDate =
                    request.getParameter(
                    "toDate");

            String reason =
                    request.getParameter(
                    "reason");

            LeaveDao dao =
                    new LeaveDao();

            boolean result =
                    dao.applyLeave(
                    employeeId,
                    leaveType,
                    fromDate,
                    toDate,
                    reason);

            if(result){

            	HttpSession session1 = request.getSession();

            	session1.setAttribute(
            	        "successMessage",
            	        "Leave Applied Successfully!");

            	response.sendRedirect("applyLeave.jsp");

            }else{

            	HttpSession session1 = request.getSession();

            	session1.setAttribute(
            	        "errorMessage",
            	        "Failed To Apply Leave!");

            	response.sendRedirect("applyLeave.jsp");
            }

        }

        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(
            "Error : " + e.getMessage());
        }

    }

}