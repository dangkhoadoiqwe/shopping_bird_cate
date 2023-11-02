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
import javax.jws.WebService;
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
@WebServlet(name = "UpdatePasswordController", urlPatterns = {"/UpdatePasswordController"})
public class UpdatePasswordController extends HttpServlet {

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
            out.println("<title>Servlet UpdatePasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePasswordController at " + request.getContextPath() + "</h1>");
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
        String url = "error.jsp";
        String oldpass = request.getParameter("pass");
        String newpass = request.getParameter("new-pass");
        String renewpass = request.getParameter("renew-pass");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account.getRole() == 1) {
            url = "profileuser.jsp";
        }
        if (account.getRole() == 3) {
            url = "profileStaff.jsp";
        }
        if (oldpass.equals(account.getPassword().trim())) {
            if (newpass.equals(renewpass)) {
                AccountDao accountDAO = new AccountDao();
                account.setPassword(newpass);
                session.setAttribute("account", account);
                try {
                    int rowsAffected = accountDAO.updatePassword(newpass, account.getId());
                    if (rowsAffected > 0) {
                        if (account.getRole() == 3) {
                            url = "profileStaff.jsp";
                        }
                        // Cập nhật thành công, có thể thực hiện các hành động sau
                        if (account.getRole() == 1) {
                            url = "profileuser.jsp";
                        }

                    } else {
                        // Cập nhật không thành công, có thể thông báo lỗi hoặc thực hiện hành động khác
                        response.sendRedirect("error.jsp");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    // Xử lý ngoại lệ SQL nếu có

                }
            } else {
                request.setAttribute("errorMessage1", "Mật khẩu nhập lại không trùng với mật khẩu mới.");

            }
        } else {

            request.setAttribute("errorMessage", "Mật khẩu cũ không đúng.");

        }

        // Tạo đối tượng Account để lưu thông tin cập nhật
        // Gọi phương thức cập nhật thông tin tài khoản trong AccountDAO
        request.getRequestDispatcher(url).forward(request, response);
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
