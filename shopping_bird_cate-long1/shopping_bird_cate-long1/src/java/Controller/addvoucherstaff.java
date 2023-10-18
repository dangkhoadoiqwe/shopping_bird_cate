/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.VoucherDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.eclipse.jdt.internal.compiler.parser.Parser.name;

/**
 *
 * @author Admin
 */
@WebServlet(name = "addvoucherstaff", urlPatterns = {"/addvoucherstaff"})
public class addvoucherstaff extends HttpServlet {

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
            out.println("<title>Servlet addvoucherstaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addvoucherstaff at " + request.getContextPath() + "</h1>");
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
    try {
        // Kiểm tra dữ liệu đầu vào
        String voucherName = request.getParameter("voucherName");
        String dateStartStr = request.getParameter("dateStart");
        String dateEndStr = request.getParameter("dateEnd");
        String valueStr = request.getParameter("value");

        if (voucherName == null || dateStartStr == null || dateEndStr == null || valueStr == null) {
            // Dữ liệu không hợp lệ, xử lý hoặc trả về thông báo lỗi
            response.sendRedirect("error.jsp");
            return;
        }
        try {
        byte[] isoBytes = voucherName.getBytes("ISO-8859-1"); 
        voucherName = new String(isoBytes, "UTF-8");
    } catch (UnsupportedEncodingException e) {
        e.printStackTrace();
    }
        int accountID = 1;
        Date dateStart = Date.valueOf(dateStartStr);
        Date dateEnd = Date.valueOf(dateEndStr);
        int voucherStatus = 1;
        int value = Integer.parseInt(valueStr);

        VoucherDao voucherDAO = new VoucherDao();
        boolean success = voucherDAO.insertVoucher(voucherName, dateStart, dateEnd, value);

        if (success) {
            // Điều hướng hoặc hiển thị thông báo thành công
            response.sendRedirect("MainController?action=vu");
        } else {
            // Hiển thị thông báo lỗi
            response.sendRedirect("error.jsp");
        }
    } catch (Exception e) {
        // Xử lý ngoại lệ và hiển thị thông báo lỗi
        e.printStackTrace();
        response.sendRedirect("error.jsp");
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
