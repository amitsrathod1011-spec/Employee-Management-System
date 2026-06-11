<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>EMS Login</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: 'Segoe UI', sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#667eea,#764ba2);
}

.login-container{
    width:400px;
    background:#fff;
    padding:35px;
    border-radius:15px;
    box-shadow:0 8px 25px rgba(0,0,0,0.2);
}

.logo{
    text-align:center;
    font-size:50px;
    margin-bottom:10px;
}

h2{
    text-align:center;
    color:#333;
    margin-bottom:25px;
}

.form-group{
    margin-bottom:18px;
}

label{
    display:block;
    margin-bottom:6px;
    font-weight:bold;
    color:#444;
}

input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:6px;
    font-size:15px;
}

input:focus{
    border-color:#667eea;
    outline:none;
}

.btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:6px;
    background:#667eea;
    color:white;
    font-size:16px;
    cursor:pointer;
}

.btn:hover{
    background:#5a67d8;
}

.links{
    text-align:center;
    margin-top:15px;
}

.links a{
    text-decoration:none;
    color:#667eea;
    font-weight:bold;
}

.links a:hover{
    text-decoration:underline;
}

.footer{
    text-align:center;
    margin-top:20px;
    color:#777;
    font-size:13px;
}

</style>

<script>

function validateLogin(){

    let email = document.getElementById("email").value;
    let password = document.getElementById("password").value;

    if(email.trim() === ""){
        alert("Please enter Email");
        return false;
    }

    if(password.trim() === ""){
        alert("Please enter Password");
        return false;
    }

    return true;
}

</script>

</head>

<body>

<div class="login-container">


<div class="logo">🔐</div>

<h2>Employee Management System</h2>

<form action="login" method="post"
      onsubmit="return validateLogin()">

    <div class="form-group">
        <label>Email Address</label>
        <input type="email"
               id="email"
               name="email"
               placeholder="Enter Email"
               required>
    </div>

    <div class="form-group">
        <label>Password</label>
        <input type="password"
               id="password"
               name="password"
               placeholder="Enter Password"
               required>
    </div>

    <button type="submit" class="btn">
        Login
    </button>

</form>

<div class="links">
    New User?
    <a href="register.jsp">Register Here</a>
</div>

<div class="footer">
    © Employee Management System
</div>


</div>

</body>
</html>
