/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MinhQuang
 */
public class MainController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    
    
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "login";    
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SEARCHBYCATE = "SearchByCategory";
    private static final String SEARCHBYCATE_CONTROLLER = "SearchByCategoryController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String ADMIN = "HomeAdmin";
    private static final String ADMIN_CONTROLLER = "AdminController";
    private static final String DELETEPRODUCT = "DeleteProduct";
    private static final String DELETEPRODUCT_CONTROLLER = "DeleteProductController";
    private static final String SEARCH_USER = "SearchUser";
    private static final String SEARCH_USER_CONTROLLER = "SearchUserController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String LOGINV2 = "LOGIN";
    private static final String LOGINV2_CONTROLLER = "LoginControllerV2";
    private static final String DELETEUSER = "Delete User";
    private static final String DELETEUSER_CONTROLLER = "DeleteUserController";    
    private static final String UPDATEUSER = "Update User";
    private static final String UPDATEUSER_CONTROLLER = "UpdateUserController";
    private static final String UPDATEPRODUCT = "UpdateProduct";
    private static final String UPDATEPRODUCT_CONTROLLER = "UpdateProductController";
    private static final String ADDPRODUCT = "AddProduct";
    private static final String ADDPRODUCT_CONTROLLER = "AddProductController";
    private static final String ADDTOCART = "AddToCart";
    private static final String ADDTOCART_CONTROLLER = "AddToCartController";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
   
    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";
   
    private static final String CHECKOUT = "CheckOut";
    private static final String CHECKOUT_CONTROLLER = "CheckOutController";
   
    private static final String CHECKOUTPAYPAL = "CheckOutByPayPal";
    private static final String CHECKOUTPAYPAL_CONTROLLER = "authorize_payment";
    
    private static final String REGISTERV2 = "REGISTER";
    private static final String REGISTERV2_CONTROLLER = "RegisterControllerV2";
    
   

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        
        try {
            String action = request.getParameter("action");
            if(LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            }else if(LOGOUT.equals(action)) 
                url = LOGOUT_CONTROLLER;
            else if(SEARCHBYCATE.equals(action)) 
                url = SEARCHBYCATE_CONTROLLER;
            else if(SEARCH.equals(action))
                url = SEARCH_CONTROLLER;
            else if(ADMIN.equals(action))
                url = ADMIN_CONTROLLER;
            else if(DELETEPRODUCT.equals(action))
                url = DELETEPRODUCT_CONTROLLER;
            else if(SEARCH_USER.equals(action)) 
                url = SEARCH_USER_CONTROLLER;
            else if(REGISTER.equals(action))
                url = REGISTER_CONTROLLER;
            else if(LOGINV2.equals(action)) 
                url = LOGINV2_CONTROLLER;
            else if(DELETEUSER.equals(action))
                url = DELETEUSER_CONTROLLER;
            else if(UPDATEUSER.equals(action))
                url = UPDATEUSER_CONTROLLER;
            else if(UPDATEPRODUCT.equals(action))
                url = UPDATEPRODUCT_CONTROLLER;
            else if(ADDPRODUCT.equals(action)) 
                url = ADDPRODUCT_CONTROLLER;
            else if(ADDTOCART.equals(action))
                url = ADDTOCART_CONTROLLER;
            else if(REMOVE.equals(action))
                url = REMOVE_CONTROLLER;
            else if(EDIT.equals(action))
                url = EDIT_CONTROLLER;
            else if(CHECKOUT.equals(action))
                url = CHECKOUT_CONTROLLER;
            else if(CHECKOUTPAYPAL.equals(action)) 
                url = CHECKOUTPAYPAL_CONTROLLER;
            else if(REGISTERV2.equals(action))
                url = REGISTERV2_CONTROLLER;
            
        
           
            
        } catch (Exception e) {
            log("Error At Main Controller " + e.toString());
        }finally {
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
