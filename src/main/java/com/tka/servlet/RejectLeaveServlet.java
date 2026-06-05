package com.tka.servlet;

import java.io.IOException;

import com.tka.dao.LeaveDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RejectLeaveServlet")
public class RejectLeaveServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int leaveId =
                    Integer.parseInt(
                    request.getParameter("id"));

            LeaveDao dao =
                    new LeaveDao();

            dao.rejectLeave(
                    leaveId);

            response.sendRedirect(
                    "AdminLeaveServlet");

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}