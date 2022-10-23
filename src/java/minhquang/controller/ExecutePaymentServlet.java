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

import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;
import minhquang.model.order.OrderDTO;
import minhquang.model.order.OrderDetailDAO;
import minhquang.model.product.Cart;
import minhquang.model.product.ProductDAO;
import minhquang.model.product.ProductDTO;
import minhquang.model.user.UserDTO;
import minhquang.utils.PaymentServices;
import minhquang.utils.SendMail;

@WebServlet("/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "orderSuccess.jsp";
    
    public ExecutePaymentServlet() {
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        String url = ERROR;
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
            
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);            
            HttpSession session = request.getSession();
            if (session != null) {
                UserDTO loginUser = (UserDTO) session.getAttribute("USER");
                OrderDTO order = (OrderDTO) session.getAttribute("ORDER");
                Cart cart = (Cart) session.getAttribute("CART");
                
                String msg = "Hello, " + loginUser.getName() + ". You Have Order MilkTea from Our Website \nTo Address: " + loginUser.getAddress() + "\n";
                if (order != null) {
                    OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                    for (ProductDTO item : cart.getCart().values()) {
                        // Insert vao OrderDetail
                        if (orderDetailDao.createOrderDetail(item, order.getOrderID())) {
                            // Cap nhat lai Quantity trong kho
                            ProductDAO productDao = new ProductDAO();
                            int curQuantity = productDao.getQuantity(item.getProductID());
                            int newQuantity = curQuantity - item.getQuantity();
                            productDao.updateQuantity(item.getProductID(), newQuantity);
                            msg += item.getProductName() + "_" + item.getPrice() + " VND\n";
                            
                        }
                    }
                    msg += "Total: " + order.getTotal() + " VND";
                }
                // Tao Don Hang va Insert Item vao Don Hang thanh cong
                // Huy CART ra khoi session

                SendMail.send(loginUser.getEmail(), "Order TBTS Success", msg);
                session.removeAttribute("CART");
                session.removeAttribute("ORDER");
                url = SUCCESS;
            }
            
        } catch (Exception ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    
}
