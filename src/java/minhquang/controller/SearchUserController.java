/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import minhquang.model.category.CategoryDAO;
import minhquang.model.user.UserDAO;
import minhquang.model.category.CategoryDTO;
import minhquang.model.role.RoleDAO;
import minhquang.model.role.RoleDTO;
import minhquang.model.user.UserDTO;

/**
 *
 * @author MinhQuang
 */
@WebServlet(name = "SearchUserController", urlPatterns = {"/SearchUserController"})
public class SearchUserController extends HttpServlet {
private static final String SUCCESS = "adminPage.jsp";
private static final String ERROR = "adminPage.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            UserDAO uDao = new UserDAO();
            CategoryDAO cateDao = new CategoryDAO();
            RoleDAO rDao = new RoleDAO();
            List<UserDTO> uList = uDao.search(search);
            List<RoleDTO> roleList = rDao.getAllRole();
            List<CategoryDTO> cateList = cateDao.getListCategory();
            if(uList.size() > 0 && cateList.size() > 0 && roleList.size() > 0) {
                request.setAttribute("ROLELIST", roleList);
                request.setAttribute("USERLIST", uList);
                request.setAttribute("CATELIST", cateList);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error At Search User Controller " + e.toString());
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
