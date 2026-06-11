<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>EMS - Registration</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#4facfe,#00f2fe);
}

.container{
    width:420px;
    background:white;
    padding:35px;
    border-radius:15px;
    box-shadow:0 8px 25px rgba(0,0,0,0.2);
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#333;
}

.form-group{
    margin-bottom:15px;
}

label{
    display:block;
    margin-bottom:6px;
    font-weight:bold;
    color:#444;
}

input,select{
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:6px;
    font-size:15px;
}

input:focus,
select:focus{
    border-color:#4facfe;
    outline:none;
}

.btn{
    width:100%;
    padding:12px;
    background:#28a745;
    color:white;
    border:none;
    border-radius:6px;
    font-size:16px;
    cursor:pointer;
}

.btn:hover{
    background:#218838;
}

.login-link{
    text-align:center;
    margin-top:15px;
}

.login-link a{
    text-decoration:none;
    color:#007bff;
    font-weight:bold;
}

.login-link a:hover{
    text-decoration:underline;
}

</style>

<script>

function validateForm(){

    let name = document.getElementById("name").value;
    let email = document.getElementById("email").value;
    let password = document.getElementById("password").value;

    if(name.length < 3){
        alert("Name must contain at least 3 characters");
        return false;
    }

    if(password.length < 6){
        alert("Password must contain at least 6 characters");
        return false;
    }

    return true;
}

</script>

</head>

<body>

<div class="container">


<h2>👨‍💼 Employee Registration</h2>

<form action="register" method="post" onsubmit="return validateForm()">

    <div class="form-group">
        <label>Full Name</label>
        <input type="text"
               id="name"
               name="name"
               placeholder="Enter Full Name"
               required>
    </div>

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

    <div class="form-group">
        <label>Select Role</label>

        <select name="role">
            <option value="employee">Employee</option>
            <option value="admin">Admin</option>
        </select>

    </div>

    <button type="submit" class="btn">
        Register
    </button>

</form>

<div class="login-link">
    Already have an account?
    <a href="index.jsp">Login Here</a>
</div>


</div>

</body>
</html>
