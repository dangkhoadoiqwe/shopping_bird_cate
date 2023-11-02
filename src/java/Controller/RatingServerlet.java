/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.FeedbackDao;
import UTILS.DBContext;
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

/**
 *
 * @author Admin
 */
@WebServlet(name = "RatingServerlet", urlPatterns = {"/RatingServerlet"})
public class RatingServerlet extends HttpServlet {

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
            out.println("<title>Servlet RatingServerlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RatingServerlet at " + request.getContextPath() + "</h1>");
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
          // Lấy các tham số từ yêu cầu HTTP
            response.setContentType("text/html;charset=UTF-8");
          int productID = Integer.parseInt(request.getParameter("productID"));
          int accountID = Integer.parseInt(request.getParameter("accountID"));
          int rating = Integer.parseInt(request.getParameter("rating"));
          String comment = request.getParameter("rating");
           
           int deliii = Integer.parseInt(request.getParameter("deliID"));
          // Thực hiện thêm dữ liệu rating và phản hồi vào cơ sở dữ liệu bằng DAO
          FeedbackDao ratingDAO = new FeedbackDao();
        try {
     
            ratingDAO.addRatingAndFeedback(productID, accountID, rating, comment,deliii);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RatingServerlet.class.getName()).log(Level.SEVERE, null, ex);
        }
          try (PrintWriter out = response.getWriter()) {
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Đơn hàng của bạn đánh giá thành công!!');");
              out.println("location='" + request.getContextPath() + "/MainController?action=LOAD_HOME_PAGE';");
              out.println("</script>");
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
