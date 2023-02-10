
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <title>Sign in - Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/signin_2.css" rel="stylesheet">
<!--        <link href="css/menu_css.css" rel="stylesheet">-->
        
    </head>
<%@taglib prefix="s" uri="/struts-tags"%> 
    <body class="text-center">


        <main class="form-signin w-100 m-auto">
            <form action="Login" method="post">
                <img class="mb-4" src="images/exavalu_logo.png" alt="" width="350" height="200">
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
                
<!--                <h3 class="alert-danger">
                    
                </h3>-->

<c:if test='${ErrorMsg}'> ${ErrorMsg}</c:if>

                <div class="form-floating">
                    <input name="email" type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" style="background-color: #8B0000; border: none" type="submit">Sign in</button>
                            
                <a href="PreSignUp" class = "w-36 p-3" style="color: #8B0000" type="submit"> New Account? Sign Up </a>
                </form>
                <p class="mt-5 mb-3 text-muted">&copy; 2017?2022</p>

        </main>



    </body>
</html>
