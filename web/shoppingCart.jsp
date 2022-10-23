<%-- 
    Document   : shoppingCart
    Created on : Jun 19, 2022, 7:02:59 AM
    Author     : MinhQuang
--%>

<%@page import="minhquang.model.product.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="minhquang.model.product.Cart"%>
<%@page import="minhquang.model.product.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 

<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="icon" href="assets/images/Logo.png" type="image/icon type">
    <style>
        body{
            margin-top:20px;
            background:#eee;
        }
        .ui-w-40 {
            width: 40px !important;
            height: auto;
        }

        .card{
            box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);    
        }

        .ui-product-color {
            display: inline-block;
            overflow: hidden;
            margin: .144em;
            width: .875rem;
            height: .875rem;
            border-radius: 10rem;
            -webkit-box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
            box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div class="container px-3 my-5 clearfix">
        <!-- Shopping cart table -->
        <div class="card">
            <div class="card-header">
                <h2>Shopping Cart</h2>
            </div>
            <div class="card-body">
                ${ERROR}
                <div class="table-responsive">
                    <%
                        Cart cart = (Cart) session.getAttribute("CART");
                        if (cart != null && cart.getCart().size() > 0) {
                    %>
                    <table class="table table-bordered m-0">
                        <thead>
                            <tr>
                                <!-- Set columns width -->
                                <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
                                <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                                <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                                <th class="text-center py-3 px-4" style="width:80px;"> Edit Item </th>
                                <th class="text-center py-3 px-4" style="width:80px;"> Remove Item </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (ProductDTO item : cart.getCart().values()) {

                            %>
                        <form action="MainController" method="POST">
                            <tr>
                                <td class="p-4">
                                    <div class="media align-items-center">
                                        <img src="<%= item.getImage()%>" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                        <div class="media-body">
                                            <a href="#" class="d-block text-dark"><%= item.getProductName()%></a>
                                            <!--  <small>
                                                <span class="text-muted">Color:</span>
                                                <span class="ui-product-color ui-product-color-sm align-text-bottom" style="background:#e81e2c;"></span> &nbsp;
                                                <span class="text-muted">Size: </span> EU 37 &nbsp;
                                                <span class="text-muted">Ships from: </span> China
                                            </small> -->
                                        </div>
                                    </div>
                                </td>
                                <td class="text-right font-weight-semibold align-middle p-4"><%= String.format("%7.0f",  item.getPrice()) %> VND</td>
                                <td class="align-middle p-4"><input type="number" name="quantity" min="1" class="form-control text-center" value="<%= item.getQuantity()%>"></td>
                                <td class="text-right font-weight-semibold align-middle p-4"><%= String.format("%7.0f", item.getPrice() * item.getQuantity() ) %> VND</td>
                            <input type="hidden" value="<%= item.getProductID()%>" name="productID">
                            <td class="text-center align-middle px-0"><input name="action" type="submit" value="Edit" style="border:none; background-color: white;"></td>
                            <td class="text-center align-middle px-0"><input name="action" type="submit" value="Remove" style="border:none; background-color: white;"></td>
                            </tr>

                            <% }%>
                        </form>




                        </tbody>
                    </table>

                </div>
                <!-- / Shopping cart table -->

                <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                    <div class="mt-4">
                        <label class="text-muted font-weight-normal">Promocode</label>
                        <input type="text" placeholder="ABC" class="form-control">
                    </div>
                    <div class="d-flex">
                        <div class="text-right mt-4 mr-5">
                            <label class="text-muted font-weight-normal m-0">Discount</label>
                            <div class="text-large"><strong>0 VND</strong></div>
                        </div>
                        <div class="text-right mt-4">
                            <label class="text-muted font-weight-normal m-0">Total price</label>
                            <div class="text-large"><strong><%= String.format("%7.0f",  cart.getTotalPrice()) %></strong></div>
                        </div>
                    </div>
                </div>
                                            <form action="MainController" method="POST">
                        <i class="fa fa-paypal" aria-hidden="true"></i>
                        <input type="submit" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3" name="action" value="CheckOutByPayPal">
                    </form>
                        <button type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3"><a href="MainController?action=CheckOut">Check Out</a></button>
                <% }%>
                <div class="float-right">
                    <button type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3"><a href="home">Back To Shopping</a></button>
                    

                </div>
            </div>
        </div>
    </div>
</body>