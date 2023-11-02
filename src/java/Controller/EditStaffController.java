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
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quang
 */
@WebServlet(name = "EditStaffController", urlPatterns = {"/EditStaffController"})
public class EditStaffController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8"); // Đảm bảo dữ liệu từ request được đọc với mã hóa UTF-8
        String errorMessage;
        String name = request.getParameter("ten");
        String email = request.getParameter("email");
        String password = request.getParameter("matKhau");
        String phone = request.getParameter("soDienThoai");
        String diaChi = request.getParameter("diaChi");
        int id = Integer.parseInt(request.getParameter("acID"));
        int role = Integer.parseInt(request.getParameter("vaiTro"));
        String avatar = request.getParameter("Avatar");

        try {
            byte[] isoBytes = name.getBytes("ISO-8859-1");
            name = new String(isoBytes, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        Account account = new Account();
        account.setId(id);
        account.setName(name);
        account.setEmail(email);
        account.setPhone(phone);
        account.setAddress(diaChi);
        account.setPassword(password);
        account.setRole(role);
        String a = request.getParameter("OAvatar");
        if (avatar == null || avatar.isEmpty()) {

            avatar = request.getParameter("OAvatar");
            account.setProfilePhoto(a);
        } else {
            account.setProfilePhoto("images/" + avatar);
        }

        AccountDao accDao = new AccountDao();
        boolean result = false;
        try {
            result = accDao.updateAccount(account);
        } catch (SQLException ex) {
            Logger.getLogger(EditStaffController.class.getName()).log(Level.SEVERE, null, ex);
        }

        String url = "MainController?action=AllSTAFF";

        if (result) {
            errorMessage = "Cập nhật thành công";
        } else {
            errorMessage = "Cập nhật thất bại";
        }

        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher(url).forward(request, response);
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
