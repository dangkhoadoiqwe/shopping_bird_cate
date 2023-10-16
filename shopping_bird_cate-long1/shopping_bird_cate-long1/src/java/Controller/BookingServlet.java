/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.BookingDao;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hailo
 */
@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            int id = Integer.parseInt(request.getParameter("cusId"));
            int phone = Integer.parseInt(request.getParameter("phone"));
            String color = request.getParameter("color");
            System.out.println(color);
            if (color.equalsIgnoreCase("Khác")) {
                color = new String(request.getParameter("customColor").getBytes("iso-8859-1"), "utf-8");
            }
            String size = new String(request.getParameter("size").getBytes("iso-8859-1"), "utf-8");
            if (size.equalsIgnoreCase("Khác")) {
                size = new String(request.getParameter("customSize").getBytes("iso-8859-1"), "utf-8");
            }
            String birdType = new String(request.getParameter("birdType").getBytes("iso-8859-1"), "utf-8");
            if (birdType.equalsIgnoreCase("Khác")) {
                birdType = new String(request.getParameter("customBirdType").getBytes("iso-8859-1"), "utf-8");
            }
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int material = Integer.parseInt(request.getParameter("material"));
            String materialCustom = "";
            if (material == 4) {
                materialCustom = new String(request.getParameter("customMaterial").getBytes("iso-8859-1"), "utf-8");
            }
            String address = new String(request.getParameter("address").getBytes("iso-8859-1"), "utf-8");
            String image = new String(request.getParameter("image").getBytes("iso-8859-1"), "utf-8");
            String subtotal = new String(request.getParameter("subtotal").getBytes("iso-8859-1"), "utf-8");
            int status = Integer.parseInt(request.getParameter("status"));
            BookingDao bookingDao = new BookingDao();
            boolean check = bookingDao.addBookingRequest(id, birdType, color, size, material, materialCustom, image, quantity, status, subtotal, 0, new Date(), "", address, phone);
            String msg;
            if (check) {
                msg = "Đơn của bạn đã được gửi.";
            } else {
                msg = "Có lỗi xảy ra. Xin bạn vui lòng thử lại.";
            }
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("bookingCageFrom.jsp").forward(request, response);
        } catch (IOException | NumberFormatException | ServletException e) {
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
        request.setCharacterEncoding("utf-8");
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
        request.setCharacterEncoding("utf-8");
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
