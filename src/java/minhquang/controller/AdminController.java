/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.controller;

import minhquang.model.role.RoleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhquang.model.category.CategoryDAO;
import minhquang.model.product.ProductDAO;
import minhquang.model.user.UserDAO;
import minhquang.model.category.CategoryDTO;
import minhquang.model.product.ProductDTO;
import minhquang.model.role.RoleDAO;
import minhquang.model.user.UserDTO;

/**
 *
 * @author MinhQuang
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {
    private static final String SUCCESS = "adminPage.jsp";
    private static final String ERROR = "error.jsp";
    private static final String PRODUCT_MAN = "Product";
    private static final String USER_MAN = "User";

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        try {
            String active = request.getParameter("active");
            HttpSession session = request.getSession();
            if(PRODUCT_MAN.equals(active)) {
                ProductDAO dao = new ProductDAO();
                List<ProductDTO> productList = dao.getAllProducts();
                if(productList.size() > 0) {
                    request.setAttribute("PRODUCTLIST", productList);
                    session.setAttribute("ACTIVE", active);
                    url = SUCCESS;
                }
            }else if(USER_MAN.equals(active)) {
                UserDAO uDao = new UserDAO();
                RoleDAO rDao = new RoleDAO();
                List<UserDTO> userList = uDao.getAllUser();
                List<RoleDTO> roleList = rDao.getAllRole();
                if(userList.size() > 0 && roleList.size() > 0) {
                request.setAttribute("ROLELIST", roleList);
                request.setAttribute("USERLIST", userList);
                session.setAttribute("ACTIVE", active);
                url = SUCCESS;
                }
            }
            CategoryDAO cateDao = new CategoryDAO();
            List<CategoryDTO> cateList = cateDao.getListCategory();
            if(cateList.size() > 0) {
                request.setAttribute("CATELIST", cateList);
            }
                
        } catch (Exception e) {
            log("Error at Admin Controller " + e.toString());
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
