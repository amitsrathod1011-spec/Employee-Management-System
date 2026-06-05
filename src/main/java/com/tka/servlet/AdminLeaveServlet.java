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

@WebServlet("/AdminLeaveServlet")
public class AdminLeaveServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            LeaveDao dao =
                    new LeaveDao();

            ResultSet leaveData =
                    dao.getAllLeaves();

            request.setAttribute(
                    "leaveData",
                    leaveData);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                    "adminLeave.jsp");

            rd.forward(
                    request,
                    response);

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}