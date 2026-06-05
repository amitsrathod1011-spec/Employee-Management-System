<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Employee Dashboard</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	background: #f4f6f9;
}

.container {
	display: flex;
}

.sidebar {
	width: 250px;
	height: 100vh;
	background: #071330;
	color: white;
	padding: 20px;
	position: fixed;
}

.sidebar h2 {
	text-align: center;
	margin-bottom: 30px;
}

.sidebar ul {
	list-style: none;
}

.sidebar ul li {
	margin: 20px 0;
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
	margin-left: 250px;
	width: 100%;
	padding: 25px;
}

.header {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, .1);
}

.cards {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
	margin-top: 25px;
}

.card {
	background: white;
	flex: 1 1 250px;
	min-width: 220px;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, .1);
	transition: .3s;
}

.card:hover {
	transform: translateY(-5px);
}

.card h3 {
	color: #555;
}

.card p {
	margin-top: 10px;
	font-size: 24px;
	color: #4f46e5;
	font-weight: bold;
}

.profile {
	margin-top: 25px;
	background: white;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, .1);
}

.profile table {
	width: 100%;
}

.profile td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

@media ( max-width :768px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.main {
		margin-left: 0;
	}
	.cards {
		flex-direction: column;
	}
	.card {
		width: 100%;
	}
	.profile {
		overflow-x: auto;
	}
}

.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background: #4f46e5;
	color: white;
	cursor: pointer;
}

.btn:hover {
	background: #372fc7;
}

.btn-green {
	background: #16a34a;
	margin-left: 10px;
}

.btn-green:hover {
	background: #15803d;
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

	<div class="container">


		<div class="sidebar">

			<h2>👨‍💼 EMS</h2>

			<h3>👋 ${employeeName}</h3>

			<ul>

				<li><a href="employeeDashboard.jsp"> 🏠 Dashboard </a></li>

				<li><a href="profile.jsp"> 👤 My Profile </a></li>

				<li><a href="attendance.jsp"> 🕒 Attendance </a></li>

				<li><a href="salary.jsp"> 💰 Salary </a></li>

				<li><a href="applyLeave.jsp"> 📝 Apply Leave </a></li>

				<li><a href="LeavePageServlet"> 📋 My Leave History </a></li>

				<li><a href="SettingsServlet"> ⚙ Settings </a></li>

				<li><a class="logout" href="logout"> 🚪 Logout </a></li>

			</ul>

		</div>

		<div class="main">

			<div class="header">

				<h1>Employee Dashboard</h1>

				<p>Welcome ${employeeName}</p>

			</div>

			<div class="cards">

				<div class="card">
					<h3>Attendance</h3>
					<p>${attendancePercentage}%</p>
				</div>

				<div class="card">
					<h3>Salary</h3>
					<p>₹${salary}</p>
				</div>

				<div class="card">
					<h3>Leaves Left</h3>
					<p>${remainingLeaves}</p>
				</div>

				<div class="card">
					<h3>Department</h3>
					<p>${department}</p>
				</div>

				<div class="card">
					<h3>My Leaves</h3>
					<p>
						<a href="LeavePageServlet"
							style="text-decoration: none; color: #4f46e5;"> View </a>
					</p>
				</div>

			</div>

			<div class="profile">

				<h2>Employee Information</h2>

				<br>

				<table>

					<tr>
						<td><b>Employee ID</b></td>
						<td>${employeeId}</td>
					</tr>

					<tr>
						<td><b>Name</b></td>
						<td>${employeeName}</td>
					</tr>

					<tr>
						<td><b>Email</b></td>
						<td>${email}</td>
					</tr>

					<tr>
						<td><b>Department</b></td>
						<td>${department}</td>
					</tr>

					<tr>
						<td><b>Role</b></td>
						<td>${role}</td>
					</tr>

				</table>

				<br> <a href="applyLeave.jsp">
					<button class="btn">Apply Leave</button>
				</a> <a href="LeavePageServlet">
					<button class="btn btn-green">My Leaves</button>
				</a>

			</div>

		</div>


	</div>

</body>
</html>
