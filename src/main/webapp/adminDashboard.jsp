<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tka.model.Employee"%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>EMS - Admin Dashboard</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	background: #f4f6f9;
	display: flex;
}

.sidebar {
	width: 260px;
	height: 100vh;
	background: #071330;
	color: white;
	padding: 20px;
	position: fixed;
}

.sidebar h2 {
	margin: 20px 0;
	text-align: center;
}

.sidebar ul {
	list-style: none;
}

.sidebar ul li {
	margin: 18px 0;
}

.sidebar ul li a {
	color: white;
	text-decoration: none;
	font-size: 18px;
}

.sidebar ul li a:hover {
	color: #00d4ff;
}

.logout {
	color: red !important;
	font-weight: bold;
}

.main {
	margin-left: 260px;
	width: 100%;
	padding: 25px;
}

.header {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.header h1 {
	color: #333;
}

.cards {
	display: flex;
	gap: 20px;
	margin-top: 25px;
	flex-wrap: wrap;
}

.card {
	background: white;
	width: 220px;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.card h3 {
	color: #555;
}

.card p {
	margin-top: 10px;
	font-size: 30px;
	color: #4f46e5;
	font-weight: bold;
}

.search-box {
	margin-top: 25px;
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.search-box input, .search-box select {
	width: 100%;
	padding: 12px;
	margin-top: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.table-container {
	margin-top: 25px;
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
}

table th {
	background: #1f2937;
	color: white;
	padding: 12px;
}

table td {
	padding: 12px;
	border-bottom: 1px solid #ddd;
}

.action-btn {
	padding: 6px 12px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	color: white;
}

.edit {
	background: #28a745;
}

.delete {
	background: #dc3545;
}
</style>

<script>
	window.onload = function() {

		let msg = "${msg}";

		if (msg != "") {
			alert(msg);
		}

	}
</script>

</head>

<body>

	<div class="sidebar">


		<h2>🏢 EMS</h2>

		<h3>👋 ${adminName}</h3>
		<p>Admin</p>

		<ul>

			<li><a href="AdminDashboardServlet">📊 Dashboard</a></li>

			<li><a href="EmployeeServlet"> 👥 Employees</a></li>

			<li><a href="addEmployee.jsp"> ➕ Add Employee</a></li>

			<li><a href="AttendancePageServlet"> 🕒 Attendance</a></li>

			<li><a href="SalaryPageServlet"> 💰 Salary</a></li>

			<li><a href="AdminLeaveServlet"> 📝 Leave</a></li>

			<li><a href="SettingsServlet"> ⚙ Settings </a></li>

			<li><a href="logout"> 🚪 Logout</a></li>

		</ul>


	</div>

	<div class="main">


		<div class="header">

			<h1>Employee Management Dashboard</h1>

			<p>Welcome ${adminName}</p>

		</div>

		<div class="cards">

			<div class="card">
				<h3>Total Employees</h3>
				<p>${totalEmployees}</p>
			</div>
			<div class="card">
				<h3>Departments</h3>
				<p>${departmentCount}</p>
			</div>
			<div class="card">
				<h3>Present Today</h3>
				<p>${presentToday}</p>
			</div>
			<div class="card">
				<h3>Pending Leaves</h3>
				<p>${pendingLeaves}</p>
			</div>

		</div>

		
<div class="search-box">

<form action="AdminDashboardServlet" method="get">

    <input
        type="text"
        name="keyword"
        placeholder="🔍 Search Employee">

    <select name="department">

        <option value="">All Departments</option>

        <option value="IT">IT</option>

        <option value="HR">HR</option>

        <option value="Finance">Finance</option>

        <option value="Marketing">Marketing</option>

    </select>

    <br><br>

    <button
        type="submit"
        style="
        padding:10px 25px;
        background:#4f46e5;
        color:white;
        border:none;
        border-radius:5px;
        cursor:pointer;">

        Search

    </button>

</form>

</div>


	
<%
List<Employee> employeeList =
(List<Employee>)request.getAttribute("employeeList");

if(employeeList!=null){

for(Employee emp : employeeList){
%>

<tr>

    <td><%=emp.getName()%></td>

    <td><%=emp.getEmail()%></td>

    <td><%=emp.getDepartment()%></td>

    <td>

        <a href="EditEmployeeServlet?id=<%=emp.getId()%>">

            <button class="action-btn edit">
                Edit
            </button>

        </a>

        <a href="DeleteEmployeeServlet?id=<%=emp.getId()%>">

            <button class="action-btn delete">
                Delete
            </button>

        </a>

    </td>

</tr>

<%
}
}
%>



	</div>

</body>
</html>
