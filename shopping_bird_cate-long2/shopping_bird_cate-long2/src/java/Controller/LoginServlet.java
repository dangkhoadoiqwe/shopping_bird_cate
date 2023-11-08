/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDao;
import DTO.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hailo
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String url = "";
            HttpSession session = request.getSession();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String webUrl = request.getParameter("webUrl");
            System.out.println(webUrl);
            AccountDao accDao = new AccountDao();
            Account account = accDao.getAccount(username, password);
            if (account != null) {
                if (account.getStatus() == 0) {
                    request.setAttribute("msg", "Tài khoản của bạn đã bị khóa!!!!");
                    url = "homePage.jsp";
                } else {
                    session.setAttribute("account", account);
                    switch (account.getRole()) {
                        case 4:
                            url = "MainController?action=DASH";
                            break;
                        case 2:
                            url = "MainController?action=MANAGE_ACCOUNT";
                            break;
                        case 1:
                            if (webUrl.equalsIgnoreCase("")) {
                                System.out.println("aaaaa");
                                url = "homePage.jsp";
                            } else {
                                url = webUrl;
                            }
                            System.out.println(url);
                            break;
                        case 3:
                            url = "ManageOders";
                            break;
                    }
                }
            } else {
                request.setAttribute("msg", "Đăng nhập thất bại");
                url = "homePage.jsp";
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (IOException | ServletException e) {
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
