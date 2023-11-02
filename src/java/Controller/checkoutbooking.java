/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.PaymentDao;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "checkoutbooking", urlPatterns = {"/checkoutbooking"})
public class checkoutbooking extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet checkoutbooking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkoutbooking at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    HttpSession session = request.getSession();

    String name = request.getParameter("name").trim();
    String address = request.getParameter("Address").trim();
    String phone = request.getParameter("phone").trim();
    int bookingID = Integer.parseInt(request.getParameter("bookingid").trim());
    int status = Integer.parseInt(request.getParameter("status").trim());
    int discountTotal = Integer.parseInt(request.getParameter("discountTotal").trim());

    PaymentDao paymentDao = new PaymentDao();

    try {
        paymentDao.insertCheckout(name, bookingID, address, phone, discountTotal, status);
 try (PrintWriter out = response.getWriter()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Đơn hàng của bạn đặt thành công!!');");
                out.println("location='" + request.getContextPath() + "/MainController?action=LOAD_HOME_PAGE';");
                out.println("</script>");
            }
    } catch (ClassNotFoundException | SQLException ex) {
        ex.printStackTrace();
        Logger.getLogger(checkoutbooking.class.getName()).log(Level.SEVERE, null, ex);

        // Xử lý lỗi và chuyển hướng đến trang lỗi
        String errorMessage = "Đã xảy ra lỗi trong quá trình xử lý đơn hàng.";
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("/error.jsp").forward(request, response);
    }
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
