<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.104.2">
        <title>Sign in - Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <meta name="theme-color" content="#712cf9">


        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

    </head>
    
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>

    <script>
        
        function submitForm(){
            //var countryCode = document.getElementById("countryCode").value;
            signupForm.setAttribute("action", "PreSignUp");
            signupForm.submit();
        }
        function fetchContent(selectedId, targetId)
                {
                        
                        $.ajax({
                                 url: 'PreSignUp',
                                 data: {
                                        [selectedId]: $("#" + selectedId).val()
                                  },
                                 success: function (responseText) {
//                        alert(responseText);
                                        $("#" + targetId).html(responseText);
                                 }
                              });
                        
                    
                    
        }
    </script>

    <body class="text-center">


        <main class="form-signin w-100 m-auto">
            
            <form action="SignUp" id="signupForm" method="post">
            
                <img class="mb-4" src="images/exavalu_logo.png" alt="exavalu logo" width="150" height="57">
                <h1 class="h3 mb-3 fw-normal">Create Account</h1>

                <div class="form-floating">
                    <input type="email" class="form-control" id="floatingInput" name="emailAddress" placeholder="name@example.com" <c:if test='${user.getEmailAddress()!=null}'> value ="${user.getEmailAddress()}" </c:if>>
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password" <c:if test='${user.getPassword()!=null}'> value ="${user.getPassword()}" </c:if>>
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="firstName" class="form-control" id="firstName" placeholder="first name" <c:if test='${user.getFirstName()!=null}'> value ="${user.getFirstName()}" </c:if>>
                    <label for="firstName">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="lastName" class="form-control" id="lastName" placeholder="last name" <c:if test='${user.getLastName()!=null}'> value ="${user.getLastName()}" </c:if>>
                    <label for="firstName">Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="addressLine1" class="form-control" id="addressLine1" placeholder="Address Line 1" <c:if test='${user.getAddressLine1()!=null}'> value ="${user.getAddressLine1()}" </c:if>>
                    <label for="addressLine1">Address Line 1</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="addressLine2" class="form-control" id="addressLine2" placeholder="Address Line 2" <c:if test='${user.getAddressLine2()!=null}'> value ="${user.getAddressLine2()}" </c:if>>
                    <label for="addressLine2">Address Line 2</label>
                </div>
                <div class="form-floating">
                    <select name="countryCode" class="form-select" id="countryCode" onchange="fetchContent('countryCode','stateCode')">
                        <option value="">Select a Country</option>
                        <c:forEach items="${countryList}" var="country">
                            <option value=${country.getCountryCode()}  <c:if test="${country.getCountryCode().equalsIgnoreCase(user.getCountryCode())}"> selected </c:if>> ${country.getCountryName()}  </option>

                        </c:forEach>
                    </select>
                    <label for="floatingInput">Select Country</label>
                </div>
                <div class="form-floating">
                    <select name="stateCode" class="form-select" id="stateCode" onchange="fetchContent('stateCode','districtCode')">
                        <option value="">Select a Province</option>
                    </select>
                    <label for="floatingInput">Select State</label>
             
                </div>
                <div class="form-floating">
                    <select name="districtCode" class="form-select" id="districtCode">
                        <option value="">Select a District</option>
                        
                    </select>
                    <label for="floatingInput">Select District</label>
             
                </div>

<!--                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>-->
                
                <button class="w-100 btn mt-2 btn-sm btn-primary" style="background-color: #8B0000; border: none" type="submit">Sign up</button>
                
                <a href="landingPage.jsp">
                    <button type="button" class = "w-100 btn mt-2 btn-sm btn-primary" style="background-color: #8B0000" type="submit">Cancel</button>
                </a>
                <p class="mt-5 mb-3 text-muted">&copy; 2023?2024</p>
            </form>
        </main>



    </body>
</html>
