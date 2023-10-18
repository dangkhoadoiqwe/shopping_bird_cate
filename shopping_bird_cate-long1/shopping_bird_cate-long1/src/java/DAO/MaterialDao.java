/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Material;
import UTILS.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hailo
 */
public class MaterialDao {

    public List<Material> listMaterials() {
        List<Material> list = new ArrayList<>();
        try {
            try (Connection con = DBContext.getConnection()) {
                if (con != null) {
                    try (PreparedStatement stm = con.prepareStatement("SELECT * FROM Material")) {
                        try (ResultSet rs = stm.executeQuery()) {
                            while (rs.next()) {
                                Material mt = new Material();
                                mt.setId(rs.getInt(1));
                                mt.setName(rs.getString(2));
                                mt.setPrice(rs.getInt(3));
                                list.add(mt);
                            }
                        }
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
        }
        return list;
    }
}
