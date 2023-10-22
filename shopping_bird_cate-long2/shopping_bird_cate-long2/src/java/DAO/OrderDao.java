/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.BookingRequest;
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
                stm = con.prepareStatement(" SELECT\n" +
"    O.[paymentID],\n" +
"    O.[createTime],\n" +
"    C.intendTime,\n" +
"    C.Status,\n" +
"    O.cartID,\n" +
"    O.deliveryID,\n" +
"    [cusPhone],\n" +
"    [cusAddress],\n" +
"    O.total,\n" +
"    Cart.note,\n" +
"    [paymentStatus],\n" +
"    cusName\n" +
"FROM\n" +
"    Payment O\n" +
"INNER JOIN\n" +
"    delivery C ON O.deliveryID = C.deliveryID\n" +
"INNER JOIN\n" +
"    Cart ON O.cartID = Cart.cartID\n" +
"ORDER BY\n" +
"    O.[paymentID] DESC;  ");
                rs = stm.executeQuery();
                while (rs.next()) {
                    Order order = new Order();
                    Delivery ship = new Delivery();
                    Payment pay = new Payment();
                    BookingRequest booking = new BookingRequest();
                    // Đặt các thuộc tính của đối tượng OrderDTO từ ResultSet
                    pay.setId(rs.getInt("paymentID"));
                    pay.setCreateTime(rs.getDate("createTime"));
                    ship.setIntendTime(rs.getDate("intendTime"));
                    ship.setStatus(rs.getInt("Status"));
                    pay.setDelivery(ship);
                    order.setId(rs.getInt("cartID")); 
                    pay.setOrder(order);
                   ship.setId(rs.getInt("deliveryID"));
                    pay.setDelivery(ship);
                    pay.setCusPhone(rs.getInt("cusPhone"));
                    pay.setCusAddress(rs.getString("cusAddress"));
                    pay.setTotal(rs.getInt("total")); 
                    pay.setStatus(rs.getInt("paymentStatus"));
                     pay.setNote(rs.getString("note"));
                     
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
public List<Payment> Booking() throws SQLException {
    List<Payment> list = new ArrayList<>();
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    try {
        con = DBContext.getConnection();
        if (con != null) {
            stm = con.prepareStatement("SELECT \n"
                    + "     O.[paymentID], \n"
                    + "     O.[createTime], \n"
                    + "     C.intendTime, \n"
                    + "     C.Status,  \n"
                    + "     O.deliveryID, \n"
                    + "     O.[cusPhone], \n"
                    + "     o.[cusAddress], \n"
                    + "     O.total, \n"
                    + "     BookingRequest.note, \n"
                    + "     [paymentStatus], \n"
                    + "     cusName \n"
                    + " FROM \n"
                    + "     Payment O \n"
                    + " INNER JOIN \n"
                    + "     delivery C ON O.deliveryID = C.deliveryID \n"
                    + " INNER JOIN \n"
                    + "     BookingRequest  ON O.bookingID = BookingRequest.bookingID \n"
                    + " ORDER BY \n"
                    + "     O.[paymentID] DESC; ");
                rs = stm.executeQuery();
                while (rs.next()) { 
                    Delivery ship = new Delivery();
                    Payment pay = new Payment();
                    BookingRequest booking = new BookingRequest();
                    // Đặt các thuộc tính của đối tượng OrderDTO từ ResultSet
                    pay.setId(rs.getInt("paymentID"));
                    pay.setCreateTime(rs.getDate("createTime"));
                    ship.setIntendTime(rs.getDate("intendTime"));
                    ship.setStatus(rs.getInt("Status"));
                    pay.setDelivery(ship); 
                     ship.setId(rs.getInt("deliveryID"));
                    pay.setDelivery(ship);
                    pay.setCusPhone(rs.getInt("cusPhone"));
                    pay.setCusAddress(rs.getString("cusAddress"));
                    pay.setTotal(rs.getInt("total")); 
                    pay.setStatus(rs.getInt("paymentStatus"));
                     pay.setNote(rs.getString("note")); 
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
