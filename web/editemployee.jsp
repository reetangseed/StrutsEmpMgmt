
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.exavalu.models.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.models.Employee"%>
<%@page import="com.exavalu.models.Role"%>
<c:if test='${user == null}'>
    <c:redirect url="login.jsp"/>
</c:if>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.108.0">
    <title>Edit Employee</title>
    
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

    

    

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/menu_css.css" rel="stylesheet">
<link href="css/product.css" rel="stylesheet">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


    

    
    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
      <jsp:include page="menu.jsp"></jsp:include>
    
<main class="form-signin w-100 m-auto">
    
<c:set var="emp" value="${Emp}"/>
  <form action="SaveEmployee" method="Post">
    <img class="mb-4" src="images/exavalu_logo.png" alt="exavalu logo" width="150" height="57">
    <h1 class="h4 mb-3 fw-normal">Edit Employee Data</h1>

    <div class="form-floating">
        <input type="text" class="form-control" id="floatingInput" placeholder="Employee ID" name="employeeId" readonly value="${emp.employeeId}">
        
      <label for="floatingInput">Employee ID</label>
    </div>    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="First Name" name="firstName" value ="${emp.getFirstName()}">
      <label for="floatingInput">First Name</label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Last Name" name="lastName" value="${emp.getLastName()}">
      <label for="floatingInput">Last Name</label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Phone Number" name="phone" value=${emp.getPhone()}>
      <label for="floatingInput">Phone Number</label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Address" name="address" value=${emp.getAddress()}>
      <label for="floatingInput">Address</label>
    </div>
        
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="gender" name="gender" value=${emp.getGender()}>
      <label for="floatingInput">Gender</label>
    </div>
    
    <div class="form-floating">
        <input type="text" class="form-control" id="floatingInput" placeholder="age" name="age" value=${emp.getAge()}>
      <label for="floatingInput">Age</label>
    </div>
        
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="basic salary" name="basicSalary" value=${emp.getBasicSalary()}>
      <label for="floatingInput">Salary</label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Car Allowance" name="carAllowance" value=${emp.getCarAllowance()}>
      <label for="floatingInput">Car Allowance</label>
    </div>
       
 
      <div class="form-floating">
          
          
                        
          <select name="departmentId" class="form-select" id="departmentId">
              <option value="0">Select a Department</option>
              <c:forEach items="${DeptList}" var="dept">
                  <option value=${dept.getDepartmentId()} <c:if test="${dept.getDepartmentName().equalsIgnoreCase(emp.getDepartmentName())}"> selected </c:if>> ${dept.getDepartmentName()}  </option>
              
              </c:forEach>
          </select>
          <label for="floatingInput">Department</label>
      </div>
          
      <div class="form-floating">
          
          <select name="roleId" class="form-select" id="roleId">
              <option value="0">Select a Role</option>
              <c:forEach items="${roleList}" var="role">
                  <option value=${role.getRoleId()} <c:if test="${role.getRoleName().equalsIgnoreCase(emp.getRoleName())}"> selected </c:if>> ${role.getRoleName()}  </option>
              </c:forEach>
          </select>
          <label for="floatingInput">Role</label>
      </div>
     
    
   
    
  
    <button class="w-100 btn btn-lg btn-primary" style="background-color: #8B0000; border: none" type="submit">Save</button>
    
  </form>
</main>


    
  </body>
</html>
