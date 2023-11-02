/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import UTILS.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author hailo
 */
public class DeliveryDao {

    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public int insertAndGenerateId(Date plus4day) {
        try {
            con = DBContext.getConnection();
            String sql = "INSERT INTO Delivery(status,intendTime) values(1,?)";
            stm = con.prepareStatement(sql);
            java.sql.Date sqlDate = new java.sql.Date(plus4day.getTime());
            stm.setDate(1, sqlDate);
            stm.execute();
            String sql2 = "SELECT TOP 1 deliveryID FROM Delivery order by deliveryID desc";
            stm = con.prepareStatement(sql2);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            closeResource(con, stm, rs);
        }
        return 0;
    }

    public void closeResource(Connection con, PreparedStatement stm, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
        }
    }
}
