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
        <style>
            label {
                color:white;
                font-weight: bolder;
            }
        </style>
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
                            <label>Username</label>
                            <input class="input100" type="text" name="username" placeholder="Username" required="">
                           
                             <div class="text-center"style="color:black; font-weight: bolder;">${requestScope.USER_ERROR.username}</div>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Enter Full Name">
                            <label>Full Name</label>
                            <input class="input100" type="text" name="fullName" placeholder="" required="">
                            
                             <div class="text-center" style="color:black; font-weight: bolder;">${requestScope.USER_ERROR.name}</div>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Enter Email">
                            <label>Email</label>
                            <input class="input100" type="email" name="email" placeholder="" required="">
                           
                             <div class="text-center" style="color:black; font-weight: bolder;">${requestScope.USER_ERROR.email}</div>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <label>Password</label>
                            <input class="input100" type="password" name="password" placeholder="" required="">
                            
                             <div class="text-center" style="color:black; font-weight: bolder;">${requestScope.USER_ERROR.password}</div>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Re-Enter password">
                            <label>Re-enter Password</label>
                            <input class="input100" type="password" name="confirm" placeholder="" required="" >
                            
                             <div class="text-center" style="color:black; font-weight: bolder;">${requestScope.USER_ERROR.confirm}</div>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="address">
                            <label>Address</label>
                            <input class="input100" type="text" name="address" placeholder="" required="">
                            

                        </div>                        
                        <div class="wrap-input100 validate-input" data-validate="Phone Number">
                            <label>Phone Number</label>
                            <input class="input100" type="text" name="phoneNo" required="" placeholder="">
                            
                        </div>

                        <div class="form-group">
                            <label>Role</label>
                            <select name="roleID">
                                
                                    <option value="USR">User</option>
                               
                            </select>
                        </div>


                        <div class="container-login100-form-btn">

                            <input class="login100-form-btn" type='submit' name='action' value='REGISTER'>
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

