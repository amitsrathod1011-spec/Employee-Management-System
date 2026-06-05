package com.tka.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import com.tka.dao.SalaryDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditSalaryServlet")
public class EditSalaryServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int salaryId =
                    Integer.parseInt(
                    request.getParameter("id"));

            SalaryDao dao =
                    new SalaryDao();

            ResultSet rs =
                    dao.getSalaryById(
                    salaryId);

            request.setAttribute(
                    "salaryData",
                    rs);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                    "editSalary.jsp");

            rd.forward(
                    request,
                    response);

        } catch(Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h3>Error : "
                    + e.getMessage()
                    + "</h3>");
        }
    }
}