<%-- 
    Document   : register
    Created on : Jun 13, 2022, 5:17:23 PM
    Author     : MinhQuang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <title>Register TBTS</title>
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
        <link rel="icon" href="assets/images/Logo.png" type="image/icon type">
        <!--===============================================================================================-->
    </head>
    <body>

        <div class="limiter">
            <div class="container-login100" style="background-image: url('assets/images/milkteaShopbackground.jpg');">
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="MainController" method="GET">
                        <span class="login100-form-logo">
                            <img src="assets/images/Logo.png" alt="" class = 'logo'>
                        </span>

                        <span class="login100-form-title p-b-34 p-t-27">
                            Register
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Enter username">
                            <input class="input100" type="text" name="username" placeholder="Username" required="">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                            ${requestScope.USER_ERROR.username}
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <input class="input100" type="password" name="password" placeholder="Password" required="">
                            <span class="focus-input100" data-placeholder="&#xf191;"></span>
                            ${requestScope.USER_ERROR.password}
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Re-Enter password">
                            <input class="input100" type="password" name="confirm" placeholder="Re-Enter" required="" >
                            <span class="focus-input100" data-placeholder="&#xf191;"></span>
                            ${requestScope.USER_ERROR.confirm}
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="address">
                            <input class="input100" type="text" name="address" placeholder="Address" required="">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                            
                        </div>                        
                        <div class="wrap-input100 validate-input" data-validate="Phone Number">
                            <input class="input100" type="text" name="phoneNo" required="" placeholder="Phone Number">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>

                       

                        <div class="container-login100-form-btn">
                            
                                <input class="login100-form-btn" type='submit' name='action' value='Register'>
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

