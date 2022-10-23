<%-- 
    Document   : login.jsp
    Created on : Jun 4, 2022, 12:40:01 PM
    Author     : MinhQuang
--%>

<%@page import="minhquang.model.user.UserError"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>Login TBTS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="assets/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->

        <link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assets/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assets/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="assets/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assets/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assets/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="assets/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="assets/css/util.css">
        <link rel="stylesheet" type="text/css" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/styleLogin.css">
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <link rel="icon" href="assets/images/Logo.png" type="image/icon type">
        <!--===============================================================================================-->
    </head>
    <body>


        <div class="limiter">
            <div class="container-login100" style="background-image: url('assets/images/milkteaShopbackground.jpg');">
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="MainController" method="POST">
                        <span class="login100-form-logo">
                            <img src="assets/images/Logo.png" alt="" class = 'logo'>
                        </span>

                        <span class="login100-form-title p-b-34 p-t-27">
                            Log in
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Enter username">
                            <input class="input100" type="text" name="username" placeholder="Username">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                           <span style="color:blue; font-weight: bolder;"> ${requestScope.USER_ERROR.username}</span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <input class="input100" type="password" name="password" placeholder="Password">
                            <span class="focus-input100" data-placeholder="&#xf191;"></span>
                            <span style="color:blue; font-weight: bolder;">${requestScope.USER_ERROR.password} </span>
                        </div>

                        <div class="contact100-form-checkbox">
                            <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                            <label class="label-checkbox100" for="ckb1">
                                Remember me
                            </label>
                        </div>

                        <div class="container-login100-form-btn">
                            <input class="login100-form-btn" type="submit" name="action" value='LOGIN'>
                        </div>
                        
                        <div class="container-login100-form-btn" style="margin-top: 10px;">
                            <button class="">
                                <a class ="login100-form-btn" href="register2.jsp" style="text-decoration: none;">Register</a>
                            </button>
                        </div>

                        <div class="container-login100-form-btn" style="margin-top: 10px;">
                            <button class="">

                                <a class ="btnGoogle login100-form-btn" href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/MilkTeaManagement/login&response_type=code
                                   &client_id=275645487476-im6rnst8gkq7d0usickn97kokak6jiun.apps.googleusercontent.com&approval_prompt=force" style="text-decoration: none;">
                                    <i class="fa fa-google-plus" aria-hidden="true"></i>
                                       Login With Google</a>
                            </button>
                            <br>
                            <span style="color:blue; font-weight: bolder;">${requestScope.USER_ERROR.recaptcha}</span>
                        </div>
                        
                       
                        
                        <div class="g-recaptcha"
                             
                             data-sitekey="6LcZhHAgAAAAAAga0brXsqp6ZjiD9i8933hgofQ4" style="margin-top: 10px; margin-left: 45px;">
                           
                                 
                        </div>
                         

                    </form>


                </div>
            </div>
        </div>


        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>


    </body>
</html>
