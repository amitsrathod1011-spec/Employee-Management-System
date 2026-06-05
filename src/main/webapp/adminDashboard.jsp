<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

			<li><a href="adminDashboard.jsp">📊 Dashboard</a></li>

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
				<p>${totalDepartments}</p>
			</div>

			<div class="card">
				<h3>Present Today</h3>
				<p>${presentEmployees}</p>
			</div>

			<div class="card">
				<h3>Pending Leaves</h3>
				<p>${pendingLeaves}</p>
			</div>

		</div>

		<div class="search-box">

			<input type="text" placeholder="🔍 Search Employee"> <select>
				<option>All Departments</option>
				<option>IT</option>
				<option>HR</option>
				<option>Finance</option>
				<option>Marketing</option>
			</select>

		</div>

		<div class="table-container">

			<table>

				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Department</th>
					<th>Action</th>
				</tr>

				<!-- Dynamic Employee Records -->

				<tr>
					<td>John</td>
					<td>john@gmail.com</td>
					<td>IT</td>

					<td>
						<button class="viewEmployees.jsp">Edit</button>

						<button class="action-btn delete">Delete</button>
					</td>

				</tr>

			</table>

		</div>


	</div>

</body>
</html>
