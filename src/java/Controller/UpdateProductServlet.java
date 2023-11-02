package Controller;

import DAO.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProductServlet"})
public class UpdateProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UpdateProductServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = new String(request.getParameter("productName").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float price = Float.parseFloat(request.getParameter("price"));
            String size = request.getParameter("size");
            String image = request.getParameter("image");
            String manufacturer = request.getParameter("manufacturer");
            String color = new String(request.getParameter("color").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            String material = new String(request.getParameter("material").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            String description = new String(request.getParameter("description").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            String madeIn = new String(request.getParameter("madeIn").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            String a = request.getParameter("newImage");
             ProductDao productDAO = new ProductDao();
              boolean updated = false;
            if (a == null || a.isEmpty()) {
                image = request.getParameter("image");
               updated = productDAO.updateProduct(productId, productName, categoryId, quantity, price, size, color, material,  image, manufacturer, madeIn, description);
             
            } else {
                   image = request.getParameter("newImage");
                    updated = productDAO.updateProduct(productId, productName, categoryId, quantity, price, size, color, material, "images/" + image, manufacturer, madeIn, description);
            }
        
           
               
         
                

            if (updated) {
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Bạn đã cập nhật thành công!!');");
                out.println("location='" + request.getContextPath() + "/MainController?action=pro';");
                out.println("</script>");
            } else {
                handleUpdateFailure(response);
            }
        } catch (NumberFormatException | NullPointerException e) {
            handleUpdateFailure(response);
        }
    }

    private void handleUpdateFailure(HttpServletResponse response) throws IOException {
        response.sendRedirect("error.jsp");
    }
}
