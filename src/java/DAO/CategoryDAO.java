/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.CategoryDTO;
import DTO.ProductDTO;
import ULTILS.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryDAO {
     public List<CategoryDTO> getAllCategory() {
        List<CategoryDTO> list = new ArrayList<>();
        String query = "select * from Category";
        
         Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
        try {
            con = DBContext.getConnection();
          stm = con.prepareStatement("select *  from Category");
            
            rs = stm.executeQuery();
            while (rs.next()) {
                CategoryDTO product = new CategoryDTO();
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setCategoryName(rs.getString("CategoryName"));
                product.setDescription(rs.getString("Description"));
            }
        } catch (Exception e) {
        }
        return list;
    }

}
