
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet"%>

<%
ResultSet rs =
(ResultSet)request.getAttribute("userData");

String id="";
String name="";
String email="";
String mobile="";
String department="";
String role="";

if(rs!=null && rs.next()){

    id=rs.getString("id");
    name=rs.getString("name");
    email=rs.getString("email");
    mobile=rs.getString("mobile");
    department=rs.getString("department");
    role=rs.getString("role");

    if(mobile==null)
        mobile="";

    if(department==null)
        department="";
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Profile</title>

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

box-shadow:0px 4px 12px rgba(0,0,0,.1);

}

.card-header{

background:#2c3e50;

color:white;

font-size:25px;

font-weight:bold;

}

.profile-img{

width:170px;

height:170px;

border-radius:50%;

border:5px solid #0d6efd;

object-fit:cover;

}

.table td{

padding:12px;

font-size:18px;

}

.table td:first-child{

font-weight:bold;

width:220px;

}

</style>

</head>

<body>

<div class="container mt-5">

<div class="card">

<div class="card-header">

<i class="fa-solid fa-user"></i>

My Profile

</div>

<div class="card-body">

<div class="row">

<div class="col-md-4 text-center">

<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
class="profile-img">

<h3 class="mt-3">

<%=name%>

</h3>

<p class="text-muted">

<%=role%>

</p>

</div>

<div class="col-md-8">

<table class="table table-bordered">

<tr>

<td>Employee ID</td>

<td><%=id%></td>

</tr>

<tr>

<td>Name</td>

<td><%=name%></td>

</tr>

<tr>

<td>Email</td>

<td><%=email%></td>

</tr>

<tr>

<td>Mobile</td>

<td><%=mobile%></td>

</tr>

<tr>

<td>Department</td>

<td><%=department%></td>

</tr>

<tr>

<td>Role</td>

<td><%=role%></td>

</tr>

</table>

<div class="mt-4">

<a href="SettingsServlet"
class="btn btn-success">

<i class="fa-solid fa-pen"></i>

Edit Profile

</a>

&nbsp;

<a href="DashboardServlet"
class="btn btn-secondary">

<i class="fa-solid fa-arrow-left"></i>

Back

</a>

</div>

</div>

</div>

</div>

</div>

</div>

</body>

</html>
