package Controller;

import DAO.ProductDao;
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

@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProductServlet"})
public class UpdateProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UpdateProductServlet() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateVoucherServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateVoucherServlet at " + request.getContextPath() + "</h1>");
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = new String(request.getParameter("productName").getBytes("iso-8859-1"), "utf-8");
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float price = Float.parseFloat(request.getParameter("price"));
            String size = request.getParameter("size");
            String image = request.getParameter("image");
            String manufacturer = request.getParameter("manufacturer");
            String color = new String(request.getParameter("color").getBytes("iso-8859-1"), "utf-8");
            String material = new String(request.getParameter("material").getBytes("iso-8859-1"), "utf-8");
            String description = new String(request.getParameter("description").getBytes("iso-8859-1"), "utf-8");

            String madeIn = new String(request.getParameter("madeIn").getBytes("iso-8859-1"), "utf-8");

            ProductDao productDAO = new ProductDao();

            boolean updated = productDAO.updateProduct(productId, productName, categoryId, quantity, price, size, color, material, image, manufacturer, madeIn, description);

            if (updated) {
                response.sendRedirect("MainController?action=pro");
            } else {
                handleUpdateFailure(response);
            }
        } catch (NumberFormatException | NullPointerException e) {

        }
    }

    private void handleUpdateFailure(HttpServletResponse response) throws IOException {
        response.sendRedirect("error.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
