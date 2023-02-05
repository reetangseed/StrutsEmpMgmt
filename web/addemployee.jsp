
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.exavalu.services.RoleService"%>
<%@page import="com.exavalu.services.DepartmentService"%>
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
    <title>Add Employee</title>
    
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

    

    

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/menu.css" rel="stylesheet">
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
  <style>
  .required{
    content:" *";
    color: red;
  }
</style>
  <body class="text-center">
      <jsp:include page="menu.jsp"></jsp:include>
    
<main class="form-signin w-100 m-auto">
    
  <form action="AddEmployee" method="Post">
    <img class="mb-4" src="images/exavalu_logo.png" alt="exavalu logo" width="150" height="57">
    
  <c:set var="error" value="${ErrorMsg}"/>
  
  <c:if test='${error != null}'>
      <div class="alert alert-danger" role="alert">
          <Strong>Data Entry Failed !! </strong> Please try again. 
      </div>
  </c:if>
    
    <h1 class="h4 mb-3 fw-normal">Add Employee Data</h1>

<!--    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Employee ID" name="employeeId" value= readonly>
      <label for="floatingInput">Employee ID</label>
    </div>    -->
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="First Name" name="firstName" required maxlength="45">
      <label for="floatingInput">First Name<span class="required">*</span></label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Last Name" name="lastName" required maxlength="45">
      <label for="floatingInput">Last Name<span class="required">*</span></label>
    </div>
    
    <div class="form-floating">
      <input type="tel" class="form-control" id="floatingInput" placeholder="Phone Number" name="phone" required maxlength="13" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">
      <label for="floatingInput">Phone Number<span class="required">*</span></label>
    </div>
    
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Address" name="address" required maxlength="45">
      <label for="floatingInput">Address<span class="required">*</span></label>
    </div>
        
<!--    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="gender" name="gender" required maxlength="10">
      <label for="floatingInput">Gender</label>
    </div>-->
    

    
    <div class="form-floating">
        <input type="number" class="form-control" id="floatingInput" placeholder="age" name="age" min="15" max="100" required>
      <label for="floatingInput">Age<span class="required">*</span></label>
    </div>
        
    <div class="form-floating">
      <input type="number" class="form-control" id="floatingInput" placeholder="basic salary" name="basicSalary" required>
      <label for="floatingInput">Basic Salary<span class="required">*</span></label>
    </div>
    
    <div class="form-floating">
      <input type="number" class="form-control" id="floatingInput" placeholder="Car Allowance" name="carAllowance" required>
      <label for="floatingInput">Car Allowance<span class="required">*</span></label>
    </div>
       
    <div class="form-floating">

    <select id="gender" name="gender" class="form-select" required>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
    </select>
    <label for="floatingInput">Gender<span class="required">*</span></label>
    </div>
 
      <div class="form-floating">
          
          <c:set var="deptList" value='${DepartmentService.getAllDepartments()}'/>
              <c:set var="dept" value='${Department}'/>
                        
          <select name="departmentId" class="form-select" id="departmentId" required>
              <option value="0">Select a Department</option>
              <c:forEach items="${deptList}" var="dept">
                  <option value=${dept.getDepartmentId()}> ${dept.getDepartmentName()}  </option>
              
              </c:forEach>
              
          </select>
          <label for="floatingInput">Department<span class="required">*</span></label>
      </div>
          
      <div class="form-floating">
          <c:set var="roleList" value='${RoleService.getAllRoles()}'/>
          <c:set var="role" value='${Role}'/>
          
                        <select name="roleId" class="form-select" id="roleId" required>
              <option value="0">Select a Role</option>
              <c:forEach items="${roleList}" var="role">
              <option value=${role.getRoleId()}> ${role.getRoleName()} </option>
              </c:forEach>
          </select>
          <label for="floatingInput">Role<span class="required">*</span></label>
      </div>
     
    
   
    
  
    <button class="w-100 btn btn-lg btn-primary" style="background-color: #8B0000; border: none" type="submit">Save</button>
    
  </form>
</main>


    
  </body>
</html>
