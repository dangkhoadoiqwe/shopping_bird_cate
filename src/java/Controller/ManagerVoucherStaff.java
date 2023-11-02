/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDao;
import DAO.VoucherDao;
import DTO.Product;
import DTO.Voucher;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ManagerVoucherStaff", urlPatterns = {"/ManagerVoucherStaff"})
public class ManagerVoucherStaff extends HttpServlet {

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
    private static final String SUCCESS = "vouchers.jsp";

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) { 
        HttpSession session = request.getSession();
        VoucherDao voucherDao = new VoucherDao();
        List<Voucher> vouchers = voucherDao.getAllVoucher();

            if (vouchers != null) {
                // Duyệt qua danh sách voucher và cập nhật trạng thái
                for (Voucher voucher : vouchers) {
                    if (voucher.isExpired()) {
                        // Nếu voucher đã hết hạn, cập nhật trạng thái
                        voucher.setStatus(0); // Chẳng hạn, trạng thái 0 là hết hạn
                        voucherDao.updateVoucherStatus(voucher.getId(), 0); // Cập nhật trạng thái vào CSDL
                    }
                }

            session.setAttribute("vouchers", vouchers); // Lưu danh sách voucher sau khi cập nhật trạng thái
            String url = SUCCESS;
            request.getRequestDispatcher(url).forward(request, response);
        } else {
            String url = ERROR;
            request.getRequestDispatcher(url).forward(request, response);
        }
    } catch (SQLException ex) { 
         Logger.getLogger(product.class.getName()).log(Level.SEVERE, null, ex);
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
