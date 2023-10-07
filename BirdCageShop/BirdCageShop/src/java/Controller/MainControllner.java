/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainControllner extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String LOGIN = "login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String LOAD_HOME_PAGE = "ListAllProducts";
    private static final String pro_detail = "ProDetail";
    private static final String pro_detail_CONTROLLNER = "productdetail";
    private static final String shop_CONTROLLER = "product";
    private static final String shopping = "shop";
    private static final String comproduct = "compro";
    private static final String pro_com_CONTROLLNER = "addcompare1";
    private static final String pro_com2_CONTROLLNER = "com2";
    private static final String pro_com2 = "addcompare2";
    private static final String pro_com3_CONTROLLNER = "com3";
    private static final String pro_com3 = "addcompare3";
    private static final String Search_CONTROLLNER = "searchpro";
    private static final String search = "searchcontrollner";
    private static final String add = "addtocart";
    private static final String add_controllner = "addtocart";
    private static final String checkout_controllner = "checkout";
    private static final String checkoutt = "CheckOut";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOAD_HOME_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOAD_HOME_PAGE;
            } else {
                switch (action) {
                    case shopping:
                        url = shop_CONTROLLER;
                        break;
                    case LOGIN:
                        url = LOGIN_CONTROLLER;
                        break;
                    case checkout_controllner:
                        url = checkoutt;
                        break;

                    case LOGOUT:
                        url = LOGOUT_CONTROLLER;
                        break;
                    case pro_detail:
                        url = pro_detail_CONTROLLNER;
                        break;
                    case comproduct:
                        url = pro_com_CONTROLLNER;
                        break;
                    case pro_com2_CONTROLLNER:
                        url = pro_com2;
                        break;
                    case pro_com3_CONTROLLNER:
                        url = pro_com3;
                        break;
                    case Search_CONTROLLNER:
                        url = search;
                        break;
                    case add:
                        url = add_controllner;
                        break;
                }
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
            request.setAttribute("mess", e.toString());
        } finally {
            request.getSession().setAttribute("urlHistory", "MainController");
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
