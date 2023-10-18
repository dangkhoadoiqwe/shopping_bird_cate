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
            String size = request.getParameter("size");
            String birdType = request.getParameter("birdType");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int material = Integer.parseInt(request.getParameter("material"));
            String materialCustom = "";
            String address = request.getParameter("address");
            String image = request.getParameter("image");
            String subtotal = request.getParameter("subtotal");
            int status = Integer.parseInt(request.getParameter("status"));

            // Xử lý các trường tùy chọn 'Khác' nếu được chọn
            if ("Khác".equals(color)) {
                color = new String(request.getParameter("customColor").getBytes("ISO-8859-1"), "UTF-8");
            }
            if ("Khác".equals(size)) {
                size = new String(request.getParameter("customSize").getBytes("ISO-8859-1"), "UTF-8");
            }
            if ("Khác".equals(birdType)) {
                birdType = new String(request.getParameter("customBirdType").getBytes("ISO-8859-1"), "UTF-8");
            }
            if (material == 4) {
                materialCustom = new String(request.getParameter("customMaterial").getBytes("ISO-8859-1"), "UTF-8");
            }

            // Xử lý lỗi trong trường hợp số liệu không hợp lệ
            if (id < 0 || quantity < 0 || material < 0 || status < 0) {
                throw new NumberFormatException("Số liệu không hợp lệ");
            }
//            try {
//                byte[] isoBytes = color.getBytes("ISO-8859-1");
//                color = new String(isoBytes, "UTF-8");
//                byte[] si = size.getBytes("ISO-8859-1");
//                size = new String(isoBytes, "UTF-8");
//                byte[] isoBy = birdType.getBytes("ISO-8859-1");
//                birdType = new String(isoBytes, "UTF-8");
//
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
            // Gọi đối tượng DAO để thực hiện thêm đơn đặt hàng
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
        } catch (IOException | NumberFormatException e) {
            // Xử lý lỗi ở đây, ví dụ: ghi log hoặc thông báo lỗi
            e.printStackTrace();
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
