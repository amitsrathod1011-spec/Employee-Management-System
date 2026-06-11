
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Employee</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#1e3c72,#2a5298);
    padding:20px;
}

.container{
    width:100%;
    max-width:550px;
}

.card{
    background:#fff;
    padding:35px;
    border-radius:20px;
    box-shadow:0 15px 40px rgba(0,0,0,0.25);
}

.logo{
    text-align:center;
    margin-bottom:20px;
}

.logo i{
    font-size:50px;
    color:#2a5298;
}

.logo h2{
    margin-top:10px;
    color:#333;
}

.form-group{
    margin-bottom:18px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    font-weight:600;
    color:#444;
}

.input-box{
    position:relative;
}

.input-box i{
    position:absolute;
    left:15px;
    top:50%;
    transform:translateY(-50%);
    color:#777;
}

.input-box input{
    width:100%;
    padding:14px 14px 14px 45px;
    border:1px solid #ddd;
    border-radius:10px;
    outline:none;
    transition:0.3s;
    font-size:15px;
}

.input-box input:focus{
    border-color:#2a5298;
    box-shadow:0 0 8px rgba(42,82,152,0.3);
}

.btn{
    width:100%;
    padding:15px;
    border:none;
    border-radius:10px;
    background:#2a5298;
    color:white;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    background:#1e3c72;
    transform:translateY(-2px);
}

.back-btn{
    display:inline-block;
    margin-top:15px;
    text-decoration:none;
    color:#2a5298;
    font-weight:600;
}

.back-btn:hover{
    text-decoration:underline;
}

.footer{
    text-align:center;
    margin-top:15px;
    color:#777;
    font-size:14px;
}

/* Responsive */

@media(max-width:768px){

    .card{
        padding:25px;
    }

    .logo h2{
        font-size:24px;
    }
}

@media(max-width:480px){

    .card{
        padding:20px;
        border-radius:15px;
    }

    .logo i{
        font-size:40px;
    }

    .logo h2{
        font-size:22px;
    }

    .input-box input{
        padding:12px 12px 12px 42px;
        font-size:14px;
    }

    .btn{
        padding:13px;
        font-size:15px;
    }
}

</style>
</head>

<body>

<div class="container">

    <div class="card">

        <div class="logo">
            <i class="fa-solid fa-user-plus"></i>
            <h2>Add Employee</h2>
        </div>

        <form action="AddEmployeeServlet" method="post">

            <div class="form-group">
                <label>Employee Name</label>
                <div class="input-box">
                    <i class="fa-solid fa-user"></i>
                    <input type="text"
                           name="name"
                           placeholder="Enter Employee Name"
                           required>
                </div>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <div class="input-box">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="email"
                           name="email"
                           placeholder="Enter Email Address"
                           required>
                </div>
            </div>

            <div class="form-group">
                <label>Department</label>
                <div class="input-box">
                    <i class="fa-solid fa-building"></i>
                    <input type="text"
                           name="department"
                           placeholder="Enter Department"
                           required>
                </div>
            </div>

            <div class="form-group">
                <label>Salary</label>
                <div class="input-box">
                    <i class="fa-solid fa-indian-rupee-sign"></i>
                    <input type="number"
                           name="salary"
                           placeholder="Enter Salary"
                           required>
                </div>
            </div>

            <button type="submit" class="btn">
                <i class="fa-solid fa-floppy-disk"></i>
                Save Employee
            </button>

        </form>

        <a href="DashboardServlet" class="btn btn-secondary">
    Back to Dashboard
</a>

        <div class="footer">
            Employee Management System
        </div>

    </div>

</div>

<script>

document.querySelector("form").addEventListener("submit", function(e){

    let salary = document.querySelector("input[name='salary']").value;

    if(salary <= 0){
        alert("Salary must be greater than 0");
        e.preventDefault();
    }
});

</script>

</body>
</html>

