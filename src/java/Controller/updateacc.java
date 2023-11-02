/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDao;
 
import DTO.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "updateacc", urlPatterns = {"/updateacc"})
public class updateacc extends HttpServlet {

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
            out.println("<title>Servlet updateacc</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateacc at " + request.getContextPath() + "</h1>");
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
        // Lấy thông tin tài khoản cần cập nhật từ request
         response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
          String name = request.getParameter("name");
           String profilePhoto = request.getParameter("profilePhoto");
        String email = request.getParameter("email");
        
        String phone =  request.getParameter("phone");
        
        String address = request.getParameter("address");

        // Tạo đối tượng Account để lưu thông tin cập nhật
        Account account = new Account();
        account.setId(id);
        account.setName(name);
        account.setProfilePhoto(profilePhoto);
        account.setEmail(email);
        account.setPhone(phone);
        account.setAddress(address);

        // Gọi phương thức cập nhật thông tin tài khoản trong AccountDAO
        AccountDao accountDAO = new AccountDao();
        try {
            int rowsAffected = accountDAO.updateProfile(account);
            if (rowsAffected > 0) {
                // Cập nhật thành công, có thể thực hiện các hành động sau
              PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Tài khoản  của bạn đã được cập nhật  thành công!!');");
        out.println("location='" + request.getContextPath() + "/MainController?action=LOAD_HOME_PAGE';");
        out.println("</script>");
            } else {
                // Cập nhật không thành công, có thể thông báo lỗi hoặc thực hiện hành động khác
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ SQL nếu có
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
