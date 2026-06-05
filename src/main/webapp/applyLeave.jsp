<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Integer employeeId =
(Integer)session.getAttribute("employeeId");

if(employeeId == null){

    employeeId = 0;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Apply Leave</title>

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
    color:#2c3e50;
    font-weight:700;
}

.card{
    border:none;
    border-radius:15px;
    box-shadow:0 4px 15px rgba(0,0,0,.08);
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

textarea.form-control{
    height:120px !important;
}

.btn-apply{
    background:#27ae60;
    color:white;
    border:none;
    padding:12px 30px;
}

.btn-apply:hover{
    background:#229954;
    color:white;
}

.info-box{
    background:#ecf0f1;
    border-radius:10px;
    padding:15px;
}

.days{
    font-size:24px;
    color:#2980b9;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="container mt-5">

<h2 class="page-title mb-4">

<i class="fa-solid fa-calendar-check"></i>

Apply Leave

</h2>

<div class="card">

<div class="card-header">

<i class="fa-solid fa-paper-plane"></i>

Leave Request Form

</div>

<div class="card-body">

<form action="ApplyLeaveServlet"
      method="post">

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">
Employee Name
</label>

<input type="text"
       class="form-control"
       value="<%= session.getAttribute("employeeName") %>"
       readonly>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

Leave Type

</label>

<select class="form-select"
        name="leaveType"
        required>

<option value="">
Select Leave Type
</option>

<option>Sick Leave</option>

<option>Casual Leave</option>

<option>Emergency Leave</option>

<option>Vacation Leave</option>

<option>Maternity Leave</option>

<option>Paternity Leave</option>

</select>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

From Date

</label>

<input type="date"
       class="form-control"
       id="fromDate"
       name="fromDate"
       required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">

To Date

</label>

<input type="date"
       class="form-control"
       id="toDate"
       name="toDate"
       required>

</div>

</div>

<div class="mb-3">

<label class="form-label">

Reason

</label>

<textarea class="form-control"
          name="reason"
          placeholder="Enter Leave Reason..."
          required></textarea>

</div>

<div class="info-box">

<h5>Total Leave Days</h5>

<div class="days"
     id="leaveDays">

0 Days

</div>

</div>

<br>

<button type="submit"
        class="btn btn-apply">

<i class="fa-solid fa-floppy-disk"></i>

Apply Leave

</button>

<a href="employeeDashboard.jsp"
   class="btn btn-secondary">

Back

</a>

</form>

</div>

</div>

</div>

<script>

function calculateDays(){

let from =
document.getElementById(
"fromDate").value;

let to =
document.getElementById(
"toDate").value;

if(from && to){

let start =
new Date(from);

let end =
new Date(to);

let diff =
end - start;

let days =
(diff / (1000*60*60*24)) + 1;

if(days > 0){

document.getElementById(
"leaveDays").innerHTML =
days + " Days";

}else{

document.getElementById(
"leaveDays").innerHTML =
"Invalid Dates";
}

}
}

document.getElementById(
"fromDate")
.addEventListener(
"change",
calculateDays);

document.getElementById(
"toDate")
.addEventListener(
"change",
calculateDays);

</script>

</body>
</html>