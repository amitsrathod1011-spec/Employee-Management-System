
package com.tka;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        String role =
                request.getParameter("role");

        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver");

            Connection con =
                    DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/ems_db",
                    "root",
                    "root123");

            // Insert into users table

            PreparedStatement userPs =
                    con.prepareStatement(

            "INSERT INTO users(name,email,password,role,mobile,department) "
            + "VALUES(?,?,?,?,?,?)");

            userPs.setString(1, name);
            userPs.setString(2, email);
            userPs.setString(3, password);
            userPs.setString(4, role);
            userPs.setString(5, "");
            userPs.setString(6, "Not Assigned");

            int userResult =
                    userPs.executeUpdate();

            // Insert employee into employees table

            if("employee".equalsIgnoreCase(role)){

                PreparedStatement empPs =
                        con.prepareStatement(

                "INSERT INTO employees(name,email,department,salary) "
                + "VALUES(?,?,?,?)");

                empPs.setString(1, name);
                empPs.setString(2, email);
                empPs.setString(3, "Not Assigned");
                empPs.setDouble(4, 0);

                empPs.executeUpdate();

                empPs.close();
            }

            userPs.close();
            con.close();

            if(userResult > 0){

                response.sendRedirect("index.jsp");

            }else{

                response.getWriter().println(
                        "<h3>Registration Failed</h3>");
            }

        }

        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(

            "<h3>Error : "

            + e.getMessage()

            + "</h3>");
        }

    }

}

