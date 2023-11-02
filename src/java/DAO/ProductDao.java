/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.CategoryDTO;
import DTO.Product;
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

    public List<Product> getProByCate(int cateID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Product> productList = new ArrayList<>();

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("select productID, productName,image,price from Product where categoriesID = ?");
                stm.setInt(1, cateID);
                rs = stm.executeQuery();

                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("productID"));
                    product.setName(rs.getString("productName"));
                    product.setImage(rs.getString("image"));
                    product.setPrice(rs.getFloat("price"));

                    productList.add(product);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
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
        return productList;
    }

    public List<Product> getProductsByPaymentID(int paymentID) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Product> products = new ArrayList<>();

        try {
            conn = DBContext.getConnection(); // Khởi tạo kết nối đến cơ sở dữ liệu
            String sql
                    = "SELECT\n"
                    + "    p.productID,\n"
                    + "    p.productName,\n"
                    + "    p.image,\n"
                    + "    cd.quantity,\n"
                    + "    p.price,\n"
                    + "    p.color,\n"
                    + "    p.madeIn,\n"
                    + "    p.manufacturer,\n"
                    + "    p.material\n"
                    + "FROM Product p\n"
                    + "JOIN CartDetail cd ON p.productID = cd.productID\n"
                    + "JOIN Payment pay ON pay.paymentID = cd.paymentID\n"
                    + "WHERE pay.paymentID = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, paymentID);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productID"));
                product.setName(rs.getString("productName"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPrice(rs.getFloat("price"));
                product.setImage(rs.getString("image"));
                product.setColor(rs.getString("color"));
                product.setMadeIn(rs.getString("madeIn"));
                product.setManufacturer(rs.getString("manufacturer"));
                product.setMaterial(rs.getString("material"));
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
                String query = "SELECT\n"
                        + "    p.productID,\n"
                        + "    p.productName,\n"
                        + "    p.productStatus,\n"
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
                        + "FROM Product p\n"
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID\n"
                        + "WHERE c.categoriesID = ? AND p.productName LIKE ?";
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
                    product.setStatus(rs.getInt("productStatus"));
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
        } catch (ClassNotFoundException | SQLException e) {
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
        } catch (ClassNotFoundException | SQLException e) {
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
        } catch (ClassNotFoundException | SQLException e) {
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

    public boolean updateProduct(int productID, String productName, String description, int quantity, float price, String size) throws ClassNotFoundException {
        String updateQuery = "UPDATE Product "
                + "SET productName = ?, "
                + "    description = ?, "
                + "    quantity = ?, "
                + "    price = ?, "
                + "    size = ? "
                + "WHERE productID = ?";

        try (Connection connection = DBContext.getConnection(); PreparedStatement statement = connection.prepareStatement(updateQuery)) {
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
        } catch (ClassNotFoundException | SQLException e) {
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
        } catch (ClassNotFoundException | SQLException e) {
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
        } catch (ClassNotFoundException | SQLException e) {
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
        } catch (ClassNotFoundException | SQLException e) {
        }
        return products;
    }

    public List<Product> search(double id1, double id2, String txt) throws SQLException {
        List<Product> products = new ArrayList<>();

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                StringBuilder query = new StringBuilder("SELECT p.productID, p.productName, c.categoriesName, "
                        + "p.quantity, p.price, p.size, p.color, p.material, p.createTime, p.description, p.image, "
                        + "p.manufacturer, p.madeIn FROM dbo.Product p "
                        + "INNER JOIN dbo.Category c ON p.categoriesID = c.categoriesID "
                        + "WHERE p.price >= ? AND p.price <= ?");

                if (txt != null && !txt.isEmpty()) {
                    query.append(" AND p.productName LIKE ?");
                }

                stm = con.prepareStatement(query.toString());
                stm.setDouble(1, id1);
                stm.setDouble(2, id2);

                if (txt != null && !txt.isEmpty()) {
                    stm.setString(3, "%" + txt + "%");
                }

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
        } catch (ClassNotFoundException | SQLException e) {
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

        return products;
    }

    public boolean updateProduct(int productID, String productName, int categoriesID, int quantity, float price, String size,
            String color, String material, String image, String manufacturer, String madeIn, String description) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;

        try {
            conn = DBContext.getConnection();

            String sql = "UPDATE Product "
                    + "SET productName = ?, "
                    + "categoriesID = ?, "
                    + "quantity = ? ,"
                    + "price = ? , "
                    + "size = ? ,"
                    + "color = ? ,"
                    + "material = ? ,"
                    + "image = ?, "
                    + "manufacturer = ?, "
                    + "madeIn = ?, "
                    + "description = ? "
                    + "WHERE productID = ?";

            stmt = conn.prepareStatement(sql);
            stmt.setString(1, productName);
            stmt.setInt(2, categoriesID);
            stmt.setInt(3, quantity);
            stmt.setFloat(4, price);
            stmt.setString(5, size);
            stmt.setString(6, color);
            stmt.setString(7, material);
            stmt.setString(8, image);
            stmt.setString(9, manufacturer);
            stmt.setString(10, madeIn);
            stmt.setString(11, description);
            stmt.setInt(12, productID);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Properly handle and log the exception

        } // Properly handle and log the exception
        finally {
            // Close the resources in reverse order of opening
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }

        return success;
    }

    public Product getProductById(int id) {
        try {
            try (Connection con = DBContext.getConnection()) {
                String sql = "SELECT productName, image FROM Product WHERE productID = ?";
                try (PreparedStatement stm = con.prepareStatement(sql)) {
                    stm.setInt(1, id);
                    try (ResultSet rs = stm.executeQuery()) {
                        if (rs.next()) {
                            Product product = new Product();
                            product.setName(rs.getString(1));
                            product.setImage(rs.getString(2));
                            return product;
                        }
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
        }
        return null;
    }

    public boolean subQuantityProductById(int proID, int quantity) {
        try {
            try (Connection con = DBContext.getConnection()) {
                String sql
                        = "UPDATE Product\n"
                        + "SET Product.quantity = CASE\n"
                        + "                       WHEN Product.quantity - ? <= 0 THEN 0\n"
                        + "		          ELSE Product.quantity - ?\n"
                        + "		          END\n"
                        + "FROM Product WHERE Product.productID = ?";
                try (PreparedStatement stm = con.prepareStatement(sql)) {
                    stm.setInt(1, quantity);
                    stm.setInt(2, quantity);
                    stm.setInt(3, proID);
                    return stm.executeUpdate() > 0;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
}
