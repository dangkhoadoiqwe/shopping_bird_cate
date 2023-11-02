/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BookingDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hailo
 */
@WebServlet(name = "UpdateBookingServlet", urlPatterns = {"/UpdateBookingServlet"})
public class UpdateBookingServlet extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("bookingId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("selectColor");
        if (color.equalsIgnoreCase("Khác")) {
            color = request.getParameter("customColor");
        }
        String size = request.getParameter("selectSize");
        if (size.equalsIgnoreCase("Khác")) {
            size = request.getParameter("customSize");
        }
        String birdType = request.getParameter("selectBirdType");
        if (birdType.equalsIgnoreCase("Khác")) {
            birdType = request.getParameter("customBirdType");
        }
        int materitalId = Integer.parseInt(request.getParameter("selectMaterial"));
        String materialCustomName = "";
        if (materitalId == 4) {
            materialCustomName = request.getParameter("materialCustomName");
        }
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        String note = request.getParameter("note");
        int status = Integer.parseInt(request.getParameter("status"));
        String subtotal = request.getParameter("subtotal");
        float total = Float.parseFloat(request.getParameter("total"));
        BookingDao bookingDao = new BookingDao();
        boolean check = bookingDao.updateBooking(
                id, quantity, color, size, birdType, materitalId, materialCustomName, address, image, note, status, subtotal, total);
        String msg;
        if (check) {
               msg = "Đơn hàng đã cập nhật!!!";

            // Sử dụng đối tượng PrintWriter để in mã JavaScript
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + msg + "');");
            out.println("location='" + request.getContextPath() + "/MainController?action=ALLBOOKING';");
            out.println("</script>");
        } else {
            msg = "Update Fail";
        }
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("MainController?action=ALLBOOKING").forward(request, response);
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
