/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.ProductDTO;
import ULTILS.DBContext;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO implements Serializable {
    

    
    public List<ProductDTO>getAllProduct() throws SQLException  {
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
   public ProductDTO getid(int id) throws SQLException {
    ProductDTO product = null; // Khởi tạo đối tượng ProductDTO
    
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    try {
        con = DBContext.getConnection();
        if (con != null) {
            stm = con.prepareStatement("SELECT Name, Brand, Price, Description, StockQuantity, ImageURL FROM dbo.Products WHERE ProductID = ?");
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

      public static void main(String[] args) throws SQLException {
        
             ProductDAO productDAO = new ProductDAO();
                List<ProductDTO> productList = productDAO.getAllProduct();

                // Hiển thị danh sách sản phẩm
                System.out.println("Danh sách sản phẩm:");
                for (ProductDTO product : productList) {
                    System.out.println("ID: " + product.getId());
                    System.out.println("Tên: " + product.getName());
                    System.out.println("Hãng: " + product.getBrand());
                    System.out.println("Giá: " + product.getPrice());
                    System.out.println("Mô tả: " + product.getDescription());
                    System.out.println("Số lượng trong kho: " + product.getQuantity());
                    System.out.println("Đường dẫn hình ảnh: " + product.getImg());
                    System.out.println();
                }
           
    }
}

