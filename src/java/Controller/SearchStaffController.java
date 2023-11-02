/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDao;
import DTO.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quang
 */
@WebServlet(name = "SearchStaffController", urlPatterns = {"/SearchStaffController"})
public class SearchStaffController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       try (PrintWriter out = response.getWriter()) {
            String url="";
            String txtSearch = request.getParameter("txtsearch");
            String searchBy = request.getParameter("searchby");
            String isSearch = request.getParameter("issearch");
            if (!txtSearch.isEmpty()) {
                ArrayList<Account> accList = AccountDao.findAccByStaff(txtSearch, searchBy);
                if (accList != null && !accList.isEmpty()) {
                    request.setAttribute("searchList", accList);
                    request.setAttribute("lastSearchValue", txtSearch);
                    request.setAttribute("searchByValue", searchBy);
                    request.setAttribute("isSearch", isSearch);
                   
                    if (accList.size() > 0) {
                        request.setAttribute("Staff",accList);
                        url = "allStaff.jsp";
                    }
                } else {
                    request.setAttribute("mess", "Not found!");
                }
            } else {
                request.setAttribute("mess", "Do not leave blank!");
            }
            request.getRequestDispatcher("allStaff.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SearchAccountController.class.getName()).log(Level.SEVERE, null, ex);
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
