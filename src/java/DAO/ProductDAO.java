/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.ProductDTO;
import DTO.UserDTO;
import DTO.cartDTO;
import ULTILS.DBContext;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ProductDAO implements Serializable {

    private Statement state;
    private Connection con;
    private ResultSet rs;

    public List<ProductDTO> getAllProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT  Name, Brand, Price, Description, StockQuantity, ImageURL ,ProductID FROM dbo.Products ");
                rs = stm.executeQuery();
                while (rs.next()) {
                    ProductDTO acc = new ProductDTO();
                    acc.setName(rs.getString(1)); // Thiết lập thuộc tính Name từ cột đầu tiên trong ResultSet
                    acc.setBrand(rs.getString(2)); // Thiết lập thuộc tính Brand từ cột thứ hai trong ResultSet
                    acc.setPrice(rs.getDouble(3)); // Thiết lập thuộc tính Price từ cột thứ ba trong ResultSet
                    acc.setDescription(rs.getString(4)); // Thiết lập thuộc tính Description từ cột thứ tư trong ResultSet
                    acc.setQuantity(rs.getInt(5)); // Thiết lập thuộc tính StockQuantity từ cột thứ năm trong ResultSet
                    acc.setImg(rs.getString(6)); // Thiết lập thuộc tính ImageURL từ cột thứ sáu trong ResultSet
                    acc.setId(rs.getInt(7));
                    list.add(acc);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public void insertCheckout(cartDAO cart, String name, String address, String phone, UserDTO user, float discountTotal) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();

            if (con != null) {
                // Thêm đơn hàng
                String insertOrderQuery = "INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, recName, recAddress, recPhone, status) "
                        + "VALUES (?, GETDATE(), ?, ?, ?, ?, 1)";

                statement = con.prepareStatement(insertOrderQuery);
                statement.setInt(1, user.getId()); // CustomerID
                statement.setFloat(2, discountTotal); // TotalAmount
                statement.setString(3, name); // recName
                statement.setString(4, address); // recAddress
                statement.setString(5, phone); // recPhone

                int rowsInserted = statement.executeUpdate();

                if (rowsInserted > 0) {
                    System.out.println("Thêm đơn hàng thành công!");
                }

                // Lấy OrderID của đơn hàng mới nhất
                String getOrderIDQuery = "SELECT TOP 1 OrderID FROM Orders ORDER BY OrderID DESC";
                statement = con.prepareStatement(getOrderIDQuery);
                rs = statement.executeQuery();

                int bid = 0; // Khởi tạo OrderID mặc định

                if (rs.next()) {
                    bid = rs.getInt("OrderID");
                }

                // Thêm chi tiết đơn hàng (OrderDetails)
                String insertOrderDetailsQuery = "INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES (?, ?, ?, ?)";
                PreparedStatement insertOrderDetailsStmt = con.prepareStatement(insertOrderDetailsQuery);

                for (cartDTO item : cart.getItems()) {
                    insertOrderDetailsStmt.setInt(1, bid);
                    insertOrderDetailsStmt.setInt(2, item.getProduct().getId());
                    insertOrderDetailsStmt.setInt(3, item.getQuantity());
                    insertOrderDetailsStmt.setDouble(4, item.getProduct().getPrice());

                    insertOrderDetailsStmt.executeUpdate();
                }

                // Cập nhật StockQuantity trong Products
                String updateStockQuery = "UPDATE Products\n"
                        + "SET StockQuantity = StockQuantity - OrderDetails.Quantity\n"
                        + "FROM Products\n"
                        + "INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID\n"
                        + "WHERE Products.ProductID = ?;";
                PreparedStatement updateStockStmt = con.prepareStatement(updateStockQuery);

                for (cartDTO item : cart.getItems()) {
                     updateStockStmt.setInt(1, item.getProduct().getId());

                    updateStockStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi trong quá trình thực hiện đơn hàng: " + e.getMessage());
        } finally {
            // Đóng tất cả tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void addToCart(ProductDTO product, HttpSession session) throws SQLException {
        if (product != null) {
            List<ProductDTO> cart = (List<ProductDTO>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }

            // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
            boolean productExistsInCart = false;
            for (ProductDTO cartItem : cart) {
                if (cartItem.getId() == product.getId()) {
                    // Nếu sản phẩm đã tồn tại trong giỏ hàng, tăng số lượng lên 1
                    cartItem.setQuantity(cartItem.getQuantity() + 1);
                    productExistsInCart = true;
                    break;
                }
            }

            if (!productExistsInCart) {
                // Nếu sản phẩm chưa tồn tại trong giỏ hàng, đặt số lượng là 1
                product.setQuantity(1);
                cart.add(product);
            }

            session.setAttribute("cart", cart);
        }
    }

    public List<ProductDTO> getTop3() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("select top 3  Name, Brand, Price, Description, StockQuantity, ImageURL ,ProductID  from dbo.Products ");
                rs = stm.executeQuery();
                while (rs.next()) {
                    ProductDTO acc = new ProductDTO();
                    acc.setName(rs.getString(1)); // Thiết lập thuộc tính Name từ cột đầu tiên trong ResultSet
                    acc.setBrand(rs.getString(2)); // Thiết lập thuộc tính Brand từ cột thứ hai trong ResultSet
                    acc.setPrice(rs.getDouble(3)); // Thiết lập thuộc tính Price từ cột thứ ba trong ResultSet
                    acc.setDescription(rs.getString(4)); // Thiết lập thuộc tính Description từ cột thứ tư trong ResultSet
                    acc.setQuantity(rs.getInt(5)); // Thiết lập thuộc tính StockQuantity từ cột thứ năm trong ResultSet
                    acc.setImg(rs.getString(6)); // Thiết lập thuộc tính ImageURL từ cột thứ sáu trong ResultSet
                    acc.setId(rs.getInt(7));
                    list.add(acc);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List<ProductDTO> getnotid(int id1) throws SQLException {
        List<ProductDTO> products = new ArrayList<>(); // Khởi tạo danh sách sản phẩm

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT Name, Brand, Price, Description, StockQuantity, ImageURL, ProductID FROM dbo.Products WHERE ProductID  NOT IN (?)");
                stm.setInt(1, id1);

                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO cho mỗi sản phẩm và thiết lập dữ liệu từ ResultSet
                    ProductDTO product = new ProductDTO();
                    product.setName(rs.getString("Name"));
                    product.setBrand(rs.getString("Brand"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setDescription(rs.getString("Description"));
                    product.setQuantity(rs.getInt("StockQuantity"));
                    product.setImg(rs.getString("ImageURL"));
                    product.setId(rs.getInt("ProductID"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng tất cả các tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return products; // Trả về danh sách sản phẩm đã được thiết lập dữ liệu
    }

    public ProductDTO getid(int id) throws SQLException {
        ProductDTO product = null; // Khởi tạo đối tượng ProductDTO

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT Name, Brand, Price, Description, StockQuantity, ImageURL,ProductID FROM dbo.Products WHERE ProductID = ?");
                stm.setInt(1, id);
                rs = stm.executeQuery();

                if (rs.next()) {
                    // Tạo một đối tượng ProductDTO và thiết lập dữ liệu từ ResultSet
                    product = new ProductDTO();
                    product.setName(rs.getString("Name"));
                    product.setBrand(rs.getString("Brand"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setDescription(rs.getString("Description"));
                    product.setQuantity(rs.getInt("StockQuantity"));
                    product.setImg(rs.getString("ImageURL"));
                    product.setId(rs.getInt("ProductID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng tất cả các tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return product; // Trả về đối tượng ProductDTO đã được thiết lập dữ liệu
    }

    public List<ProductDTO> get2id(int id1, int id2) throws SQLException {
        List<ProductDTO> products = new ArrayList<>(); // Khởi tạo danh sách sản phẩm

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT Name, Brand, Price, Description, StockQuantity, ImageURL, ProductID FROM dbo.Products WHERE ProductID IN (?, ?)");
                stm.setInt(1, id1);
                stm.setInt(2, id2);
                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO cho mỗi sản phẩm và thiết lập dữ liệu từ ResultSet
                    ProductDTO product = new ProductDTO();
                    product.setName(rs.getString("Name"));
                    product.setBrand(rs.getString("Brand"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setDescription(rs.getString("Description"));
                    product.setQuantity(rs.getInt("StockQuantity"));
                    product.setImg(rs.getString("ImageURL"));
                    product.setId(rs.getInt("ProductID"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng tất cả các tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return products; // Trả về danh sách sản phẩm đã được thiết lập dữ liệu
    }

    public List<ProductDTO> getnot2id(int id1, int id2) throws SQLException {
        List<ProductDTO> products = new ArrayList<>(); // Khởi tạo danh sách sản phẩm

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT Name, Brand, Price, Description, StockQuantity, ImageURL,ProductID FROM dbo.Products WHERE ProductID  NOT IN (?,?)");
                stm.setInt(1, id1);
                stm.setInt(2, id2);
                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO cho mỗi sản phẩm và thiết lập dữ liệu từ ResultSet
                    ProductDTO product = new ProductDTO();
                    product.setName(rs.getString("Name"));
                    product.setBrand(rs.getString("Brand"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setDescription(rs.getString("Description"));
                    product.setQuantity(rs.getInt("StockQuantity"));
                    product.setImg(rs.getString("ImageURL"));
                    product.setId(rs.getInt("ProductID"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng tất cả các tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return products; // Trả về danh sách sản phẩm đã được thiết lập dữ liệu
    }

    public List<ProductDTO> searchByName(String txtSearch) {
        List<ProductDTO> products = new ArrayList<>();

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            stm = con.prepareStatement("select * from Products\n"
                    + "where [name] like ?");

            stm.setString(1, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setName(rs.getString("Name"));
                product.setBrand(rs.getString("Brand"));
                product.setPrice(rs.getDouble("Price"));
                product.setDescription(rs.getString("Description"));
                product.setQuantity(rs.getInt("StockQuantity"));
                product.setImg(rs.getString("ImageURL"));
                product.setId(rs.getInt("ProductID"));
                products.add(product);
            }
        } catch (Exception e) {
        }
        return products;
    }

    public List<ProductDTO> get3id(int id1, int id2, int id3) throws SQLException {
        List<ProductDTO> products = new ArrayList<>(); // Khởi tạo danh sách sản phẩm

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                // Sử dụng OR để lấy các sản phẩm có một trong ba ID
                stm = con.prepareStatement("SELECT Name, Brand, Price, Description, StockQuantity, ImageURL, ProductID FROM dbo.Products WHERE ProductID IN (?, ?,?)");
                stm.setInt(1, id1);
                stm.setInt(2, id2);
                stm.setInt(3, id3);
                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO cho mỗi sản phẩm và thiết lập dữ liệu từ ResultSet
                    ProductDTO product = new ProductDTO();
                    product.setName(rs.getString("Name"));
                    product.setBrand(rs.getString("Brand"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setDescription(rs.getString("Description"));
                    product.setQuantity(rs.getInt("StockQuantity"));
                    product.setImg(rs.getString("ImageURL"));
                    product.setId(rs.getInt("ProductID"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng tất cả các tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return products; // Trả v
    }

    public List<ProductDTO> search(double id1, double id2) throws SQLException {
        List<ProductDTO> products = new ArrayList<>(); // Khởi tạo danh sách sản phẩm

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                // Sử dụng OR để lấy các sản phẩm có một trong ba ID
                stm = con.prepareStatement("select * from dbo.Products where Price >= ? and Price <= ?");
                stm.setDouble(1, id1);
                stm.setDouble(2, id2);

                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO cho mỗi sản phẩm và thiết lập dữ liệu từ ResultSet
                    ProductDTO product = new ProductDTO();
                    product.setName(rs.getString("Name"));
                    product.setBrand(rs.getString("Brand"));
                    product.setPrice(rs.getDouble("Price"));
                    product.setDescription(rs.getString("Description"));
                    product.setQuantity(rs.getInt("StockQuantity"));
                    product.setImg(rs.getString("ImageURL"));
                    product.setId(rs.getInt("ProductID"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng tất cả các tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return products; // Trả v
    }
}
