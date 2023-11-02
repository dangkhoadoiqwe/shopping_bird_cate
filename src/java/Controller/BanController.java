/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.AccountDao;
import DTO.Account;

/**
 *
 * @author Quang
 */
@WebServlet(name = "BanController", urlPatterns = {"/BanController"})
public class BanController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String FAIL = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int Id = Integer.parseInt(request.getParameter("userId"));
            int status = Integer.parseInt(request.getParameter("accountStatus"));
            String lastSearchValue = request.getParameter("lastSearchValue");
            String searchByValue = request.getParameter("searchByValue");
            boolean isSearch = Boolean.parseBoolean(request.getParameter("isSearch"));
            AccountDao accDao = new AccountDao();
            String url;
            boolean check;
            if (status == 0) {
                check = accDao.banAccount(Id, 1);
                if (check) {
                    if (isSearch) {
                        url = "MainController?action=SEARCH&txtSearch=" + lastSearchValue + "&searchBy=" + searchByValue;
                    } else {
                        request.setAttribute("isSearch", isSearch);
                        url = "MainController?action=MANAGE_ACCOUNT";
                    }
                } else {
                    url = FAIL;
                }
            } else {
                check = accDao.banAccount(Id, 0);
                if (check) {
                    if (isSearch) {
                        url = "MainController?action=SEARCH&txtSearch=" + lastSearchValue + "&searchBy=" + searchByValue;
                    } else {
                        request.setAttribute("isSearch", isSearch);
                        url = "MainController?action=MANAGE_ACCOUNT";
                    }
                } else {
                    url = FAIL;
                }
            }

            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BanController.class.getName()).log(Level.SEVERE, null, ex);
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
