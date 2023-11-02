/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CartDao;
import DAO.DeliveryDao;
import DAO.PaymentDao;
import DAO.ProductDao;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hailo
 */
@WebServlet(name = "createPaymentServlet", urlPatterns = {"/createPaymentServlet"})
public class createPaymentServlet extends HttpServlet {

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
        String listCart = request.getParameter("listCartID");
        int accountID = Integer.parseInt(request.getParameter("accID"));
        boolean isInvalid = false;

        ObjectMapper objectMapper = new ObjectMapper();
        DeliveryDao deliDao = new DeliveryDao();
        CartDao cartDao = new CartDao();
        PaymentDao paymentDao = new PaymentDao();
        ProductDao productDao = new ProductDao();

        int voucherId = Integer.parseInt(request.getParameter("voucherID"));
        int total = Integer.parseInt(request.getParameter("total"));
        int status = Integer.parseInt(request.getParameter("status"));
        int cusPhone = Integer.parseInt(request.getParameter("cusPhone"));
        String address = request.getParameter("cusAddress");
        String name = request.getParameter("cusName");
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, 4);
        Date plus4day = calendar.getTime();
        int deliId = deliDao.insertAndGenerateId(plus4day);
        Date dateCreatePayment = new Date();
        List<JsonNode> insertListIfNoError = new ArrayList<>();
        JsonNode listCartNode = objectMapper.readTree(listCart);
        for (JsonNode jsonNode : listCartNode) {
            int proId = jsonNode.get("proId").asInt();
            int quantity = jsonNode.get("quantity").asInt();
            boolean invalidProQuantity = paymentDao.checkQuantityCheckOut(proId, quantity);
            if (invalidProQuantity) {
                isInvalid = true;
                break;
            } else {
                insertListIfNoError.add(jsonNode);
            }
        }
        if (isInvalid) {
            String msg = "Chúng tôi vừa phát hiện số lượng sản phẩm trong cửa hàng ít hơn số lượng 1 số sản phẩm trong thanh toán của bạn."
                    + " Xin lỗi vì sự chậm trễ này và vui lòng thành toán lại";
            String url = "MainController?action=MY_CART&accId=" + accountID;
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("msg", msg);
            jsonObject.addProperty("url", url);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonObject.toString());
        } else {
            int paymentID = paymentDao.insertPayment(dateCreatePayment, accountID, 0, voucherId, total, status, deliId, cusPhone, address, name);
            if (paymentID != -1) {
                for (JsonNode jsonNode : insertListIfNoError) {
                    int proId = jsonNode.get("proId").asInt();
                    int quantity = jsonNode.get("quantity").asInt();
                    int cartDetailID = jsonNode.get("cartDetailId").asInt();
                    cartDao.updateStatusCartDetail(cartDetailID, status, paymentID, accountID);
                    productDao.subQuantityProductById(proId, quantity);
                }
            }
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
