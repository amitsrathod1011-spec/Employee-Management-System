package com.tka;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");

    try {

       

        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ems_db",
                "root",
                "root123"
        );

        
        PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name,email,password,role) VALUES(?,?,?,?)");

        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.setString(4, role);

        int checked = ps.executeUpdate();

        if (checked > 0) {

            response.sendRedirect("index.jsp");

        } else {

            RequestDispatcher rd =
                    request.getRequestDispatcher("register.jsp");

            rd.include(request, response);

            out.println("<h3 style='color:red'>Registration Failed!</h3>");
        }

        ps.close();
        con.close();

    } catch (Exception e) {

        e.printStackTrace();
        out.println("<h3 style='color:red'>Error : "
                + e.getMessage() + "</h3>");
    }
}


}
