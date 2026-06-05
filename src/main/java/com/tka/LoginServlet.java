package com.tka;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.*;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter(
                "email");

        String password =
                request.getParameter(
                "password");

        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver");

            Connection con =
                    DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/ems_db",
                    "root",
                    "root123");

            PreparedStatement ps =
                    con.prepareStatement(

                    "SELECT * FROM users " +
                    "WHERE email=? " +
                    "AND password=?");

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "userId",
                        rs.getInt("id"));

                session.setAttribute(
                        "employeeId",
                        rs.getInt("id"));

                session.setAttribute(
                        "employeeName",
                        rs.getString("name"));

                session.setAttribute(
                        "email",
                        rs.getString("email"));

                session.setAttribute(
                        "role",
                        rs.getString("role"));

                String role =
                        rs.getString("role");

                if("admin".equalsIgnoreCase(role)) {

                    response.sendRedirect(
                            "adminDashboard.jsp");

                } else {

                    response.sendRedirect(
                            "employeeDashboard.jsp");
                }

            } else {

                response.getWriter().println(
                        "<h3>Invalid Login</h3>");
            }

            rs.close();
            ps.close();
            con.close();

        } catch(Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error : " +
                    e.getMessage());
        }
    }
}