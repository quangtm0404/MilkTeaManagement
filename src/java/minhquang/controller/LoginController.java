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
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhquang.model.user.UserDAO;
import minhquang.model.user.UserDTO;
import minhquang.model.user.UserError;
import minhquang.utils.GoogleUtils;
import minhquang.utils.VerifyRecaptcha;

/**
 *
 * @author MinhQuang
 */
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final String SUCCESS_USER = "home";
    private final String ERROR = "login.jsp";
    private static final String AD = "ADM";
    private static final String US = "USR";
    private static final String SUCCESS_ADMIN = "home";
    private static final String REGISTER = "register.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String code = request.getParameter("code");
            if (code != null && !code.isEmpty()) {
                String accessToken = GoogleUtils.getToken(code);
                UserDTO googlePojo = GoogleUtils.getUserInfo(accessToken);
                UserDAO dao = new UserDAO();
                UserDTO user = dao.checkLogin(googlePojo);
                

                if (user != null) {

                    session.setAttribute("USER", user);
                    if (US.equals(user.getRoleID())) {
                        url = SUCCESS_USER;
                    } else if (AD.equals(user.getRoleID())) {
                        url = SUCCESS_ADMIN;
                    } else {
                        UserError uer = new UserError();
                        uer.setRoleID("Your Role is not Supported");
                        request.setAttribute("USER_ERROR", uer);
                    }
                } else {
                    session.setAttribute("USER", googlePojo);
                    url = REGISTER;
                    // Set Google Pojo len de registerController lay ve

                }

            }
        } catch (Exception e) {
            log("Error At Login Controller " + e.toString());
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
