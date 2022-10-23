/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhquang.model.category.CategoryDAO;
import minhquang.model.role.RoleDAO;
import minhquang.model.user.UserDAO;
import minhquang.model.user.UserDTO;

/**
 *
 * @author MinhQuang
 */
@WebServlet(name = "UpdateUserController", urlPatterns = {"/UpdateUserController"})
public class UpdateUserController extends HttpServlet {
    private static final String SUCCESS = "SearchUserController";
    private static final String ERROR = "error.jsp";
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = ERROR;
        
        try {
            UserDAO uDao = new UserDAO();
            String userID = request.getParameter("userID");
            String username = request.getParameter("username");
            String fullName = request.getParameter("fullName");
            String address = request.getParameter("address");
            String phoneNo = request.getParameter("phoneNo");
            String roleID = request.getParameter("roleID");
            String email = request.getParameter("email");
            UserDTO updateUser = new UserDTO(userID, username, fullName, email, address, phoneNo, roleID);
            if(uDao.update(updateUser)) {
                HttpSession session = request.getSession();
                UserDTO loginUser = (UserDTO)session.getAttribute("USER");
                System.out.println(loginUser.getName());
                if(loginUser.getId().equals(userID)) {
                    session.setAttribute("USER", updateUser);
                }
                url = SUCCESS;
            }
            
        } catch (Exception e) {
            log("Error at Update User Controller " + e.toString());
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
