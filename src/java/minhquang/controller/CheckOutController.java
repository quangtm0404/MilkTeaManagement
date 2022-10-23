/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhquang.model.order.OrderDAO;
import minhquang.model.order.OrderDetailDAO;
import minhquang.model.product.Cart;
import minhquang.model.product.ProductDAO;
import minhquang.model.product.ProductDTO;
import minhquang.model.user.UserDTO;
import minhquang.utils.SendMail;

/**
 *
 * @author MinhQuang
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {
    private static final String SUCCESS = "orderSuccess.jsp";
    private static final String ERROR = "shoppingCart.jsp";
    private static final String LOGIN = "login.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            if(session != null) {
                UserDTO loginUser = (UserDTO) session.getAttribute("USER");
                if(loginUser == null) url = LOGIN;
                Cart cart = (Cart) session.getAttribute("CART");
                if(cart != null) {
                    if(cart.checkValid()) {
                        OrderDAO orderDao = new OrderDAO();
                        int orderID = orderDao.createOrder(loginUser.getId(), (float)cart.getTotalPrice());
                        if(orderID > 0) {
                            String msg = "Hello, " + loginUser.getName() +  "You Have Order MilkTea from Our Website \nTo Address: " + loginUser.getAddress() + "\n";
                            OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                            for (ProductDTO item : cart.getCart().values()) {
                                // Insert vao OrderDetail
                                if(orderDetailDao.createOrderDetail(item, orderID)) {
                                    // Cap nhat lai Quantity trong kho
                                    ProductDAO productDao = new ProductDAO();
                                    int curQuantity = productDao.getQuantity(item.getProductID());
                                    int newQuantity = curQuantity - item.getQuantity();
                                    productDao.updateQuantity(item.getProductID(), newQuantity);
                                    msg += item.getProductName() + "_" + item.getQuantity() + "_" + item.getPrice() + "\n";
                                }
                            }
                            msg += "Total " + cart.getTotalPrice() + " VND";
                            
                            // Tao Don Hang va Insert Item vao Don Hang thanh cong
                            // Huy CART ra khoi session
                            
                            SendMail.send(loginUser.getEmail(), "Order TBTS Success", msg);
                            session.removeAttribute("CART");
                            url = SUCCESS;
                        }
                    } else {
                        request.setAttribute("ERROR", "NOT ENOUGH ITEM IN STOCK");
                    }
                }
            }
        } catch (Exception e) {
            log("Error at CheckOutController " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
