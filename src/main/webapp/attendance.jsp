
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.tka.model.Employee" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance Dashboard</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#f4f6f9;
    padding:20px;
}

.card{
    background:white;
    border-radius:12px;
    padding:25px;
    margin-bottom:25px;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);
}

h2{
    color:#2c3e50;
    margin-bottom:20px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#2c3e50;
    color:white;
    padding:14px;
    text-align:center;
}

td{
    padding:12px;
    border:1px solid #ddd;
    text-align:center;
}

tr:nth-child(even){
    background:#f9f9f9;
}

.btn{
    background:#3498db;
    color:white;
    border:none;
    padding:12px 25px;
    border-radius:6px;
    cursor:pointer;
    font-size:15px;
}

.btn:hover{
    background:#2980b9;
}

.search{
    width:300px;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
    margin-bottom:15px;
}

.present{
    color:green;
    font-weight:bold;
}

.absent{
    color:red;
    font-weight:bold;
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.back-btn{
    text-decoration:none;
    background:#34495e;
    color:white;
    padding:10px 20px;
    border-radius:5px;
}

.back-btn:hover{
    background:#2c3e50;
}

@media(max-width:768px){

    .search{
        width:100%;
    }

    table{
        font-size:13px;
    }

    th,td{
        padding:8px;
    }

    .header{
        flex-direction:column;
        gap:10px;
    }
}

</style>
</head>
<body>

<div class="header">
    <h2>Attendance Dashboard</h2>

    <a href="adminDashboard.jsp"
       class="back-btn">
       Back To Dashboard
    </a>
</div>

<!-- Attendance Marking Section -->

<div class="card">

<form action="SaveAttendanceServlet"
      method="post">

<table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Department</th>
    <th>Present</th>
    <th>Absent</th>
</tr>

<%

List<Employee> employees =
(List<Employee>)request.getAttribute(
"employees");

if(employees != null &&
   !employees.isEmpty()){

for(Employee emp : employees){
%>

<tr>

<td>
    <%= emp.getId() %>
</td>

<td>
    <%= emp.getName() %>
</td>

<td>
    <%= emp.getDepartment() %>
</td>

<td>

<input type="radio"
       name="status_<%= emp.getId() %>"
       value="Present">

</td>

<td>

<input type="radio"
       name="status_<%= emp.getId() %>"
       value="Absent">

</td>

</tr>

<%
}

}else{
%>

<tr>
<td colspan="5">
No Employee Records Found
</td>
</tr>

<%
}
%>

</table>

<br>

<button type="submit"
        class="btn">
        Save Attendance
</button>

</form>

</div>

<!-- Attendance Records Section -->

<div class="card">

<h2>Attendance Records</h2>

<input type="text"
       id="searchInput"
       class="search"
       placeholder="Search Employee">

<table id="attendanceTable">

<tr>
    <th>Employee ID</th>
    <th>Name</th>
    <th>Date</th>
    <th>Status</th>
</tr>

<%

ResultSet rs =
(ResultSet)request.getAttribute(
"attendanceData");

if(rs != null){

while(rs.next()){
%>

<tr>

<td>
    <%= rs.getInt("employee_id") %>
</td>

<td>
    <%= rs.getString("name") %>
</td>

<td>
    <%= rs.getDate("attendance_date") %>
</td>

<td>

<%

String status =
rs.getString("status");

if("Present".equalsIgnoreCase(status)){
%>

<span class="present">
✓ Present
</span>

<%
}else{
%>

<span class="absent">
✗ Absent
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

</table>

</div>

<script>

document.getElementById("searchInput")
.addEventListener("keyup",function(){

let filter =
this.value.toLowerCase();

let rows =
document.querySelectorAll(
"#attendanceTable tr");

rows.forEach((row,index)=>{

if(index===0) return;

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
