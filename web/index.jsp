<%-- 
    Document   : index.jsp
    Created on : Jun 4, 2022, 9:17:36 AM
    Author     : MinhQuang
--%>

<%@page import="minhquang.model.product.Cart"%>
<%@page import="minhquang.model.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="icon" href="assets/images/Logo.png" type="image/icon type">
        <title>

            Tui Bán Trà Sữa</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>

        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="home"><img src="assets/images/Logo.png" class="img-responsive" style="height: 65px;"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>

                        <li class="nav-item dropdown">
                            <%
                                UserDTO user = (UserDTO) session.getAttribute("USER");
                                String search = request.getParameter("search");
                                if (search == null) {
                                    search = "";
                                }
                                if (user == null) { %>

                            <% } else if (user.getRoleID() != null && "USR".equals(user.getRoleID())) { %>
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="home">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="MainController?action=BestSeller">Best Seller</a></li>

                            </ul>
                            <% } else if (user.getRoleID() != null && "ADM".equals(user.getRoleID())) { %>
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Manage</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="MainController?action=HomeAdmin&active=Product">Manage Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="MainController?action=HomeAdmin&active=User">Manage Users</a></li>

                            </ul>

                            <% } %>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Categories</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <c:forEach items="${CATELIST}" var="i">
                                    <li><a class="dropdown-item" href="MainController?cateID=${i.getCateID()}&action=SearchByCategory">${i.getCateName()}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                        <li class="nav-item "> 
                            <%

                                if (user != null) {
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

                            <form action="MainController" method="post">
                                <ul class="navbar-nav">
                                    <li class="nav-item">  
                                        <input type="text" name="search" value="<%= search%>">
                                    </li>
                                    <li class="nav-item">
                                        <input class="nav-link bg-light" type="submit" name="action" value="Search" style="border:none;">
                                    </li>
                                </ul>
                            </form> 


                        </li>
                    </ul>
                    <form class="d-flex" action="shoppingCart.jsp" method="post">
                        <button class="btn btn-outline-dark" type="submit" value="Cart">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%
                                Cart cart = (Cart) session.getAttribute("CART");
                                if (cart != null) {
                                %>
                                <%= cart.getCart().size()%>
                                <% } else { %>
                                0
                                <% } %></span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>




        <!-- Header-->
        <header class="bg-dark py-5" style="background-image: url(assets/images/milkteaShopbackground03.jpg)">
            <div class="container px-4 px-lg-5 my-5" >
                <div class="text-center text-red">
                    <h1 class="display-4 fw-bolder" >Shop in style</h1>
                    <p class="lead fw-normal text-red-50 mb-0" style="color: #330033; font-weight: bold;">Welcome <% if (user != null)%><%= user.getName()%> <%;%> </p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            
            <div class="container col-sm-3" style="float: left;"> 
            <div class="col mb-2">
                            <div class="card-header bg-success text-white text-uppercase text-center">Best Seller</div>
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="${PRODUCT.getImage()}" alt="${PRODUCT.getDescription()}" />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${PRODUCT.getProductName()}</h5>
                                        <!-- Product price-->
                                        ${PRODUCT.getPrice()} VND
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <c:if test="${PRODUCT.quantity > 0}"> 
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="MainController?action=AddToCart&productID=${PRODUCT.getProductID()}&quantity=1">Add To Cart</a></div>
                                    </div>
                                </c:if> 
                            </div>
                        </div>
            </div>
            <div class="container px-8 px-lg-9 mt-8">
                <div class="row gx-4 gx-lg-9 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
                    <c:forEach items="${requestScope.PRODUCTLIST}" var="o">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="${o.getImage()}" alt="${o.getDescription()}" />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${o.getProductName()}</h5>
                                        <!-- Product price-->
                                        ${String.format("%7.0f",o.getPrice())} VND
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <c:if test="${o.quantity > 0}"> 
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="MainController?action=AddToCart&productID=${o.getProductID()}&quantity=1">Add To Cart</a></div>
                                    </div>
                                </c:if> 
                                <c:if test="${o.quantity == 0}"> 
                                    <div class = "text-center" style="color:blue;">Out of Stock</div>
                                    <br>
                                </c:if>
                                
                            </div>
                        </div>
                    </c:forEach>
                </div>
                


            </div>
            

           


            <ul class="pagination" style="display: flex; justify-content: center;">
                <li class="page-item"><a href="#" class="page-link">Previous</a></li>
                <li class="page-item"><a href="#" class="page-link">1</a></li>
                <li class="page-item"><a href="#" class="page-link">2</a></li>
                <li class="page-item active"><a href="#" class="page-link">3</a></li>
                <li class="page-item"><a href="#" class="page-link">4</a></li>
                <li class="page-item"><a href="#" class="page-link">5</a></li>
                <li class="page-item"><a href="#" class="page-link">Next</a></li>
            </ul>


        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; TUI BAN TRA SUA</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
