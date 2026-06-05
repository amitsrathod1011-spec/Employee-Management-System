package com.tka.servlet;

import java.io.IOException;

import com.tka.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

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

            String name =
                    request.getParameter("name");

            String email =
                    request.getParameter("email");

            String mobile =
                    request.getParameter("mobile");

            UserDao dao =
                    new UserDao();

            boolean result =
                    dao.updateProfile(
                    userId,
                    name,
                    email,
                    mobile);

            if(result) {

                session.setAttribute(
                        "employeeName",
                        name);

                session.setAttribute(
                        "email",
                        email);

                response.sendRedirect(
                        "SettingsServlet?msg=profileUpdated");

            } else {

                response.getWriter().println(
                        "<h3>Profile Update Failed</h3>");
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