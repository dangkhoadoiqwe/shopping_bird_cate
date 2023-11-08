/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDao;
import DTO.CategoryDTO;
import DTO.Product;
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

/**
 *
 * @author Admin
 */
@WebServlet(name = "addproductstaff", urlPatterns = {"/addproductstaff"})
public class addproductstaff extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "MainController?action=ManagePro";

   private static final long serialVersionUID = 1L;

    public addproductstaff() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Nhận các giá trị từ yêu cầu HTTP
        request.setCharacterEncoding("UTF-8"); 
        String productName = request.getParameter("productName");
        int categoriesID = Integer.parseInt(request.getParameter("categoriesID")); // Chuyển đổi giá trị danh mục thành số nguyên
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float price = Float.parseFloat(request.getParameter("price"));
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String material = request.getParameter("material");
         
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        String manufacturer = request.getParameter("manufacturer");
        String madeIn = request.getParameter("madeIn");

        Product product = new Product();
        CategoryDTO category = new CategoryDTO();
        category.setCategoryId(categoriesID); // Đặt ID danh mục
        product.setCate(category);
        product.setName(productName);
        product.setQuantity(quantity);
        product.setPrice(price);
        product.setSize(size);
        product.setColor(color);
        product.setMaterial(material);
        product.setUpdateId(1);
        product.setDescription(description);
        product.setImage("images/" + image);
        product.setManufacturer(manufacturer);
        product.setMadeIn(madeIn);

        ProductDao productDAO = new ProductDao();

        try {
            // Thêm sản phẩm vào cơ sở dữ liệu
            int result = productDAO.insertProduct(product);

            if (result > 0) {
                // Thêm thành công, có thể thực hiện các hành động khác (ví dụ: chuyển hướng đến trang thành công)
                response.sendRedirect("MainController?action=pro");
            } else {
                // Thất bại, có thể thực hiện xử lý lỗi (ví dụ: chuyển hướng đến trang lỗi)
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý lỗi (ví dụ: chuyển hướng đến trang lỗi)
            response.sendRedirect("error.jsp");
        }
    }
}
     

