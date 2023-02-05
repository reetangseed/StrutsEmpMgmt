<%-- 
    Document   : searchEmployee
    Created on : 02-Feb-2023, 9:39:13 pm
    Author     : Preyangsee
--%>
<%@page import="com.exavalu.services.RoleService"%>
<%@page import="com.exavalu.services.DepartmentService"%>
<%@page import="com.exavalu.models.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.models.Employee"%>
<%@page import="com.exavalu.models.Role"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test='${user == null}'>
    <c:redirect url="login.jsp"/>
</c:if>
<!doctype html>
<html lang="en">
<head>        
<title>Search Employee</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product/">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/menu_css.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/product.css" rel="stylesheet">
</head>
<body style="background-color: #f5f5f5">


 

    <jsp:include page="menu.jsp"></jsp:include>

    <form action="SearchEmployee" method="Post">
        <img class="mb-4" src="images/exavalu_logo.png" alt="exavalu logo" style="display: block; margin-left: auto; margin-right: auto" width="150" height="57">
        <br>
    <table class = "table table-bordered">
        <thead style="background-color: #D3D3D3">
        <tr style = "color:black">
        
        <th scope = "col">
            First Name
        </th>
        <th scope = "col">
            Last Name
        </th>
        
        <th scope = "col">
            Gender
        </th>
        
        <th scope = "col">
            Department
        </th>
        <th scope = "col">
            Role
        </th>
        

    </tr>
        <thead>
    
        <tbody>
    <tr>
        <td>
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInput" placeholder="Enter first name" name="firstName">
                <label for="floatingInput">Enter First Name</label>
            </div>
        </td>
        <td>
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInput" placeholder="Last Name" name="lastName">
                <label for="floatingInput">Enter Last Name</label>
            </div>
        </td>
        <td>
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInput" placeholder="gender" name="gender">
                <label for="floatingInput">Enter Gender</label>
            </div>
        </td>
        <td>
            <div class="form-floating">

                <c:set var="deptList" value='${DepartmentService.getAllDepartments()}'/>
              <c:set var="dept" value='${Department}'/>

                <select name="departmentId" class="form-select" id="departmentId">
                    <option value="%">Select a Department</option>
                    <c:forEach items='${deptList}' var="dept">
                  <option value=${dept.getDepartmentId()}> ${dept.getDepartmentName()}  </option>
              
              </c:forEach>
                </select>
            </div>
        </td>
        <td>
            <div class="form-floating">
                
                <c:set var="roleList" value='${RoleService.getAllRoles()}'/>
                <c:set var="role" value='${Role}'/>
                <select name="roleId" class="form-select" id="roleId">
                    <option value="%">Select a Role</option>
                    <c:forEach items='${roleList}' var="role">
                  <option value=${role.getRoleId()}> ${role.getRoleName()}  </option>
              </c:forEach>
                </select>
            </div>
        </td>
        
        
    </tr>
    
        </tbody>

    



</table>
                <div>
    <button class="w-100 btn btn-sm btn-primary" style="background-color: #8B0000; border: none" type="submit">Search in Database</button>
                </div>
    </form>
              
<!--<a href="SearchEmployeesDB" style="background-color: #8B0000; color: white;padding: 10px 180px;text-align: center;text-decoration: none; margin-left: 60%; border-radius: 15px;">Search</a>-->


</body>

</html>
