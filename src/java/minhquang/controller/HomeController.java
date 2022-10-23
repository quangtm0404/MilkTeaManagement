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
import minhquang.model.category.CategoryDAO;
import minhquang.model.product.ProductDAO;
import minhquang.model.category.CategoryDTO;
import minhquang.model.product.ProductDTO;

/**
 *
 * @author MinhQuang
 */
public class HomeController extends HttpServlet {
    private static final String SUCCESS = "index.jsp";
    private static final String ERROR = "error.jsp";
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductDAO dao = new ProductDAO();
        CategoryDAO cateDao = new CategoryDAO();
       
        try {
            List<ProductDTO> productList = dao.getAllProducts();
            List<CategoryDTO> cateList = cateDao.getListCategory();
            ProductDTO product = dao.getBestSeller();
            if(productList.size() > 0 && cateList.size() > 0) {
                request.setAttribute("PRODUCTLIST", productList);
                request.setAttribute("CATELIST", cateList);
                request.setAttribute("PRODUCT", product);
                url = SUCCESS;
                
            }
        } catch (Exception e) {
            log("Error at Home Controller " + e.toString());
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
