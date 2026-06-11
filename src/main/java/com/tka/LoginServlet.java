
package com.tka;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.*;
import java.sql.*;

import com.tka.dao.EmployeeDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

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
            "WHERE email=? AND password=?");

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                HttpSession session =
                        request.getSession();

                // User ID from users table
                int userId =
                        rs.getInt("id");

                // User Email
                String userEmail =
                        rs.getString("email");

                // User Name
                String userName =
                        rs.getString("name");

                // User Role
                String role =
                        rs.getString("role");

                // Get Employee ID from employees table
                EmployeeDao employeeDao =
                        new EmployeeDao();

                int employeeId =
                        employeeDao.getEmployeeIdByEmail(
                                userEmail);

                // Store Session Values

                session.setAttribute(
                        "userId",
                        userId);

                session.setAttribute(
                        "employeeId",
                        employeeId);

                session.setAttribute(
                        "employeeName",
                        userName);

                session.setAttribute(
                        "email",
                        userEmail);

                session.setAttribute(
                        "role",
                        role);

                System.out.println(
                        "User ID : " + userId);

                System.out.println(
                        "Employee ID : " + employeeId);

                if("admin".equalsIgnoreCase(role)) {

                	response.sendRedirect("AdminDashboardServlet");

                }

                else {

                    response.sendRedirect(
                            "employeeDashboard.jsp");
                }

            }

            else {

                response.getWriter().println(

                "<h3>Invalid Email or Password</h3>");
            }

            rs.close();
            ps.close();
            con.close();

        }

        catch(Exception e) {

            e.printStackTrace();

            response.getWriter().println(

            "Error : " + e.getMessage());
        }
    }

}