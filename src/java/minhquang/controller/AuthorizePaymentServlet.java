package minhquang.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.paypal.base.rest.PayPalRESTException;
import minhquang.model.order.OrderDAO;
import minhquang.model.order.OrderDTO;
import minhquang.model.order.OrderDetailDAO;
import minhquang.model.product.Cart;
import minhquang.model.product.ProductDAO;
import minhquang.model.product.ProductDTO;
import minhquang.model.user.UserDTO;
import minhquang.utils.PaymentServices;
import minhquang.utils.SendMail;

@WebServlet("/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String LOGIN = "login.jsp";
    private static final String ERROR = "shoppingCart.jsp";

    public AuthorizePaymentServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            OrderDTO order = null;
            UserDTO loginUser = null;

            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                loginUser = (UserDTO) session.getAttribute("USER");
                if (loginUser == null) {
                    url = LOGIN;
                }
                if (cart != null && loginUser != null) {
                    if (cart.checkValid()) {
                        
                        order = new OrderDAO().createOrderV2(loginUser.getId(), (float) cart.getTotalPrice());
//                        String msg = "Hello, " + loginUser.getName() + ". You Have Order MilkTea from Our Website \n To Address: " + loginUser.getAddress() + "\n";
//                        if (order != null) {
//                            OrderDetailDAO orderDetailDao = new OrderDetailDAO();
//                            for (ProductDTO item : cart.getCart().values()) {
//                                // Insert vao OrderDetail
//                                if (orderDetailDao.createOrderDetail(item, order.getOrderID())) {
//                                    // Cap nhat lai Quantity trong kho
//                                    ProductDAO productDao = new ProductDAO();
//                                    int curQuantity = productDao.getQuantity(item.getProductID());
//                                    int newQuantity = curQuantity - item.getQuantity();
//                                    productDao.updateQuantity(item.getProductID(), newQuantity);
//                                    msg += item.getProductName() + "_" + item.getPrice() + " VND\n";
//
//                                }
//                            }
//                            msg += "Total: " + order.getTotal();
//                        }
//                        // Tao Don Hang va Insert Item vao Don Hang thanh cong
//                        // Huy CART ra khoi session
//
//                        SendMail.send(loginUser.getEmail(), "Order TBTS Success", msg);
//                        session.removeAttribute("CART");
                        session.setAttribute("ORDER", order);
                        PaymentServices paymentServices = new PaymentServices();
                        url = paymentServices.authorizePayment(order, loginUser);
                        response.sendRedirect(url);
                    } else {
                        request.setAttribute("ERROR", "Not Enough Item In Stock");
                        url = ERROR;
                    }
                }
            }
            if(session == null || loginUser == null) {
                request.getRequestDispatcher(url).forward(request, response);
            }

        } catch (Exception ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
