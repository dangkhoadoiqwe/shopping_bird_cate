/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.CategoryDTO;
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
 * @author Admin
 */
public class CategoryDAO{
    public boolean Instestid(String name ) throws SQLException{
        
   try (Connection conn = DBContext.getConnection();
         PreparedStatement stmt = conn.prepareStatement("INSERT INTO Category ([categoriesName]) VALUES (?)")) {
        
  
        stmt.setString(1, name);
       
        int rowsInserted = stmt.executeUpdate();
        return rowsInserted > 0;
    } catch (SQLException e) {
        // Xử lý hoặc ném lại ngoại lệ
        throw e;
    }   catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
      public List<CategoryDTO> getid() throws SQLException {
           List<CategoryDTO> product =  new ArrayList<>();// Khởi tạo đối tượng ProductDTO

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT * FROM dbo.Category ");
               
                rs = stm.executeQuery();

                while (rs.next()) { 
                    CategoryDTO a = new CategoryDTO();
                    a.setCategoryId(rs.getInt("categoriesID")); 
                    a.setCategoryName(rs.getString("categoriesName"));
                    product.add(a);
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
}
