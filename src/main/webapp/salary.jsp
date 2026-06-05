<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.tka.model.Employee" %>
<%@ page import="java.sql.ResultSet" %>
<%


List<Employee> employees =
(List<Employee>)request.getAttribute("employees");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salary Management</title>

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{
    background:#f4f6f9;
    font-family:'Segoe UI',sans-serif;
}

.page-title{
    font-weight:700;
    color:#2c3e50;
}

.card{
    border:none;
    border-radius:15px;
    box-shadow:0 2px 10px rgba(0,0,0,.08);
}

.card-header{
    background:#2c3e50;
    color:white;
    font-size:20px;
    font-weight:600;
}

.form-control,
.form-select{
    height:50px;
}

.btn-save{
    background:#3498db;
    color:white;
    border:none;
    padding:12px 30px;
    border-radius:8px;
}

.btn-save:hover{
    background:#2980b9;
    color:white;
}

.salary-preview{
    background:#ecf0f1;
    border-radius:10px;
    padding:15px;
}

.amount{
    font-size:22px;
    font-weight:700;
    color:#27ae60;
}

.stat-card{
    background: linear-gradient(
    135deg,
    #3498db,
    #2c3e50);

    color:white;
    border-radius:15px;
    padding:20px;
    text-align:center;
    box-shadow:0 5px 15px rgba(0,0,0,.15);
}

.stat-card h5{
    color:white;
}

.stat-card h3{
    color:white;
    font-weight:700;
}

@media(max-width:768px){

.page-title{
    text-align:center;
}

.stat-card{
    margin-bottom:15px;
}

}

</style>
</head>
<body>

<div class="container py-4">

<h2 class="page-title mb-4">
<i class="fa-solid fa-money-bill-wave"></i>
 Salary Management
</h2>

<div class="row mb-4">

<div class="col-md-3">
<div class="stat-card">
<h5>Total Salary</h5>
<h3>
₹ <%= request.getAttribute("totalSalary") %>
</h3>
</div>
</div>

<div class="col-md-3">
<div class="stat-card">
<h5>Total Bonus</h5>
<h3>₹ <%= request.getAttribute("totalBonus") %></h3>
</div>
</div>

<div class="col-md-3">
<div class="stat-card">
<h5>Total Deduction</h5>
<h3>₹ <%= request.getAttribute("totalDeduction") %></h3>
</div>
</div>

<div class="col-md-3">
<div class="stat-card">
<h5>Net Salary</h5>
<h3>₹ <%= request.getAttribute("totalNetSalary") %></h3>
</div>
</div>

</div>

<div class="card">

<div class="card-header">
<i class="fa-solid fa-plus"></i>
 Add Salary Record
</div>

<div class="card-body">

<form action="SalaryServlet"
      method="post">

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">
Employee
</label>

<select class="form-select"
        name="employeeId"
        required>

<option value="">
Select Employee
</option>

<%
if(employees != null){

for(Employee emp : employees){
%>

<option value="<%=emp.getId()%>">
<%=emp.getName()%>
(
<%=emp.getDepartment()%>
)
</option>

<%
}
}
%>

</select>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Salary Month
</label>

<select class="form-select"
        name="salaryMonth">

<option>January 2026</option>
<option>February 2026</option>
<option>March 2026</option>
<option>April 2026</option>
<option>May 2026</option>
<option>June 2026</option>
<option>July 2026</option>
<option>August 2026</option>
<option>September 2026</option>
<option>October 2026</option>
<option>November 2026</option>
<option>December 2026</option>

</select>

</div>

<div class="col-md-4 mb-3">

<label class="form-label">
Basic Salary
</label>

<input type="number"
       class="form-control"
       id="basicSalary"
       name="basicSalary"
       required>

</div>

<div class="col-md-4 mb-3">

<label class="form-label">
Bonus
</label>

<input type="number"
       class="form-control"
       id="bonus"
       name="bonus"
       value="0">

</div>

<div class="col-md-4 mb-3">

<label class="form-label">
Deduction
</label>

<input type="number"
       class="form-control"
       id="deduction"
       name="deduction"
       value="0">

</div>

</div>

<div class="salary-preview mt-3">

<h5>
Net Salary Preview
</h5>

<div class="amount"
     id="netSalary">
₹ 0
</div>

<input type="hidden"
       name="netSalary"
       id="netSalaryInput">

</div>

<br>

<button type="submit"
        class="btn-save">

<i class="fa-solid fa-floppy-disk"></i>
 Save Salary

</button>

<a href="adminDashboard.jsp"
   class="btn btn-secondary ms-2">

Back

</a>

</form>

</div>

</div>

</div>

<!-- Salary Records -->

<div class="card mt-4">

    <div class="card-header">
        <i class="fa-solid fa-table"></i>
        Salary Records
    </div>

    <div class="card-body">

        <div class="row mb-3">

            <div class="col-md-6">

                <input type="text"
                       id="salarySearch"
                       class="form-control"
                       placeholder="Search Employee Name">

            </div>

        </div>

        <div class="table-responsive">

            <table class="table table-striped table-bordered"
                   id="salaryTable">

                <thead class="table-dark">

                <tr>

                    <th>ID</th>
                    <th>Employee</th>
                    <th>Month</th>
                    <th>Basic</th>
                    <th>Bonus</th>
                    <th>Deduction</th>
                    <th>Net Salary</th>
                    <th>Actions</th>

                </tr>

                </thead>

                <tbody>

                <%

                ResultSet salaryData =
                (ResultSet)request.getAttribute(
                        "salaryData");

                if(salaryData != null){

                while(salaryData.next()){
                %>

                <tr>

                    <td>
                        <%= salaryData.getInt("salary_id") %>
                    </td>

                    <td>
                        <%= salaryData.getString("name") %>
                    </td>

                    <td>
                        <%= salaryData.getString("salary_month") %>
                    </td>

                    <td>
                        ₹ <%= salaryData.getDouble("basic_salary") %>
                    </td>

                    <td>
                        ₹ <%= salaryData.getDouble("bonus") %>
                    </td>

                    <td>
                        ₹ <%= salaryData.getDouble("deduction") %>
                    </td>

                    <td class="text-success fw-bold">
                        ₹ <%= salaryData.getDouble("net_salary") %>
                    </td>

                    <td>

                        <a href="EditSalaryServlet?id=<%= salaryData.getInt("salary_id") %>"
                           class="btn btn-warning btn-sm">

                            <i class="fa fa-edit"></i>

                        </a>

                        <a href="DeleteSalaryServlet?id=<%= salaryData.getInt("salary_id") %>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Delete Salary Record?')">

                            <i class="fa fa-trash"></i>

                        </a>

                    </td>

                </tr>

                <%
                }
                }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>

<script>

function calculateSalary() {

    let basic =
    parseFloat(
    document.getElementById("basicSalary").value
    ) || 0;

    let bonus =
    parseFloat(
    document.getElementById("bonus").value
    ) || 0;

    let deduction =
    parseFloat(
    document.getElementById("deduction").value
    ) || 0;

    let net =
    basic + bonus - deduction;

    // Net Salary Preview

    document.getElementById("netSalary").innerHTML =
    "₹ " + net.toLocaleString();

    document.getElementById("netSalaryInput").value =
    net;

}

// Wait until page loads

window.onload = function() {

    // Salary Calculation

    document.getElementById("basicSalary")
    .addEventListener("input", calculateSalary);

    document.getElementById("bonus")
    .addEventListener("input", calculateSalary);

    document.getElementById("deduction")
    .addEventListener("input", calculateSalary);

    calculateSalary();

    // Salary Search

    let searchBox =
    document.getElementById("salarySearch");

    if(searchBox){

        searchBox.addEventListener(
        "keyup",
        function(){

            let filter =
            this.value.toLowerCase();

            let rows =
            document.querySelectorAll(
            "#salaryTable tbody tr");

            rows.forEach(function(row){

                let text =
                row.innerText.toLowerCase();

                row.style.display =
                text.includes(filter)
                ? ""
                : "none";

            });

        });

    }

};

</script>
</body>
</html>