<%-- 
    Document   : adminPage.jsp
    Created on : Jun 11, 2022, 8:40:02 AM
    Author     : MinhQuang
--%>

<%@page import="minhquang.model.user.UserDTO"%>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Admin-Manage</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="icon" href="assets/images/Logo.png" type="image/icon type">
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {        
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }	
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }    
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {    
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }	
            .modal form label {
                font-weight: normal;
            }	
        </style>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    </head>
    <body>
        <% UserDTO user = (UserDTO) session.getAttribute("USER");
            String active = (String) session.getAttribute("ACTIVE");
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            if (user == null || user.getRoleID().equals("USR")) {
                response.sendRedirect("login.jsp");
            }


        %>

        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home"><img src="assets/images/Logo.png" class="img-responsive" style="height: 65px;"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="MainController?action=HomeAdmin&active=User">Manage User</a></li>
                        <li class="nav-item"><a class="nav-link" href="MainController?action=HomeAdmin&active=Product">Manage Product</a></li>


                        <li class="nav-item "> 
                            <%                                if (user != null) {
                            %> 
                            <form  action="MainController" method="POST">
                                <input class="nav-link bg-light" type="submit" value="Logout" name="action" style="border:none;">
                            </form>
                            <% } else { %>
                            <form  action="MainController" method="POST">
                                <input class="nav-link bg-light" type="submit" value="Login" name="action" style="border:none;">
                            </form>
                            <% };%>
                        </li>
                        <li class="nav-item">

                            <% if ("User".equals(active)) {%>
                            <form action="MainController" method="POST">
                                <ul class="navbar-nav">
                                    <li class="nav-item"> 
                                        <input type="text" name="search" value="<%= search%>">
                                    </li>
                                    <li class="nav-item">

                                        <input value="SearchUser" class="nav-link bg-light" type="submit" name="action" style="border:none;">
                                    </li>
                                </ul>
                            </form> 

                            <% } else if ("Product".equals(active)) {%>
                            <form action="MainController" method="POST">
                                <ul class="navbar-nav">
                                    <li class="nav-item"> 
                                        <input type="text" name="search" value="<%= search%>">
                                    </li>
                                    <li class="nav-item">

                                        <input class="nav-link bg-light" type="submit" name="action" value="Search" style="border:none;">
                                    </li>
                                </ul>
                            </form> 
                            <% } %>


                        </li>
                    </ul>
                    <form class="d-flex" action="MainController" method="post">
                        <button class="btn btn-outline-dark" type="submit" value="Cart">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- End Of Navigation -->
        <div class="text-center" style="color:red; font-size: large;">${requestScope.ERROR_MESSAGE}</div>
        

        <%
            if ("User".equals(active)) {
        %>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Users</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
                                <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>User ID</th>
                                <th>Name</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Phone No</th>
                                <th>Role ID</th>
                                <th>Actions</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.USERLIST}" var="i">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td>${i.getId()}</td>
                                    <td>${i.getName()}</td>
                                    <td>${i.getUsername()}</td>
                                    <td>${i.getEmail()}</td>
                                    <td>${i.getAddress()}</td>
                                    <td>${i.getPhoneNo()}</td>
                                    <td>${i.getRoleID()}</td>
                                    <td>
                                        <!-- Update Employee -->
                                        <a href="#editEmployeeModa${i.getId()}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <div id="editEmployeeModa${i.getId()}" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="MainController" method="POST">
                                                        <div class="modal-header">						
                                                            <h4 class="modal-title">Edit User ${i.getName()}</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">					
                                                            <div class="form-group">
                                                                <label>User ID</label>
                                                                <input type="text" class="form-control" value="${i.getId()}" readonly="" name="userID">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Username</label>
                                                                <input type="text" class="form-control" value="${i.getUsername()}" name="username" required="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Full Name</label>
                                                                <input type="text" class="form-control" value="${i.getName()}" name="fullName" required="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Email</label>
                                                                <input type="text" class="form-control" value="${i.getEmail()}" name="email" readonly="" required="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Phone</label>
                                                                <input type="text" class="form-control" value="${i.getPhoneNo()}" name="phoneNo" required="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Address</label>
                                                                <input type="text" class="form-control" value="${i.getAddress()}" name="address" required="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Role</label>
                                                                <select name="roleID">
                                                                    <c:forEach items="${ROLELIST}" var="o">
                                                                        <option value="${o.getRoleID()}">${o.getRoleName()}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                            <input type="hidden" value="<%= search%>" name="search">
                                                            <input type="submit" name="action" value="Update User" class="btn btn-info">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Delete Employee -->
                                        <a href="#deleteEmployeeModal${i.getId()}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        <div id="deleteEmployeeModal${i.getId()}" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="MainController" method="GET">
                                                        <div class="modal-header">						
                                                            <h4 class="modal-title">Delete Employee</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">					
                                                            <p>Are you sure you want to delete these Records?</p>
                                                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="hidden" value="${i.getId()}" name="userID">
                                                            <input type="hidden" value="<%= search%>" name="search">
                                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                            <input type="submit" name="action" class="btn btn-danger" value="Delete User">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>




                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                        <ul class="pagination">
                            <li class="page-item disabled"><a href="#">Previous</a></li>
                            <li class="page-item"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item active"><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>        
        </div>
        <% } else if ("Product".equals(active)) {%>
        <!-- Product Management -->
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Products</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addProductModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Products</span></a>
                                <a href="#deleteProductModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete All Products</span></a>						
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Image</th>
                                <th>Description</th>
                                <th>Category IDs</th>
                                <th>Quantity</th>
                                <th>Actions</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.PRODUCTLIST}" var="i">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td>${i.getProductID()}</td>
                                    <td>${i.getProductName()}</td>
                                    <td>${i.getPrice()}</td>
                                    <td>
                                        <div> <img  src="${i.getImage()}" style="width:80px; height: 80px;"> </div>
                                    </td>
                                    <td>${i.getDescription()}</td>
                                    <td>${i.getCateID()}</td>
                                    <td>${i.getQuantity()}</td>
                                    <td>
                                        <!-- Update Employee -->
                                        <a href="#editProductModal${i.getProductID()}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <div id="editProductModal${i.getProductID()}" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="MainController" method="POST">
                                                        <div class="modal-header">						
                                                            <h4 class="modal-title">Edit Product</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label>product Name</label>
                                                                <input name="productID" type="text" value="${i.getProductID()}" class="form-control" required="" readonly="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>product Name</label>
                                                                <input name="productName" type="text" value="${i.getProductName()}" class="form-control" required="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Price</label>
                                                                <input type="number" name="price" value="${i.getPrice()}" class="form-control" required="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Image</label>
                                                                <input type="text" name="image" value="${i.getImage()}" class="form-control" required="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Description</label>
                                                                <input type="text" name="description" value="${i.getDescription()}" class="form-control">
                                                            </div>	
                                                            <div class="form-group">
                                                                <label>Quantity</label>
                                                                <input type="number" name="quantity" value="${i.getQuantity()}" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Category</label>
                                                                <select name="category">
                                                                    <c:forEach items="${CATELIST}" var="o">
                                                                        <option value="${o.getCateID()}">${o.getCateName()}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="hidden" name="search" value="<%= search%>">
                                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                            <input type="submit" name="action" value="UpdateProduct" class="btn btn-info">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Delete Employee -->
                                        <a href="#deleteProductModal${i.getProductID()}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        <div id="deleteProductModal${i.getProductID()}" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="MainController" method="POST">
                                                        <div class="modal-header">						
                                                            <h4 class="modal-title">Delete Product</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">					
                                                            <p>Are you sure you want to delete these Records?</p>
                                                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="hidden" name="productID" value="${i.getProductID()}">
                                                            <input type="hidden" name="search" value="<%= search%>">
                                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                            <input type="submit" name="action" class="btn btn-danger" value="DeleteProduct">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>




                        </tbody>
                    </table>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                        <ul class="pagination">
                            <li class="page-item disabled"><a href="#">Previous</a></li>
                            <li class="page-item"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item active"><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>        
        </div>
        <% }%>
        <!-- Create Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="addProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="MainController" method="GET">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Product ID</label>
                                <input type="text" class="form-control" required name="productID">
                            </div>
                            <div class="form-group">
                                <label>Product Name</label>
                                <input type="text" class="form-control" required name="productName">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="number" class="form-control" required name="price">
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="text" class="form-control" required name="image">
                            </div>		
                            <div class="form-group">
                                <label>Description</label>
                                <input type="text" class="form-control" name="description" value="">
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="number" class="form-control" name="quantity" value="">
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category">
                                    <c:forEach items="${CATELIST}" var="i">
                                        <option value="${i.getCateID()}">${i.getCateName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" value="<%= search %>" name="search">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" name="action" class="btn btn-success" value="AddProduct">
                        </div>


                    </form>
                </div>
            </div>
        </div>

        <!-- Edit Modal HTML -->



        <!-- Edit Product -->


        <!-- Delete Modal HTML -->



        <!-- Delete Product -->

    </body>
</html>