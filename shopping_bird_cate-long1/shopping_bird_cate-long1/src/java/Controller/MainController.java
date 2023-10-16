/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hailo
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGOUT = "logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String LOAD_HOME_PAGE = "ListAllProducts";
    private static final String shop_CONTROLLER = "product";
    private static final String shopping = "shop";
    private static final String pro_detail = "ProDetail";
    private static final String checkout_controllner = "checkout";
    private static final String checkoutt = "checkout";
    private static final String pro_detail_CONTROLLNER = "productdetail";
    private static final String add = "addtocart";
    private static final String add_controllner = "addtocart";
    private static final String comproduct = "compro";
    private static final String pro_com_CONTROLLNER = "addcompare1";
    private static final String pro_com2_CONTROLLNER = "com2";
    private static final String pro_com2 = "addcompare2";
    private static final String pro_com3_CONTROLLNER = "com3";
    private static final String pro_com3 = "addcompare3";
    private static final String List_cus = "allcuss";
    private static final String List_cus_controllner = "ListALLcus";

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
                    case "delidetail":
                        url = "Loaddeliverydetail";
                        break;
                        case "acc":
                        url = "updateacc";
                        break;                  
                    case "Register":
                        url = "RegisterController1";
                        break;

                    case "pro":
                        url = "ManagePro";
                        break;
                    case "vu":
                        url = "ManagerVoucherStaff";
                        break;
                    case "delivery":
                        url = "deliverycontrollner";
                        break;
                    case "orderslist":
                        url = "ManageOders";
                        break;
                    case "login":
                        url = "LoginServlet";
                        break;
                    case "loadacc":
                        url = "Loadacccontrollner";
                        break;
                    case add:
                        url = add_controllner;
                        break;
                    case List_cus:
                        url = List_cus_controllner;
                        break;
                    case LOGOUT:
                        url = LOGOUT_CONTROLLER;
                        break;
                    case shopping:
                        url = shop_CONTROLLER;
                        break;
                    case pro_detail:
                        url = pro_detail_CONTROLLNER;
                        break;
                    case checkout_controllner:
                        url = checkoutt;
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
                    case "MANAGE_ACCOUNT":
                        url = "allCusController";
                        break;
                    case "BAN_ACCOUNT":
                        url = "BanController";
                        break;
                    case "SEARCH":
                        url = "SearchAccountController";
                        break;
                    case "His":
                        url = "bookingHistory";
                        break;
                    case "AllSTAFF":
                        url = "AllStaffSevlet";
                        break;                       
                    case "SEARCHS":
                        url = "SearchStaffController";
                        break;
                    case "addStaff":
                        url = "addStaffController";
                        break;
                    case "BAN_Staff":
                        url = "BanStaffController";
                        break;

                    case "Update":
                        url = "EditStaffController";
                        break;
                    case "SearchByID":
                        url = "SearchByID";
                        break;
                    case "Searchs":
                        url = "SearchStaffController";
                        break;
                    case "BOOKING":
                        url = "BookingServlet";
                        break;
                }
            }
        } catch (Exception e) {
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
