/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Delivery;
import DTO.Order;
import DTO.Payment;
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
public class OrderDao {

    public List<Payment> getAllOders() throws SQLException {
        List<Payment> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("  SELECT [paymentID],[createTime] ,C.intendTime,C.Status,O.cartID ,[cusPhone] ,[cusAddress] ,O.total \n"
                        + "     ,[paymentStatus], cusName FROM Payment O  INNER JOIN delivery C ON O.deliveryID = C.deliveryID  ");
                rs = stm.executeQuery();
                while (rs.next()) {
                    Order order = new Order();
                    Delivery ship = new Delivery();
                    Payment pay = new Payment();
                    // Đặt các thuộc tính của đối tượng OrderDTO từ ResultSet
                    pay.setId(rs.getInt("paymentID"));
                    pay.setCreateTime(rs.getDate("createTime"));
                    ship.setIntendTime(rs.getDate("intendTime"));
                    ship.setStatus(rs.getInt("Status"));
                    pay.setDelivery(ship);
                    order.setId(rs.getInt("cartID")); 
                    pay.setOrder(order);
                    pay.setCusPhone(rs.getInt("cusPhone"));
                    pay.setCusAddress(rs.getString("cusAddress"));
                    pay.setTotal(rs.getInt("total"));
                    pay.setStatus(rs.getInt("paymentStatus"));
                    pay.setName(rs.getString("cusName"));
                    // Thêm đối tượng OrderDTO vào danh sách
                    list.add(pay);
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

}
