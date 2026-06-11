
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tka.model.Employee" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee List</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    background:#f4f7fc;
    font-family:'Segoe UI',sans-serif;
}

.header{
    background:linear-gradient(135deg,#0f172a,#1e293b);
    color:white;
    padding:25px;
    text-align:center;
    box-shadow:0 4px 15px rgba(0,0,0,0.15);
}

.header h1{
    font-weight:700;
    margin:0;
}

.employee-card{
    background:white;
    border-radius:15px;
    padding:25px;
    margin-top:30px;
    box-shadow:0 5px 20px rgba(0,0,0,0.08);
}

.table thead{
    background:#1e293b;
    color:white;
}

.table tbody tr:hover{
    background:#eef4ff;
    transition:0.3s;
}

.salary{
    font-weight:600;
    color:#198754;
}

.top-actions{
    display:flex;
    justify-content:space-between;
    align-items:center;
    flex-wrap:wrap;
    gap:15px;
    margin-bottom:20px;
}

.search-box{
    max-width:350px;
}

.count-box{
    background:#0d6efd;
    color:white;
    padding:10px 18px;
    border-radius:10px;
    font-weight:600;
}

.back-btn{
    border-radius:10px;
    padding:10px 18px;
}

.table-responsive{
    border-radius:10px;
}

.footer{
    text-align:center;
    padding:20px;
    color:#666;
    margin-top:30px;
}

@media(max-width:768px){

    .top-actions{
        flex-direction:column;
        align-items:stretch;
    }

    .search-box{
        max-width:100%;
    }

    .header h1{
        font-size:28px;
    }
}

@media(max-width:576px){

    .employee-card{
        padding:15px;
    }

    .header{
        padding:18px;
    }

    .header h1{
        font-size:24px;
    }

    .table{
        font-size:14px;
    }
}

</style>

</head>
<body>

<div class="header">
    <h1>
        <i class="fas fa-users"></i>
        Employee Management System
    </h1>
</div>

<div class="container">

    <div class="employee-card">

        <div class="top-actions">

            <a href="DashboardServlet" class="btn btn-secondary">
    Back To Dashboard
</a>

            <div class="count-box">
                Total Employees :
                <%= ((List<Employee>)request.getAttribute("employees")) != null ?
                ((List<Employee>)request.getAttribute("employees")).size() : 0 %>
            </div>

        </div>

        <div class="mb-3 search-box">
            <input type="text"
                   id="searchInput"
                   class="form-control"
                   placeholder="🔍 Search Employee...">
        </div>

        <div class="table-responsive">

            <table class="table table-bordered table-hover align-middle"
                   id="employeeTable">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Salary</th>
                    </tr>
                </thead>

                <tbody>

                <%
                List<Employee> employees =
                        (List<Employee>) request.getAttribute("employees");

                if(employees != null && !employees.isEmpty()){

                    for(Employee emp : employees){
                %>

                    <tr>
                        <td><%= emp.getId() %></td>
                        <td><%= emp.getName() %></td>
                        <td><%= emp.getEmail() %></td>
                        <td><%= emp.getDepartment() %></td>
                        <td class="salary">
                            ₹ <%= emp.getSalary() %>
                        </td>
                    </tr>

                <%
                    }
                }else{
                %>

                    <tr>
                        <td colspan="5" class="text-center text-danger">
                            No Employee Records Found
                        </td>
                    </tr>

                <%
                }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>

<div class="footer">
    © 2026 Employee Management System
</div>

<script>

document.getElementById("searchInput")
.addEventListener("keyup", function(){

    let filter = this.value.toLowerCase();

    let rows =
        document.querySelectorAll("#employeeTable tbody tr");

    rows.forEach(function(row){

        let text =
            row.textContent.toLowerCase();

        row.style.display =
            text.includes(filter) ? "" : "none";
    });
});

</script>

</body>
</html>

