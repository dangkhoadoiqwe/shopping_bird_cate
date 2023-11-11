/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BookingDao;
import DTO.BookingRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quang
 */
@WebServlet(name = "searchBookingManager", urlPatterns = {"/searchBookingManager"})
public class searchBookingManager extends HttpServlet {

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
            out.println("<title>Servlet searchBookingManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchBookingManager at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String startTimeStr = request.getParameter("startTime");
            String endTimeStr = request.getParameter("endTime");

            if (startTimeStr == null || startTimeStr.isEmpty() || endTimeStr == null || endTimeStr.isEmpty()) {
                String mess = "Vui lòng nhập đầy đủ thời gian";
                request.setAttribute("message", mess);
                request.getRequestDispatcher("allBoking.jsp").forward(request, response);
               
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date parsedStartDate = sdf.parse(startTimeStr + " 00:00:00");
            java.util.Date parsedEndDate = sdf.parse(endTimeStr + " 23:59:59");

            Timestamp startTime = new Timestamp(parsedStartDate.getTime());
            Timestamp endTime = new Timestamp(parsedEndDate.getTime());

            BookingDao bookingDao = new BookingDao();
            List<BookingRequest> searchResults = bookingDao.getBookingManagersByTimeRangeAndAccount(startTime, endTime);

            if (searchResults.isEmpty()) {
                String mess = "Không có đơn trong khoảng thời gian này";
                request.setAttribute("message", mess);
            }

            request.setAttribute("listBooking", searchResults);
            request.getRequestDispatcher("allBoking.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            String mess = "Có lỗi xảy ra trong quá trình xử lý";
            request.setAttribute("message", mess);
            request.getRequestDispatcher("allBoking.jsp").forward(request, response);
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
