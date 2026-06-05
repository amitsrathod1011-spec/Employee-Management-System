package com.tka.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import com.tka.dao.UserDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SettingsServlet")
public class SettingsServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession(false);

            if(session == null) {

                response.sendRedirect("index.jsp");
                return;
            }

            Integer userId =
                    (Integer)session.getAttribute(
                    "userId");

            UserDao dao =
                    new UserDao();

            ResultSet userData =
                    dao.getUserById(userId);

            request.setAttribute(
                    "userData",
                    userData);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                    "settings.jsp");

            rd.forward(
                    request,
                    response);

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}