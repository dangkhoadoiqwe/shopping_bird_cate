/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DTO.listToPayment;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
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
        String listProductJson = request.getParameter("listProduct");
        System.out.println(listProductJson);
        String voucherJson = request.getParameter("voucher");
        System.out.println(voucherJson);
        ObjectMapper objectMapper = new ObjectMapper();
        int voucherId = -1;
        try {
            JsonNode voucherNode = objectMapper.readTree(voucherJson);
            if (voucherNode.has("voucherID")) {
                voucherId = voucherNode.get("voucherID").asInt();
            }
        } catch (JsonProcessingException e) {
        }
        listToPayment payment = new listToPayment();
        try {
            JsonNode productsNode = objectMapper.readTree(listProductJson);
            if (productsNode.isArray()) {
                for (JsonNode productNode : productsNode) {
                    listToPayment.product product = payment.new product();
                    product.setProId(productNode.get("proId").asInt());
                    product.setCartDetailId(productNode.get("cartDetailId").asInt());
                    product.setProPrice(productNode.get("proPrice").asInt());
                    product.setQuantity(productNode.get("quantity").asInt());
                    payment.getProducts().add(product);
                }
            }
        } catch (JsonProcessingException e) {
        }
        HttpSession session = request.getSession();
        payment.setVoucherId(voucherId);
        session.setAttribute("payment", payment);
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
