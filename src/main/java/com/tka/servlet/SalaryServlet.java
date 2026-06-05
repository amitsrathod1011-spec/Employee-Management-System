package com.tka.servlet;

import java.io.IOException;

import com.tka.dao.SalaryDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SalaryServlet")
public class SalaryServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String empIdStr =
                    request.getParameter("employeeId");

            if(empIdStr == null ||
               empIdStr.trim().isEmpty()) {

                response.getWriter().println(
                        "<h3>Please Select Employee</h3>");
                return;
            }

            int employeeId =
                    Integer.parseInt(empIdStr);

            double basicSalary =
                    Double.parseDouble(
                    request.getParameter("basicSalary"));

            double bonus =
                    Double.parseDouble(
                    request.getParameter("bonus"));

            double deduction =
                    Double.parseDouble(
                    request.getParameter("deduction"));

            String salaryMonth =
                    request.getParameter("salaryMonth");

            double netSalary =
                    basicSalary +
                    bonus -
                    deduction;

            SalaryDao dao =
                    new SalaryDao();

            boolean result =
                    dao.addSalary(
                    employeeId,
                    basicSalary,
                    bonus,
                    deduction,
                    netSalary,
                    salaryMonth);

            if(result) {

                response.sendRedirect(
                        "SalaryPageServlet");

            } else {

                response.getWriter().println(
                        "<h3>Failed To Save Salary</h3>");
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