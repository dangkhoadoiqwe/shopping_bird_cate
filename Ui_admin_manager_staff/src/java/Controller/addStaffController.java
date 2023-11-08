/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AccountDao;
import DTO.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quang
 */
@WebServlet(name = "addStaffController", urlPatterns = {"/addStaffController"})
public class addStaffController extends HttpServlet {

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

        String url = "";
        String errorMessage = "";

        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            int role = Integer.parseInt(request.getParameter("role"));
            String address = request.getParameter("address");

            AccountDao dao = new AccountDao();
            if (email == null || password == null || name == null || phone == null || address == null) {
                errorMessage = "Các trường không được để trống";
            } else if (dao.checkDuplicate(email)) {
                errorMessage = "Email đã tồn tại";
            } else if (password.length() < 4) {
                errorMessage = "Mật khẩu phải có ít nhất 8 ký tự";
            } else if (name.length() < 3) {
                errorMessage = "Tên phải có ít nhất 3 ký tự";
            } else if (!Pattern.matches("(0)+([0-9]{10})\\b", phone)) {
                errorMessage = "Số điện thoại không hợp lệ";
            } else {
                Account acc = new Account();
                acc.setEmail(email);
                acc.setPassword(password);
                acc.setName(name);
                acc.setRole(role);
                acc.setPhone(phone);
                acc.setAddress(address);

                boolean checkCreate = dao.insertAccount(acc);

                if (checkCreate) {
                    errorMessage = "Thêm nhân viên thành công";
                } else {
                    errorMessage = "Lỗi khi tạo tài khoản";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "Đã xảy ra lỗi không mong muốn";
        } finally {
            if (!errorMessage.isEmpty()) {
                request.setAttribute("errorMessage", errorMessage);
            }
            request.getRequestDispatcher("addstaff.jsp").forward(request, response);
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
