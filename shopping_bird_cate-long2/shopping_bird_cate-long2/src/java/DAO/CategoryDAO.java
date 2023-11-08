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

/**
 *
 * @author Admin
 */
public class CategoryDAO {
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
