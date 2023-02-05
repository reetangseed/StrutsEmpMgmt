
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

    <body class="text-center">


        <main class="form-signin w-100 m-auto">
            <form action="SignUp" method="post">
                <img class="mb-4" src="images/exavalu_logo.png" alt="exavalu logo" width="150" height="57">
                <h1 class="h3 mb-3 fw-normal">Create Account</h1>

                <div class="form-floating">
                    <input type="email" class="form-control" id="floatingInput" name="emailAddress" placeholder="name@example.com">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="firstName" class="form-control" id="firstName" placeholder="first name">
                    <label for="firstName">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" name="lastName" class="form-control" id="lastName" placeholder="last name">
                    <label for="firstName">Last Name</label>
                </div>
                

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="w-100 btn mt-2 btn-sm btn-primary" style="background-color: #8B0000; border: none" type="submit">Sign up</button>
                <a href="landingPage.jsp">
                    <button type="button" class = "w-100 btn mt-2 btn-sm btn-primary" style="background-color: #8B0000" type="submit">Cancel</button>
                </a>
                <p class="mt-5 mb-3 text-muted">&copy; 2023?2024</p>
            </form>
        </main>



    </body>
</html>
