/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDao;
import DAO.VoucherDao;
import DAO.cartDAO;
import DTO.Account;
import DTO.Product;
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
@WebServlet(name = "checkout", urlPatterns = {"/checkout"})
public class checkout extends HttpServlet {

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
            out.println("<title>Servlet checkout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkout at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        try {

            String code = request.getParameter("code");
            String id = request.getParameter("accid");
            VoucherDao dao = new VoucherDao();
            int discount = dao.getCoupon(code, id);
            Object object = session.getAttribute("account");
            cartDAO cart = (cartDAO) session.getAttribute("cart");
            Account user = (Account) object;
            if (cart == null ){
                  request.getRequestDispatcher("homePage.jsp").forward(request, response);
            } else {
            if (discount == 0) {
                float discountTotal = cart.getTotalBill();
                System.out.println(cart.getTotalBill());
                request.setAttribute("discountTotal", discountTotal);
                request.setAttribute("discount", 0);

            } else {
                float discountTotal = cart.getTotalBill() * (100 - discount) / 100;
                request.setAttribute("discount", discount);

                request.setAttribute("discountTotal", discountTotal);
            }
            }
            request.getRequestDispatcher("checkout.jsp").forward(request, response);

        } catch (IOException | NumberFormatException | ServletException e) {
        } catch (SQLException ex) {
            Logger.getLogger(checkout.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            Object object = session.getAttribute("account");
            Object object1 = session.getAttribute("cart");
            Account user = (Account) object;
            cartDAO cart = (cartDAO) object1;
            ProductDao dao = new ProductDao();
            String discountTotalStr = request.getParameter("discountTotal");
            float discountTotal = 0.0f; // Giá trị mặc định hoặc giá trị bất kỳ nếu không thành công

            try {
                discountTotal = Float.parseFloat(discountTotalStr);
                System.out.println(discountTotal);
            } catch (NumberFormatException e) {
                // Xử lý ngoại lệ nếu chuỗi không thể chuyển đổi thành float
                e.printStackTrace();
            }

// Bây giờ bạn có thể sử dụng biến discountTotal là một số thực (float)
            String Name = request.getParameter("Name").trim();
            String Address = request.getParameter("Address").trim();
            String Phone = request.getParameter("Phone").trim();
            String note = request.getParameter("note").trim();
            dao.insertCheckout(cart, Name, Address, Phone, user, discountTotal, note);
            cart.removeAllItems();
            try (PrintWriter out = response.getWriter()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Đơn hàng của bạn đặt thành công!!');");
                out.println("location='" + request.getContextPath() + "/checkout.jsp';");
                out.println("</script>");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(checkout.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(checkout.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
