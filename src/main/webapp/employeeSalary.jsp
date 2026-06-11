
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
double basicSalary = request.getAttribute("basicSalary")==null ? 0 :
(Double)request.getAttribute("basicSalary");

double bonus = request.getAttribute("bonus")==null ? 0 :
(Double)request.getAttribute("bonus");

double deduction = request.getAttribute("deduction")==null ? 0 :
(Double)request.getAttribute("deduction");

double adminNetSalary = request.getAttribute("adminNetSalary")==null ? 0 :
(Double)request.getAttribute("adminNetSalary");

double perDaySalary = request.getAttribute("perDaySalary")==null ? 0 :
(Double)request.getAttribute("perDaySalary");

double earnedSalary = request.getAttribute("earnedSalary")==null ? 0 :
(Double)request.getAttribute("earnedSalary");

int presentDays = request.getAttribute("presentDays")==null ? 0 :
(Integer)request.getAttribute("presentDays");

int absentDays = request.getAttribute("absentDays")==null ? 0 :
(Integer)request.getAttribute("absentDays");

double attendancePercentage =
request.getAttribute("attendancePercentage")==null ? 0 :
(Double)request.getAttribute("attendancePercentage");

String salaryMonth =
request.getAttribute("salaryMonth")==null ?
"" :
(String)request.getAttribute("salaryMonth");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Employee Salary</title>

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{

background:#f4f6f9;

font-family:'Segoe UI',sans-serif;

}

.page-title{

font-size:30px;

font-weight:bold;

color:#2c3e50;

margin-bottom:25px;

}

.card{

border:none;

border-radius:15px;

box-shadow:0px 4px 12px rgba(0,0,0,.12);

}

.card-header{

background:#2c3e50;

color:white;

font-size:22px;

font-weight:bold;

}

.summary-card{

border-radius:12px;

padding:20px;

text-align:center;

color:white;

font-size:18px;

font-weight:bold;

}

.bg1{

background:#0d6efd;

}

.bg2{

background:#198754;

}

.bg3{

background:#ffc107;

color:black;

}

.bg4{

background:#dc3545;

}

.value{

font-size:30px;

margin-top:10px;

}

table td{

padding:12px;

font-size:18px;

}

.btn-dashboard{

background:#2c3e50;

color:white;

}

.btn-dashboard:hover{

background:black;

color:white;

}

</style>

</head>

<body>

<div class="container mt-4">

<h2 class="page-title">

<i class="fa-solid fa-money-bill-wave"></i>

My Salary

</h2>

<div class="row">

<div class="col-md-3 mb-3">

<div class="summary-card bg1">

Basic Salary

<div class="value">

₹<%=basicSalary%>

</div>

</div>

</div>

<div class="col-md-3 mb-3">

<div class="summary-card bg2">

Bonus

<div class="value">

₹<%=bonus%>

</div>

</div>

</div>

<div class="col-md-3 mb-3">

<div class="summary-card bg3">

Deduction

<div class="value">

₹<%=deduction%>

</div>

</div>

</div>

<div class="col-md-3 mb-3">

<div class="summary-card bg4">

Current Earned

<div class="value">

₹<%=String.format("%.2f",earnedSalary)%>

</div>

</div>

</div>

</div>

<div class="row mt-3">

<div class="col-lg-6 mb-3">

<div class="card">

<div class="card-header">

Salary Assigned By Admin

</div>

<div class="card-body">

<table class="table">

<tr>

<td>Basic Salary</td>

<td>

₹<%=basicSalary%>

</td>

</tr>

<tr>

<td>Bonus</td>

<td>

₹<%=bonus%>

</td>

</tr>

<tr>

<td>Deduction</td>

<td>

₹<%=deduction%>

</td>

</tr>

<tr>

<td>Net Salary</td>

<td>

₹<%=adminNetSalary%>

</td>

</tr>

<tr>

<td>Salary Month</td>

<td>

<%=salaryMonth%>

</td>

</tr>

</table>

</div>

</div>

</div>

<div class="col-lg-6 mb-3">

<div class="card">

<div class="card-header">

Attendance Based Salary

</div>

<div class="card-body">

<table class="table">

<tr>

<td>Present Days</td>

<td>

<%=presentDays%>

</td>

</tr>

<tr>

<td>Absent Days</td>

<td>

<%=absentDays%>

</td>

</tr>

<tr>

<td>Attendance %</td>

<td>

<%=String.format("%.2f",
attendancePercentage)%> %

</td>

</tr>

<tr>

<td>Per Day Salary</td>

<td>

₹<%=String.format("%.2f",
perDaySalary)%>

</td>

</tr>

<tr>

<td>

<b>Current Earned Salary</b>

</td>

<td>

<b>

₹<%=String.format("%.2f",
earnedSalary)%>

</b>

</td>

</tr>

</table>

</div>

</div>

</div>

</div>

<div class="text-center mt-4">

<a href="DashboardServlet"

class="btn btn-dashboard">

<i class="fa-solid fa-arrow-left"></i>

Back To Dashboard

</a>

</div>

</div>

</body>

</html>
