package com.tka.servlet;

import java.io.IOException;

import com.tka.dao.SalaryDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateSalaryServlet")
public class UpdateSalaryServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get Form Data

            int salaryId =
                    Integer.parseInt(
                    request.getParameter("salaryId"));

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

            // Calculate Net Salary

            double netSalary =
                    basicSalary +
                    bonus -
                    deduction;

            // Debug Console

            System.out.println("===== UPDATE SALARY =====");
            System.out.println("Salary ID : " + salaryId);
            System.out.println("Basic Salary : " + basicSalary);
            System.out.println("Bonus : " + bonus);
            System.out.println("Deduction : " + deduction);
            System.out.println("Net Salary : " + netSalary);
            System.out.println("Month : " + salaryMonth);

            // DAO Call

            SalaryDao dao =
                    new SalaryDao();

            boolean result =
                    dao.updateSalary(
                    salaryId,
                    basicSalary,
                    bonus,
                    deduction,
                    netSalary,
                    salaryMonth);

            System.out.println(
                    "Update Result : " + result);

            // Response

            if(result) {

                response.sendRedirect(
                        "SalaryPageServlet");

            } else {

                response.getWriter().println(
                        "<h3>Failed To Update Salary</h3>" +
                        "<br>Check salaryId and database record.");
            }

        } catch(Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h3>Error :</h3><br>" +
                    e.getMessage());
        }
    }
}