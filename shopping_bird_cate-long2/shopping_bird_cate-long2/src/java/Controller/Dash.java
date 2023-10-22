/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PaymentDao;
import DTO.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quang
 */
@WebServlet(name = "Dash", urlPatterns = {"/Dash"})
public class Dash extends HttpServlet {

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
            PaymentDao pay = new PaymentDao();
            int countOrder = pay.countOrder();
            request.getSession().setAttribute("countOrder", countOrder);
            List<Payment> paymentSummaries = pay.getPaymentSummaryLast7Days();
            Timestamp currentDateTime = pay.getCurrentDateTime();

            // Đặt giá trị ngày và giờ hiện tại vào thuộc tính request
            request.setAttribute("currentDateTime", currentDateTime);

            List<Payment> paymentmonthSummaries = pay.getPaymentsForLast7Months();
            System.out.println(paymentSummaries);
            double sum = pay.SumPayment();
            request.getSession().setAttribute("Sum", sum);
            int countBooking = pay.countBooking();
            request.getSession().setAttribute("CountCustom", countBooking);
            request.getSession().setAttribute("paymentmonthSummaries", paymentmonthSummaries);
            request.setAttribute("paymentSummaries", paymentSummaries);
            request.getRequestDispatcher("homeManager.jsp").forward(request, response);
        } catch (Exception ex) {
            System.out.println("Error at countAccountController: " + ex.getMessage());
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
