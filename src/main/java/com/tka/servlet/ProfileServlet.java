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

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get existing session
            HttpSession session = request.getSession(false);

            // If session is expired, go to login page
            if (session == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            // Get logged-in user's ID
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            // Fetch user details
            UserDao dao = new UserDao();

            ResultSet rs = dao.getUserById(userId);

            // Send data to JSP
            request.setAttribute("userData", rs);

            RequestDispatcher rd =
                    request.getRequestDispatcher("profile.jsp");

            rd.forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute("error",
                    "Unable to load profile.");

            RequestDispatcher rd =
                    request.getRequestDispatcher("profile.jsp");

            rd.forward(request, response);
        }
    }
}