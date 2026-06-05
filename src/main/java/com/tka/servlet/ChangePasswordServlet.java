package com.tka.servlet;

import java.io.IOException;

import com.tka.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(
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

            int userId =
                    (Integer)session.getAttribute(
                    "userId");

            String currentPassword =
                    request.getParameter(
                    "currentPassword");

            String newPassword =
                    request.getParameter(
                    "newPassword");

            String confirmPassword =
                    request.getParameter(
                    "confirmPassword");

            if(!newPassword.equals(
                    confirmPassword)) {

                response.getWriter().println(
                        "<h3>New Password and Confirm Password do not match</h3>");

                return;
            }

            UserDao dao =
                    new UserDao();

            boolean validPassword =
                    dao.verifyPassword(
                    userId,
                    currentPassword);

            if(!validPassword) {

                response.getWriter().println(
                        "<h3>Current Password is incorrect</h3>");

                return;
            }

            boolean result =
                    dao.changePassword(
                    userId,
                    newPassword);

            if(result) {

                response.sendRedirect(
                        "SettingsServlet?msg=passwordChanged");

            } else {

                response.getWriter().println(
                        "<h3>Password Update Failed</h3>");
            }

        } catch(Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h3>Error : "
                    + e.getMessage()
                    + "</h3>");
        }
    }
}