package com.tka.servlet;

import java.io.IOException;
import java.util.List;

import com.tka.dao.EmployeeDao;
import com.tka.model.Employee;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        EmployeeDao dao = new EmployeeDao();

        List<Employee> list =
                dao.getAllEmployees();

        request.setAttribute("employees",
                list);

        RequestDispatcher rd =
                request.getRequestDispatcher(
                        "viewEmployees.jsp");

        rd.forward(request,response);
    }
}