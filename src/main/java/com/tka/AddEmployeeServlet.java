package com.tka;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.tka.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

    	response.setContentType("text/html");
        PrintWriter out = response.getWriter();
    	
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        double salary = Double.parseDouble(
                request.getParameter("salary"));

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "insert into employees(name,email,department,salary) values(?,?,?,?)");
            
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, department);
            ps.setDouble(4, salary);

            ps.executeUpdate();

            response.sendRedirect(
               "adminDashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}