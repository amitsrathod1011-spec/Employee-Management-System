
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet"%>

<%
ResultSet attendanceList =
(ResultSet)request.getAttribute("attendanceList");

int presentCount =
(Integer)request.getAttribute("presentCount");

int absentCount =
(Integer)request.getAttribute("absentCount");

int totalAttendance =
(Integer)request.getAttribute("totalAttendance");

double attendancePercentage =
(Double)request.getAttribute("attendancePercentage");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Attendance</title>

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{

background:#f4f6f9;

font-family:Segoe UI,sans-serif;

}

.card{

border:none;

border-radius:15px;

box-shadow:0px 3px 10px rgba(0,0,0,.1);

}

.summary{

text-align:center;

padding:20px;

font-size:22px;

font-weight:bold;

color:white;

border-radius:12px;

}

.present{

background:#198754;

}

.absent{

background:#dc3545;

}

.total{

background:#0d6efd;

}

.percent{

background:#6f42c1;

}

.table thead{

background:#2c3e50;

color:white;

}

</style>

</head>

<body>

<div class="container mt-4">

<h2>

<i class="fa-solid fa-calendar-check"></i>

My Attendance

</h2>

<br>

<div class="row">

<div class="col-md-3 mb-3">

<div class="summary present">

Present

<br><br>

<%=presentCount%>

</div>

</div>

<div class="col-md-3 mb-3">

<div class="summary absent">

Absent

<br><br>

<%=absentCount%>

</div>

</div>

<div class="col-md-3 mb-3">

<div class="summary total">

Total Days

<br><br>

<%=totalAttendance%>

</div>

</div>

<div class="col-md-3 mb-3">

<div class="summary percent">

Attendance %

<br><br>

<%=String.format("%.2f",attendancePercentage)%> %

</div>

</div>

</div>

<div class="card mt-3">

<div class="card-header bg-dark text-white">

Attendance History

</div>

<div class="card-body">

<table class="table table-bordered table-hover">

<thead>

<tr>

<th>Date</th>

<th>Status</th>

</tr>

</thead>

<tbody>

<%

while(attendanceList!=null && attendanceList.next()){

String status=
attendanceList.getString("status");

%>

<tr>

<td>

<%=attendanceList.getString("attendance_date")%>

</td>

<td>

<%

if(status.equalsIgnoreCase("Present")){

%>

<span class="badge bg-success">

Present

</span>

<%

}

else{

%>

<span class="badge bg-danger">

Absent

</span>

<%

}

%>

</td>

</tr>

<%

}

%>

</tbody>

</table>

<a href="DashboardServlet"

class="btn btn-secondary">

<i class="fa-solid fa-arrow-left"></i>

Back To Dashboard

</a>

</div>

</div>

</div>

</body>

</html>
