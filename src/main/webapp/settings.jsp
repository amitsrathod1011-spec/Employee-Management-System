
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<%
ResultSet userData =
(ResultSet)request.getAttribute("userData");

String name = "";
String email = "";
String role = "";
String mobile = "";
String department = "";

if(userData != null && userData.next()){

    name = userData.getString("name");
    email = userData.getString("email");
    role = userData.getString("role");
    mobile = userData.getString("mobile");
    department = userData.getString("department");

    if(mobile == null){
        mobile = "";
    }

    if(department == null){
        department = "";
    }
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Settings</title>

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
box-shadow:0 4px 15px rgba(0,0,0,.08);
}

.card-header{
background:#2c3e50;
color:white;
font-size:22px;
font-weight:600;
}

.form-control{
height:50px;
}

.btn-save{
background:#27ae60;
color:white;
}

.btn-save:hover{
background:#229954;
color:white;
}

.btn-password{
background:#3498db;
color:white;
}

.btn-password:hover{
background:#2980b9;
color:white;
}

</style>

</head>

<%
String msg=request.getParameter("msg");
%>

<body>

<%
if("profileUpdated".equals(msg)){
%>

<div class="alert alert-success text-center">
Profile Updated Successfully
</div>

<%
}

if("passwordChanged".equals(msg)){
%>

<div class="alert alert-success text-center">
Password Changed Successfully
</div>

<%
}
%>

<div class="container mt-5">

<h2 class="mb-4">
<i class="fa-solid fa-gear"></i>
Settings
</h2>

<div class="row">

<div class="col-lg-6 mb-4">

<div class="card">

<div class="card-header">
Profile Information
</div>

<div class="card-body">

<p><b>Name :</b> <%=name%></p>

<p><b>Email :</b> <%=email%></p>

<p><b>Mobile :</b> <%=mobile%></p>

<p><b>Department :</b> <%=department%></p>

<p><b>Role :</b> <%=role%></p>

</div>

</div>

</div>

<div class="col-lg-6 mb-4">

<div class="card">

<div class="card-header">
Update Profile
</div>

<div class="card-body">

<form action="UpdateProfileServlet"
method="post">

<div class="mb-3">

<label>Name</label>

<input type="text"
class="form-control"
name="name"
value="<%=name%>"
required>

</div>

<div class="mb-3">

<label>Email</label>

<input type="email"
class="form-control"
name="email"
value="<%=email%>"
required>

</div>

<div class="mb-3">

<label>Mobile</label>

<input type="text"
class="form-control"
name="mobile"
value="<%=mobile%>">

</div>

<div class="mb-3">

<label>Department</label>

<input type="text"
class="form-control"
name="department"
value="<%=department%>"
required>

</div>

<button type="submit"
class="btn btn-save">

Update Profile

</button>

</form>

</div>

</div>

</div>

<div class="col-lg-12">

<div class="card">

<div class="card-header">

Change Password

</div>

<div class="card-body">

<form action="ChangePasswordServlet"
method="post">

<div class="row">

<div class="col-md-4">

<label>Current Password</label>

<input type="password"
class="form-control"
name="currentPassword"
required>

</div>

<div class="col-md-4">

<label>New Password</label>

<input type="password"
class="form-control"
name="newPassword"
required>

</div>

<div class="col-md-4">

<label>Confirm Password</label>

<input type="password"
class="form-control"
name="confirmPassword"
required>

</div>

</div>

<br>

<button type="submit"
class="btn btn-password">

Change Password

</button>

</form>

</div>

</div>

</div>

</div>

<br>

<a href="DashboardServlet"
class="btn btn-secondary">

Back To Dashboard

</a>

</div>

</body>

</html>
