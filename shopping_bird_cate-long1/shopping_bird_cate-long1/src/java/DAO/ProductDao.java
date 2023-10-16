/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Account;
import DTO.CategoryDTO;
import DTO.Product;
import DTO.cartDTO;
import UTILS.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hailo
 */
public class ProductDao {

  public List<Product> getProductsByCartID(int cartID) throws SQLException {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    List<Product> products = new ArrayList<>();

    try {
        conn = DBContext.getConnection(); // Khởi tạo kết nối đến cơ sở dữ liệu
        String sql = "SELECT  p.[productID],p.productName, p.image, p.quantity, p.price "
            + "FROM Product p "
            + "INNER JOIN CartDetail cd ON p.productID = cd.productID "
            + "WHERE cd.cartID = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, cartID);
        rs = stmt.executeQuery();

        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("productID"));
            product.setName(rs.getString("productName"));
            product.setQuantity(rs.getInt("quantity"));
            product.setPrice(rs.getFloat("price"));
            product.setImage(rs.getString("image"));
            products.add(product);
        }
    } catch (ClassNotFoundException ex) {
          Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
      } finally {
        // Đảm bảo tài nguyên được đóng sau khi sử dụng
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    return products;
}


    public List<Product> searchProductsByCategoryAndName(int categoryID, String productName) {
    List<Product> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                String query = "SELECT p.productID, p.productName, c.categoriesName, p.quantity, p.price, p.size, p.color, p.material, p.createTime, p.description, p.image, p.manufacturer, p.madeIn \n"
                        + "FROM Product p \n"
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID \n"
                        + "WHERE c.categoriesID = ? AND p.productName LIKE ?;";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, categoryID);
                stmt.setString(2, "%" + productName + "%"); // Sử dụng LIKE để tìm kiếm sản phẩm theo tên tương tự

                rs = stmt.executeQuery();

                while (rs.next()) {
                    Product product = new Product();
                    CategoryDTO a = new CategoryDTO();
                    product.setId(rs.getInt("productID"));
                    product.setName(rs.getString("productName"));
                    a.setCategoryName(rs.getString("categoriesName"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getFloat("price"));
                    product.setSize(rs.getString("size"));
                    product.setColor(rs.getString("color"));
                    product.setMaterial(rs.getString("material"));
                    product.setCreateTime(rs.getDate("createTime"));
                    product.setDescription(rs.getString("description"));
                    product.setImage(rs.getString("image"));
                    product.setManufacturer(rs.getString("manufacturer"));
                    product.setMadeIn(rs.getString("madeIn"));

                productList.add(product);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return productList;
}


    public int insertProduct(Product product) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        int result = 0;

        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                String insertQuery = "INSERT INTO Product ([productName], [categoriesID], [quantity], [price], [size], [color], [material], [createTime], [updateID], [description], [image], [productStatus], [manufacturer], [madeIn]) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE(), ?, ?, ?, 1, ?, ?)";
                stm = conn.prepareStatement(insertQuery);
                stm.setString(1, product.getName());
                stm.setInt(2, product.getCate().getCategoryId()); // Thay bằng ID danh mục thực tế
                stm.setInt(3, product.getQuantity());
                stm.setFloat(4, product.getPrice());
                stm.setString(5, product.getSize());
                stm.setString(6, product.getColor());
                stm.setString(7, product.getMaterial());
                stm.setInt(8, product.getUpdateId()); // Thay bằng ID cập nhật thực tế
                stm.setString(9, product.getDescription());
                stm.setString(10, product.getImage());
                stm.setString(11, product.getManufacturer());
                stm.setString(12, product.getMadeIn());
                result = stm.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    public List<Product> get3id(int id1, int id2, int id3) throws SQLException {
        List<Product> products = new ArrayList<>(); // Khởi tạo danh sách sản phẩm

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                // Sử dụng OR để lấy các sản phẩm có một trong ba ID
                stm = con.prepareStatement("select p.productID, p.productName,\n"
                        + "    c.categoriesName,\n"
                        + "    p.quantity,\n"
                        + "    p.price,\n"
                        + "    p.size,\n"
                        + "    p.color,\n"
                        + "    p.material,\n"
                        + "    p.createTime,\n"
                        + "    p.description,\n"
                        + "    p.image,\n"
                        + "    p.manufacturer,\n"
                        + "    p.madeIn\n"
                        + "FROM dbo.Product p\n"
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID WHERE ProductID IN (?, ?,?)");
                stm.setInt(1, id1);
                stm.setInt(2, id2);
                stm.setInt(3, id3);
                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO cho mỗi sản phẩm và thiết lập dữ liệu từ ResultSet
                    Product product = new Product();
                    CategoryDTO a = new CategoryDTO();
                    product.setId(rs.getInt("productID"));
                    product.setName(rs.getString("productName"));
                    a.setCategoryName(rs.getString("categoriesName"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getFloat("price"));
                    product.setSize(rs.getString("size"));
                    product.setColor(rs.getString("color"));
                    product.setMaterial(rs.getString("material"));
                    product.setCreateTime(rs.getDate("createTime"));
                    product.setDescription(rs.getString("description"));
                    product.setImage(rs.getString("image"));
                    product.setManufacturer(rs.getString("manufacturer"));
                    product.setMadeIn(rs.getString("madeIn"));
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

    public List<Product> getnotid(int id1) throws SQLException {
        List<Product> products = new ArrayList<>(); // Khởi tạo danh sách sản phẩm

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT  p.productID, \n"
                        + "    p.productName,\n"
                        + "    c.categoriesName,\n"
                        + "    p.quantity,\n"
                        + "    p.price,\n"
                        + "    p.size,\n"
                        + "    p.color,\n"
                        + "    p.material,\n"
                        + "    p.createTime,\n"
                        + "    p.description,\n"
                        + "    p.image,\n"
                        + "    p.manufacturer,\n"
                        + "    p.madeIn\n"
                        + "FROM dbo.Product p\n"
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID WHERE ProductID  NOT IN (?)");
                stm.setInt(1, id1);

                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO cho mỗi sản phẩm và thiết lập dữ liệu từ ResultSet
                    Product product = new Product();
                    CategoryDTO a = new CategoryDTO();
                    product.setId(rs.getInt("productID"));
                    product.setName(rs.getString("productName"));
                    a.setCategoryName(rs.getString("categoriesName"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getFloat("price"));
                    product.setSize(rs.getString("size"));
                    product.setColor(rs.getString("color"));
                    product.setMaterial(rs.getString("material"));
                    product.setCreateTime(rs.getDate("createTime"));
                    product.setDescription(rs.getString("description"));
                    product.setImage(rs.getString("image"));
                    product.setManufacturer(rs.getString("manufacturer"));
                    product.setMadeIn(rs.getString("madeIn"));
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
        return products;
    }

    public List<Product> getnot2id(int id1, int id2) throws SQLException {
        List<Product> products = new ArrayList<>(); // Khởi tạo danh sách sản phẩm

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("select p.productID, p.productName,\n"
                        + "    c.categoriesName,\n"
                        + "    p.quantity,\n"
                        + "    p.price,\n"
                        + "    p.size,\n"
                        + "    p.color,\n"
                        + "    p.material,\n"
                        + "    p.createTime,\n"
                        + "    p.description,\n"
                        + "    p.image,\n"
                        + "    p.manufacturer,\n"
                        + "    p.madeIn\n"
                        + "FROM dbo.Product p\n"
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID WHERE ProductID  NOT IN (?,?)");
                stm.setInt(1, id1);
                stm.setInt(2, id2);
                rs = stm.executeQuery();

                while (rs.next()) {
                    Product product = new Product();
                    CategoryDTO a = new CategoryDTO();
                    product.setId(rs.getInt("productID"));
                    product.setName(rs.getString("productName"));
                    a.setCategoryName(rs.getString("categoriesName"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getFloat("price"));
                    product.setSize(rs.getString("size"));
                    product.setColor(rs.getString("color"));
                    product.setMaterial(rs.getString("material"));
                    product.setCreateTime(rs.getDate("createTime"));
                    product.setDescription(rs.getString("description"));
                    product.setImage(rs.getString("image"));
                    product.setManufacturer(rs.getString("manufacturer"));
                    product.setMadeIn(rs.getString("madeIn"));
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

    public List<Product> get2id(int id1, int id2) throws SQLException {
        List<Product> products = new ArrayList<>(); // Khởi tạo danh sách sản phẩm

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("select p.productID, p.productName,\n"
                        + "    c.categoriesName,\n"
                        + "    p.quantity,\n"
                        + "    p.price,\n"
                        + "    p.size,\n"
                        + "    p.color,\n"
                        + "    p.material,\n"
                        + "    p.createTime,\n"
                        + "    p.description,\n"
                        + "    p.image,\n"
                        + "    p.manufacturer,\n"
                        + "    p.madeIn\n"
                        + "FROM dbo.Product p\n"
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID WHERE ProductID IN (?, ?)");
                stm.setInt(1, id1);
                stm.setInt(2, id2);
                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO cho mỗi sản phẩm và thiết lập dữ liệu từ ResultSet
                    Product product = new Product();
                    CategoryDTO a = new CategoryDTO();
                    product.setId(rs.getInt("productID"));
                    product.setName(rs.getString("productName"));
                    a.setCategoryName(rs.getString("categoriesName"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getFloat("price"));
                    product.setSize(rs.getString("size"));
                    product.setColor(rs.getString("color"));
                    product.setMaterial(rs.getString("material"));
                    product.setCreateTime(rs.getDate("createTime"));
                    product.setDescription(rs.getString("description"));
                    product.setImage(rs.getString("image"));
                    product.setManufacturer(rs.getString("manufacturer"));
                    product.setMadeIn(rs.getString("madeIn"));
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

    public void insertCheckout(cartDAO cart, String name, String address, String phone, Account user, float discountTotal, String note,int status , int voucher) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();

            if (con != null) {

                // Thêm đơn hàng
                String insertOrderQuery = "INSERT INTO Cart ( quantity, accountID, cartStatus, total, note) "
                        + "VALUES ( ?, ?, 1, ?, ?)";

                statement = con.prepareStatement(insertOrderQuery);

                statement.setFloat(1, cart.getItems().size()); // TotalAmount
                statement.setInt(2, user.getId()); // CustomerID
                statement.setFloat(3, cart.getTotalBill()); // recName 
                statement.setString(4, note); // recPhone
                int rowsInserted = statement.executeUpdate();

                if (rowsInserted > 0) {
                    System.out.println("Thêm đơn hàng thành công!");
                }

                // Lấy OrderID của đơn hàng mới nhất
                String getOrderIDQuery = "SELECT TOP 1 cartID FROM Cart ORDER BY cartID DESC";
                statement = con.prepareStatement(getOrderIDQuery);
                rs = statement.executeQuery();

                int bid = 0; // Khởi tạo OrderID mặc định

                if (rs.next()) {
                    bid = rs.getInt("cartID");
                }

                String insertdeliveryIDQuery = "INSERT INTO Delivery ( status, intendTime)"
                        + "VALUES (?,DATEADD(day, 10, GETDATE()))";

                PreparedStatement insertdeliveryIDQuerys = con.prepareStatement(insertdeliveryIDQuery);

                insertdeliveryIDQuerys.setInt(1, 1); // CustomerID
                insertdeliveryIDQuerys.executeUpdate();

                // Lấy pid của đơn hàng mới nhất
                String getdeliveryIDQuery = "SELECT TOP 1 deliveryID FROM Delivery ORDER BY deliveryID DESC";
                statement = con.prepareStatement(getdeliveryIDQuery);
                rs = statement.executeQuery();

                int pid = 0; // Khởi tạo OrderID mặc định

                if (rs.next()) {
                    pid = rs.getInt("deliveryID");
                }
                // Thêm chi tiết đơn hàng (OrderDetails)
                String insertOrderDetailsQuery = "INSERT INTO CartDetail (cartID, productID, quantity,  size, color) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement insertOrderDetailsStmt = con.prepareStatement(insertOrderDetailsQuery);

                for (cartDTO item : cart.getItems()) {
                    insertOrderDetailsStmt.setInt(1, bid);
                    insertOrderDetailsStmt.setInt(2, item.getProduct().getId());
                    insertOrderDetailsStmt.setInt(3, item.getQuantity());
                    insertOrderDetailsStmt.setString(4, item.getProduct().getSize());
                    insertOrderDetailsStmt.setString(5, item.getProduct().getColor());
                    insertOrderDetailsStmt.executeUpdate();
                }

                String insertpaymentDetailsQuery = "INSERT INTO Payment ([createTime], feeShip,voucherID, [total], [paymentStatus], [deliveryID], [cartID], [cusPhone], [cusAddress],  [cusName])"
                        + " VALUES (GETDATE(), 30,?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement insertpaymentDetailsStmt = con.prepareStatement(insertpaymentDetailsQuery);

                for (cartDTO item : cart.getItems()) {
                     insertpaymentDetailsStmt.setDouble(1, voucher);
                    insertpaymentDetailsStmt.setDouble(2, discountTotal);
                     insertpaymentDetailsStmt.setInt(3, status);
                    insertpaymentDetailsStmt.setInt(4, pid);
                    insertpaymentDetailsStmt.setInt(5, bid);
                    insertpaymentDetailsStmt.setString(6, phone);
                    insertpaymentDetailsStmt.setString(7, address); 
                    insertpaymentDetailsStmt.setString(8, name); 
                    insertpaymentDetailsStmt.executeUpdate();
                }
                String updatepointacc = "UPDATE Account\n"
                        + "SET point = Account.point + Cart.total / 100\n"
                        + "FROM Account\n"
                        + "INNER JOIN Cart ON Account.accountID = Cart.accountID\n"
                        + "WHERE Account.accountID = ?;";
                PreparedStatement updatepointaccstm = con.prepareStatement(updatepointacc);

                for (cartDTO item : cart.getItems()) {
                    updatepointaccstm.setInt(1, user.getId());

                    updatepointaccstm.executeUpdate();
                }
                // Cập nhật StockQuantity trong Products
                String updateStockQuery = "UPDATE Product\n"
                        + "SET quantity = Product.quantity - CartDetail.quantity\n"
                        + "FROM Product\n"
                        + "INNER JOIN CartDetail ON Product.productID = CartDetail.productID\n"
                        + "WHERE Product.ProductID = ?;";
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
 public boolean updateProduct(int productID, String productName, String description, int quantity, float price, String size) throws ClassNotFoundException {
        String updateQuery = "UPDATE Product "
                + "SET productName = ?, "
                + "    description = ?, "
                + "    quantity = ?, "
                + "    price = ?, "
                + "    size = ? "
                + "WHERE productID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement statement = connection.prepareStatement(updateQuery)) {
            statement.setString(1, productName);
            statement.setString(2, description);
            statement.setInt(3, quantity);
            statement.setFloat(4, price);
            statement.setString(5, size);
            statement.setInt(6, productID);

            int rowsUpdated = statement.executeUpdate();

            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }  
    public Product getid(int id) throws SQLException {
        Product product = null; // Khởi tạo đối tượng ProductDTO

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT  p.productID,\n"
                        + "    p.productName,\n"
                        + "    c.categoriesName,\n"
                        + "    p.quantity,\n"
                        + "    p.price,\n"
                        + "    p.size,\n"
                        + "    p.color,\n"
                        + "    p.material,\n"
                        + "    p.createTime,\n"
                        + "    p.description,\n"
                        + "    p.image,\n"
                        + "    p.manufacturer,\n"
                        + "    p.madeIn FROM dbo.Product p\n"
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID\n"
                        + "  WHERE ProductID = ?;");
                stm.setInt(1, id);
                rs = stm.executeQuery();

                if (rs.next()) {
                    // Tạo một đối tượng ProductDTO và thiết lập dữ liệu từ ResultSet
                    product = new Product();
                    CategoryDTO a = new CategoryDTO();
                    product.setId(rs.getInt("productID"));
                    product.setName(rs.getString("productName"));
                    a.setCategoryName(rs.getString("categoriesName"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getFloat("price"));
                    product.setSize(rs.getString("size"));
                    product.setColor(rs.getString("color"));
                    product.setMaterial(rs.getString("material"));
                    product.setCreateTime(rs.getDate("createTime"));
                    product.setDescription(rs.getString("description"));
                    product.setImage(rs.getString("image"));
                    product.setManufacturer(rs.getString("manufacturer"));
                    product.setMadeIn(rs.getString("madeIn"));

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

    public List<Product> getTop3() throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT top 3  p.productID,\n"
                        + "    p.productName,\n"
                        + "    c.categoriesName,\n"
                        + "    p.quantity,\n"
                        + "    p.price,\n"
                        + "    p.size,\n"
                        + "    p.color,\n"
                        + "    p.material,\n"
                        + "    p.createTime,\n"
                        + "    p.description,\n"
                        + "    p.image,\n"
                        + "    p.manufacturer,\n"
                        + "    p.madeIn\n"
                        + "FROM dbo.Product p\n"
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID; ");
                rs = stm.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    CategoryDTO a = new CategoryDTO();
                    product.setId(rs.getInt("productID"));
                    product.setName(rs.getString("productName"));
                    a.setCategoryName(rs.getString("categoriesName"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getFloat("price"));
                    product.setSize(rs.getString("size"));
                    product.setColor(rs.getString("color"));
                    product.setMaterial(rs.getString("material"));
                    product.setCreateTime(rs.getDate("createTime"));
                    product.setDescription(rs.getString("description"));
                    product.setImage(rs.getString("image"));
                    product.setManufacturer(rs.getString("manufacturer"));
                    product.setMadeIn(rs.getString("madeIn"));
                    list.add(product);
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

    public List<Product> getAllProduct() throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT p.productID, \n"
                        + "    p.productName,\n"
                        + "    c.categoriesName,\n"
                        + "    p.quantity,\n"
                        + "    p.price,\n"
                        + "    p.size,\n"
                        + "    p.color,\n"
                        + "    p.material,\n"
                        + "    p.createTime,\n"
                        + "    p.description,\n"
                        + "    p.image,\n"
                        + "    p.manufacturer,\n"
                        + "    p.madeIn,\n"
                        + "    p.productStatus\n"
                        + "FROM dbo.Product p\n"
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID; ");
                rs = stm.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    CategoryDTO a = new CategoryDTO();
                    product.setId(rs.getInt("productID"));
                    product.setName(rs.getString("productName"));
                    a.setCategoryName(rs.getString("categoriesName"));
                    product.setCate(a);
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getFloat("price"));
                    product.setSize(rs.getString("size"));
                    product.setColor(rs.getString("color"));
                    product.setMaterial(rs.getString("material"));
                    product.setCreateTime(rs.getDate("createTime"));
                    product.setDescription(rs.getString("description"));
                    product.setImage(rs.getString("image"));
                    product.setManufacturer(rs.getString("manufacturer"));
                    product.setMadeIn(rs.getString("madeIn"));
                    product.setStatus(rs.getInt("productStatus"));
                    list.add(product);

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

    public List<Product> searchByName(String txtSearch) {
        List<Product> products = new ArrayList<>();

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            stm = con.prepareStatement("select p.productID, p.productName,\n"
                    + "    c.categoriesName,\n"
                    + "    p.quantity,\n"
                    + "    p.price,\n"
                    + "    p.size,\n"
                    + "    p.color,\n"
                    + "    p.material,\n"
                    + "    p.createTime,\n"
                    + "    p.description,\n"
                    + "    p.image,\n"
                    + "    p.manufacturer,\n"
                    + "    p.madeIn\n"
                    + "FROM dbo.Product p\n"
                    + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID  where  p.productName like ?");

            stm.setString(1, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                CategoryDTO a = new CategoryDTO();
                product.setId(rs.getInt("productID"));
                product.setName(rs.getString("productName"));
                a.setCategoryName(rs.getString("categoriesName"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPrice(rs.getFloat("price"));
                product.setSize(rs.getString("size"));
                product.setColor(rs.getString("color"));
                product.setMaterial(rs.getString("material"));
                product.setCreateTime(rs.getDate("createTime"));
                product.setDescription(rs.getString("description"));
                product.setImage(rs.getString("image"));
                product.setManufacturer(rs.getString("manufacturer"));
                product.setMadeIn(rs.getString("madeIn"));
                products.add(product);
            }
        } catch (Exception e) {
        }
        return products;
    }

    public List<Product> search(double id1, double id2) throws SQLException {
        List<Product> products = new ArrayList<>(); // Khởi tạo danh sách sản phẩm

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                // Sử dụng OR để lấy các sản phẩm có một trong ba ID
                stm = con.prepareStatement("select p.productID, p.productName,\n"
                        + "    c.categoriesName,\n"
                        + "    p.quantity,\n"
                        + "    p.price,\n"
                        + "    p.size,\n"
                        + "    p.color,\n"
                        + "    p.material,\n"
                        + "    p.createTime,\n"
                        + "    p.description,\n"
                        + "    p.image,\n"
                        + "    p.manufacturer,\n"
                        + "    p.madeIn\n"
                        + "FROM dbo.Product p\n"
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID where p.price  >= ? and p.price  <= ?");
                stm.setDouble(1, id1);
                stm.setDouble(2, id2);

                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO cho mỗi sản phẩm và thiết lập dữ liệu từ ResultSet
                    Product product = new Product();
                    CategoryDTO a = new CategoryDTO();
                    product.setId(rs.getInt("productID"));
                    product.setName(rs.getString("productName"));
                    a.setCategoryName(rs.getString("categoriesName"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setPrice(rs.getFloat("price"));
                    product.setSize(rs.getString("size"));
                    product.setColor(rs.getString("color"));
                    product.setMaterial(rs.getString("material"));
                    product.setCreateTime(rs.getDate("createTime"));
                    product.setDescription(rs.getString("description"));
                    product.setImage(rs.getString("image"));
                    product.setManufacturer(rs.getString("manufacturer"));
                    product.setMadeIn(rs.getString("madeIn"));
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
