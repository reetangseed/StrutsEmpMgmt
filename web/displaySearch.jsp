<%-- 
    Document   : displaySearch
    Created on : 02-Feb-2023, 9:56:34 pm
    Author     : Preyangsee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>        
<title>Display Employees</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product/">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/menu_css.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/product.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
</head>

<body>
<main>
 

    <jsp:include page="menu.jsp"></jsp:include>
    <div class="form-group"> 	<!--		Show Numbers Of Rows 		-->
                    <h6 style="color:#8B0000; font-family: sans-serif"><b>SELECT NUMBER OF ROWS</b></h6>
                
                    <select class  ="form-control" name="state" id="maxRows" style="width:80px; height: 40px; display: inline-flex">
                        <option value="5000">Show ALL Rows</option>
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                        <option value="50">50</option>
                        <option value="70">70</option>
                        <option value="100">100</option>
                    </select>		 		
                </div>


    
    <table id="table-id" class = "table table-bordered">
        <thead style="background-color: #D3D3D3">
        <tr style = "color:black">
        <th scope = "col">
            Employee Id
        </th>
        <th scope = "col">
            First Name
        </th>
        <th scope = "col">
            Last Name
        </th>
        <th scope = "col">
            Address
        </th>
        <th scope = "col">
            Phone
        </th>
        <th scope = "col">
            Gender
        </th>
        <th scope = "col">
            Age
        </th>
        <th scope = "col">
            Department
        </th>
        <th scope = "col">
            Role
        </th>
        <th scope = "col">
            Basic Salary
        </th>
        <th scope = "col">
            Car Allowance
        </th>
        <th>Action</th>
        

    </tr>
        <thead>
    <c:forEach items="${EmpList}" var="emp"> 
        <tbody>
    <tr>
        <td>
            ${emp.employeeId}
        </td>
        <td>
            ${emp.firstName}
        </td>
        <td>
            ${emp.lastName}
        </td>
        <td>
            ${emp.address}
        </td>
        <td>
            ${emp.phone}
        </td>
        <td>
            ${emp.gender}
        </td>
        <td>
            ${emp.age}
        </td>
        <td>
            ${emp.departmentName}
        </td>
        <td>
            ${emp.roleName}
        </td>
        <td>
            ${emp.basicSalary}
        </td>
        <td>
            ${emp.carAllowance}
        </td>
        <td> <a style="color:#8B0000" href=EditEmployee?employeeId=${emp.getEmployeeId()}>Edit</a>                     
        </td>
        
    </tr>
    
        </tbody>

    </c:forEach>


</table>
<jsp:include page="pagination.jsp"></jsp:include>

<script src="tablepagination.js"></script>
</main>
</body>
</html>