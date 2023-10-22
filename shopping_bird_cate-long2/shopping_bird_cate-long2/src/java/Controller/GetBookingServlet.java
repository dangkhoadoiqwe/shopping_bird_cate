/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BookingDao;
import DAO.VietnameseTextEncryption;
import DTO.BookingRequest;
import com.google.gson.JsonObject;
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
@WebServlet(name = "GetBookingServlet", urlPatterns = {"/GetBookingServlet"})
public class GetBookingServlet extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
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
        int bookingId = Integer.parseInt(request.getParameter("id"));
        BookingDao bookingDao = new BookingDao();
        BookingRequest br = bookingDao.getBookingRequestById(bookingId);
        if (br != null) {
            try {
                JsonObject json = new JsonObject();
                json.addProperty("bookingId", br.getBookingRequestId());
                json.addProperty("name", br.getAccount().getName());
                json.addProperty("email", br.getAccount().getEmail());
                json.addProperty("address", br.getCusAddress());
                json.addProperty("phone", br.getCusPhone());
                json.addProperty("material", br.getMaterial().getId());
                json.addProperty("quantity", br.getQuantity());
                json.addProperty("color", VietnameseTextEncryption.encrypt(br.getColor(), "iso-8859-1"));
                json.addProperty("materialCustomName", br.getMaterialCustom());
                json.addProperty("size", br.getSize());
                json.addProperty("birdType", br.getBirdType());
                json.addProperty("status", br.getStatus());
                json.addProperty("subtotal", br.getSubtotal());
                json.addProperty("note", br.getNote());
                json.addProperty("total", br.getTotal());
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                byte[] utf8Json = json.toString().getBytes("UTF-8");
                response.getOutputStream().write(utf8Json);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
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
