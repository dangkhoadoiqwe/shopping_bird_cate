/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDao;
import DTO.Account;
import java.io.IOException;
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
 * @author Admin
 */
@WebServlet(name = "RegisterController1", urlPatterns = { "/RegisterController1" })
public class RegisterController1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   response.setContentType("text/html;charset=UTF-8");
         String url = "error.jsp";
        boolean check = true;
        AccountDao dao = new AccountDao();
        try {
            String name = request.getParameter("regisname");
            String email = request.getParameter("regismail");
            String pass = request.getParameter("regispass");
            String phone = request.getParameter("regisphone");
            String repass = request.getParameter("regisrepass");
            if(!name.isEmpty()&& !email.isEmpty() && !pass.isEmpty() && !phone.isEmpty() && !repass.isEmpty()){
                return;
            }
            if (!repass.equals(pass)) {
                check = false;
            }
            if (dao.checkDuplicate(email)) {
                check = false;
            }
            if (!email.matches("^[A-Za-z0-9+_.-]{5,}@[A-Za-z0-9.-]{3,}$")) {
                check = false;
            }

            if (!phone.trim().matches("^(\\+84|0)[0-9]{9,10}$")) {
                check = false;
            }
            Account account = new Account(email, pass, name, phone);
           
            
            boolean registrationSuccessful = dao.registerAccount(account);

            if (registrationSuccessful == true) {
                // Registration successful, redirect to a success page
                response.sendRedirect("homePage.jsp");
            } else {
                // Registration failed, redirect to an error page
                response.sendRedirect("homePage.jsp");
            }

        } catch (NumberFormatException e) {
            log("Error at CreateControler: " + e.toString());
        } catch (SQLException ex) {
            Logger.getLogger(RegisterController1.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
          
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
