/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DTO.CategoryDTO;
import DTO.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "searchcontrollner", urlPatterns = {"/searchcontrollner"})
public class searchcontrollner extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "shop1.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String url = null;
            String txtSearch = request.getParameter("txt");
            String min = request.getParameter("minPrice");
            String max = request.getParameter("maxPrice");

            ProductDAO a = new ProductDAO();
            CategoryDAO b = new CategoryDAO();

            List<CategoryDTO> listC = b.getAllCategory();
             List<ProductDTO> list = null;
            if (txtSearch != null && !txtSearch.trim().isEmpty()) {
                list = a.searchByName(txtSearch);
            } else if (min != null && max != null) {
                double minNum = Double.parseDouble(min);
                double maxNum = Double.parseDouble(max);
                 list = a.search(minNum, maxNum);
            }  if (list == null) {
                String mess = "Not found!";
                request.setAttribute("message", mess);
            }
            request.setAttribute("listP", list);
            request.setAttribute("listCC", listC);
            
            request.getRequestDispatcher("shop1.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(searchcontrollner.class.getName()).log(Level.SEVERE, null, ex);
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
