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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhquang.model.category.CategoryDAO;
import minhquang.model.product.ProductDAO;
import minhquang.model.category.CategoryDTO;
import minhquang.model.product.ProductDTO;
import minhquang.model.user.UserDTO;

/**
 *
 * @author MinhQuang
 */
public class SearchController extends HttpServlet {

    private static final String SUCCESS_USR = "index.jsp";
    private static final String SUCCESS_ADM = "adminPage.jsp";
    private static final String ERROR = "error.jsp";
    private static final String USR = "USR";
    private static final String ADM = "ADM";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
             HttpSession session = request.getSession();
            String search = request.getParameter("search");
            ProductDAO dao = new ProductDAO();
            CategoryDAO cateDao = new CategoryDAO();
            List<ProductDTO> pList = dao.getProductByName(search);
            List<CategoryDTO> cateList = cateDao.getListCategory();
            ProductDTO product = dao.getBestSeller();
            if (cateList.size() > 0 && pList.size() > 0) {
               
                UserDTO user = (UserDTO) session.getAttribute("USER");
                if (user == null || USR.equals(user.getRoleID())) {
                    request.setAttribute("PRODUCT", product);
                    request.setAttribute("CATELIST", cateList);
                    request.setAttribute("PRODUCTLIST", pList);
                    url = SUCCESS_USR;
                }else if(ADM.equals(user.getRoleID())) {
                    session = request.getSession();
                    request.setAttribute("CATELIST", cateList);
                    request.setAttribute("PRODUCTLIST", pList);
                    request.setAttribute("PRODUCT", product);
                    String active = (String) session.getAttribute("ACTIVE");
                    if(active == null) {
                        url = SUCCESS_USR;
                    } else if("Product".equals(active)) {
                        url = SUCCESS_ADM;
                    }
                    
                    
                    
                }
            }

        } catch (Exception e) {
            log("Error at Search Controller " + e.toString());
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
