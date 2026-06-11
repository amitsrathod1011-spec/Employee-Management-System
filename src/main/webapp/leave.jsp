<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<%
ResultSet rs =
(ResultSet)request.getAttribute(
"leaveData");

Integer totalLeaves =
(Integer)request.getAttribute(
"totalLeaves");

Integer pendingLeaves =
(Integer)request.getAttribute(
"pendingLeaves");

Integer approvedLeaves =
(Integer)request.getAttribute(
"approvedLeaves");

Integer rejectedLeaves =
(Integer)request.getAttribute(
"rejectedLeaves");
%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>Leave Management</title>

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
    box-shadow:0 4px 12px rgba(0,0,0,.08);
}

.stat-card{
    text-align:center;
    padding:20px;
}

.stat-card h3{
    font-weight:bold;
}

.search-box{
    max-width:300px;
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

</style>

</head>

<body>

<div class="container py-4">

<div class="d-flex justify-content-between align-items-center mb-4">

<h2 class="page-title">

<i class="fa-solid fa-calendar-check"></i>

My Leave Management

</h2>

<a href="applyLeave.jsp"
class="btn btn-success">

<i class="fa-solid fa-plus"></i>

Apply Leave

</a>

</div>

<div class="row mb-4">

<div class="col-md-3 mb-3">

<div class="card stat-card">

<h6>Total Leaves</h6>

<h3>
<%= totalLeaves %>
</h3>

</div>

</div>

<div class="col-md-3 mb-3">

<div class="card stat-card">

<h6>Pending</h6>

<h3 class="text-warning">
<%= pendingLeaves %>
</h3>

</div>

</div>

<div class="col-md-3 mb-3">

<div class="card stat-card">

<h6>Approved</h6>

<h3 class="text-success">
<%= approvedLeaves %>
</h3>

</div>

</div>

<div class="col-md-3 mb-3">

<div class="card stat-card">

<h6>Rejected</h6>

<h3 class="text-danger">
<%= rejectedLeaves %>
</h3>

</div>

</div>

</div>

<div class="card">

<div class="card-body">

<div class="d-flex justify-content-between mb-3">

<h4>

Leave History

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

<th>Leave Type</th>

<th>From Date</th>

<th>To Date</th>

<th>Reason</th>

<th>Status</th>

<th>Applied Date</th>

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
<a href="DashboardServlet" class="btn btn-secondary">
    Back To Dashboard
</a>
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
