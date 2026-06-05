<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<%
ResultSet rs =
(ResultSet)request.getAttribute(
        "salaryRecord");

int salaryId = 0;
double basicSalary = 0;
double bonus = 0;
double deduction = 0;
double netSalary = 0;
String salaryMonth = "";

if(rs != null && rs.next()){

    salaryId =
    rs.getInt("salary_id");

    basicSalary =
    rs.getDouble("basic_salary");

    bonus =
    rs.getDouble("bonus");

    deduction =
    rs.getDouble("deduction");

    netSalary =
    rs.getDouble("net_salary");

    salaryMonth =
    rs.getString("salary_month");
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Salary</title>

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

.card{
    border:none;
    border-radius:15px;
    box-shadow:0 4px 15px rgba(0,0,0,.1);
}

.card-header{
    background:#2c3e50;
    color:white;
    font-size:22px;
    font-weight:600;
}

.form-control,
.form-select{
    height:50px;
}

.net-box{
    background:#ecf0f1;
    padding:15px;
    border-radius:10px;
}

.net-amount{
    color:#27ae60;
    font-size:24px;
    font-weight:bold;
}

.btn-update{
    background:#27ae60;
    color:white;
}

.btn-update:hover{
    background:#229954;
    color:white;
}

</style>

</head>
<body>

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-lg-8">

<div class="card">

<div class="card-header">

<i class="fa-solid fa-pen-to-square"></i>
 Edit Salary Record

</div>

<div class="card-body">

<form action="UpdateSalaryServlet"
      method="post">

<input type="hidden"
       name="salaryId"
       value="<%= rs.getInt("salary_id") %>">

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">
Basic Salary
</label>

<input type="number"
       class="form-control"
       id="basicSalary"
       name="basicSalary"
       value="<%= basicSalary %>"
       required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Bonus
</label>

<input type="number"
       class="form-control"
       id="bonus"
       name="bonus"
       value="<%= bonus %>">

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Deduction
</label>

<input type="number"
       class="form-control"
       id="deduction"
       name="deduction"
       value="<%= deduction %>">

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
Salary Month
</label>

<input type="text"
       class="form-control"
       name="salaryMonth"
       value="<%= salaryMonth %>"
       required>

</div>

</div>

<div class="net-box">

<h5>Net Salary</h5>

<div class="net-amount"
     id="netSalary">

₹ <%= netSalary %>

</div>

<input type="hidden"
       id="netSalaryInput"
       name="netSalary"
       value="<%= netSalary %>">

</div>

<br>

<button type="submit"
        class="btn btn-update">

<i class="fa-solid fa-floppy-disk"></i>
 Update Salary

</button>

<a href="SalaryPageServlet"
   class="btn btn-secondary">

Back

</a>

</form>

</div>

</div>

</div>

</div>

</div>

<script>

function calculateNetSalary(){

let basic =
parseFloat(
document.getElementById(
"basicSalary").value) || 0;

let bonus =
parseFloat(
document.getElementById(
"bonus").value) || 0;

let deduction =
parseFloat(
document.getElementById(
"deduction").value) || 0;

let net =
basic + bonus - deduction;

document.getElementById(
"netSalary").innerHTML =
"₹ " + net.toLocaleString();

document.getElementById(
"netSalaryInput").value =
net;
}

document.getElementById(
"basicSalary")
.addEventListener(
"input",
calculateNetSalary);

document.getElementById(
"bonus")
.addEventListener(
"input",
calculateNetSalary);

document.getElementById(
"deduction")
.addEventListener(
"input",
calculateNetSalary);

</script>

</body>
</html>