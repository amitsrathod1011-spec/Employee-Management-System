<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<%
ResultSet rs =
(ResultSet)request.getAttribute(
"leaveData");
%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>Admin Leave Management</title>

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
    box-shadow:0 4px 12px rgba(0,0,0,.08);
}

.table th{
    background:#2c3e50;
    color:white;
}

.badge-pending{
    background:#f39c12;
}

.badge-approved{
    background:#27ae60;
}

.badge-rejected{
    background:#e74c3c;
}

.search-box{
    max-width:300px;
}

</style>

</head>

<body>

<div class="container py-4">

<div class="d-flex justify-content-between align-items-center mb-4">

<h2 class="page-title">

<i class="fa-solid fa-calendar-check"></i>

Leave Management

</h2>

<a href="adminDashboard.jsp"
class="btn btn-secondary">

Back

</a>

</div>

<div class="card">

<div class="card-body">

<div class="d-flex justify-content-between mb-3">

<h4>

Employee Leave Requests

</h4>

<input type="text"
    id="searchInput"
    class="form-control search-box"
    placeholder="Search Leave">

</div>

<div class="table-responsive">

<table class="table table-bordered table-hover"
       id="leaveTable">

<thead>

<tr>

<th>ID</th>

<th>Employee</th>

<th>Leave Type</th>

<th>From Date</th>

<th>To Date</th>

<th>Reason</th>

<th>Status</th>

<th>Applied Date</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%
if(rs != null){

while(rs.next()){
%>

<tr>

<td>
<%= rs.getInt("leave_id") %>
</td>

<td>
<%= rs.getString("name") %>
</td>

<td>
<%= rs.getString("leave_type") %>
</td>

<td>
<%= rs.getDate("from_date") %>
</td>

<td>
<%= rs.getDate("to_date") %>
</td>

<td>
<%= rs.getString("reason") %>
</td>

<td>

<%
String status =
rs.getString("status");

if("Pending".equals(status)){
%>

<span class="badge badge-pending">
Pending
</span>

<%
}
else if("Approved".equals(status)){
%>

<span class="badge badge-approved">
Approved
</span>

<%
}
else{
%>

<span class="badge badge-rejected">
Rejected
</span>

<%
}
%>

</td>

<td>
<%= rs.getTimestamp("applied_date") %>
</td>

<td>

<%
if("Pending".equals(status)){
%>

<a href="ApproveLeaveServlet?id=<%= rs.getInt("leave_id") %>"
class="btn btn-success btn-sm">

<i class="fa-solid fa-check"></i>

Approve

</a>

<a href="RejectLeaveServlet?id=<%= rs.getInt("leave_id") %>"
class="btn btn-danger btn-sm">

<i class="fa-solid fa-xmark"></i>

Reject

</a>

<%
}else{
%>

<span class="text-muted">
Action Completed
</span>

<%
}
%>

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

</div>

<script>

document.getElementById(
"searchInput")
.addEventListener(
"keyup",
function(){

let filter =
this.value.toLowerCase();

let rows =
document.querySelectorAll(
"#leaveTable tbody tr");

rows.forEach(row => {

let text =
row.innerText.toLowerCase();

row.style.display =
text.includes(filter)
? ""
: "none";

});

});

</script>

</body>
</html>
