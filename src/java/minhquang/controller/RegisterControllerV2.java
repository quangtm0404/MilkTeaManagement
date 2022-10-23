/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import minhquang.model.user.UserDAO;
import minhquang.model.user.UserDTO;
import minhquang.model.user.UserError;

/**
 *
 * @author MinhQuang
 */
@WebServlet(name = "RegisterControllerV2", urlPatterns = {"/RegisterControllerV2"})
public class RegisterControllerV2 extends HttpServlet {
    private static final String SUCCESS = "login.jsp";
    private static final String ERROR = "register2.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        
        try {
            String username = request.getParameter("username");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            String address = request.getParameter("address");
            String phoneNo = request.getParameter("phoneNo");
            String roleID = request.getParameter("roleID");
            UserDTO registerUser = new UserDTO("US" + username + new Random().nextInt(Integer.MAX_VALUE), email, username, password, fullName, address, phoneNo, roleID);
            UserError userError = new UserError();
            UserDAO userDao = new UserDAO();
            if(userDao.checkLogin(registerUser) != null) {
                userError.setEmail("Email Has exsited!");
                request.setAttribute("USER_ERROR", userError);
            }
            else if(!password.equals(confirm)) {
                userError.setConfirm("Password and ReEnter Password does not Match");
                request.setAttribute("USER_ERROR", userError);
            } 
             else {
                if(userDao.signUp(registerUser)) {
                    url = SUCCESS;
                }
            }
            
            
        } catch (Exception e) {
            log("Error at Register ControllerV2 " + e.toString());
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
