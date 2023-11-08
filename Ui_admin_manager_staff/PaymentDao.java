/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Account;
import DTO.CategoryDTO;
import DTO.Delivery;
import DTO.Order;
import DTO.Payment;
import DTO.Product;
import DTO.Voucher;
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
public class PaymentDao {

    public boolean CancleProductStatus(String cartID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("UPDATE Delivery\n"
                        + "SET Status = 4\n"
                        + "FROM Delivery\n"
                        + "INNER JOIN Payment ON Delivery.deliveryID = Payment.deliveryID\n"
                        + "WHERE Payment.cartID = ?;");

                stm.setString(1, cartID);
                check = stm.executeUpdate() > 0;

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public boolean updateProductStatus(String cartID, String newStatus) throws SQLException {
        try (Connection con = DBContext.getConnection();
                PreparedStatement updateDeliveryStatus = con.prepareStatement(
                        "UPDATE Delivery "
                        + "SET Status = ? "
                        + "FROM Delivery "
                        + "INNER JOIN Payment ON Delivery.deliveryID = Payment.deliveryID "
                        + "WHERE Payment.cartID = ?;");
                PreparedStatement updatePaymentStatus = con.prepareStatement(
                        "UPDATE payment "
                        + "SET paymentStatus = 1 "
                        + "WHERE EXISTS ( "
                        + "    SELECT 1 "
                        + "    FROM delivery "
                        + "    WHERE delivery.deliveryID = payment.deliveryID "
                        + "    AND delivery.status = 3);")) {

            // Cập nhật Delivery Status
            updateDeliveryStatus.setString(1, newStatus);
            updateDeliveryStatus.setString(2, cartID);
            boolean deliveryStatusUpdated = updateDeliveryStatus.executeUpdate() > 0;

            // Cập nhật paymentStatus
            boolean paymentStatusUpdated = updatePaymentStatus.executeUpdate() > 0;

            return deliveryStatusUpdated && paymentStatusUpdated;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Payment> getid(int id) throws SQLException {
        List<Payment> list = new ArrayList<>(); // Khởi tạo đối tượng ProductDTO

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT \n"
                        + "    p.[paymentID], \n"
                        + "    p.[createTime], \n"
                        + "    p.[voucherID], \n"
                        + "    p.[total], \n"
                        + "    p.[paymentStatus], \n"
                        + "    p.[deliveryID], \n"
                        + "    p.[cartID], \n"
                        + "    p.[cusPhone], \n"
                        + "    p.[cusAddress], \n"
                        + "    p.[cusName], \n"
                        + "    c.[accountID], \n"
                        + "    d.[intendtime], \n"
                        + "    d.[status] \n"
                        + "FROM \n"
                        + "    payment AS p \n"
                        + "JOIN \n"
                        + "    Cart AS c \n"
                        + "ON \n"
                        + "    p.[cartID] = c.[cartID] \n"
                        + "JOIN \n"
                        + "    Delivery AS d \n"
                        + "ON \n"
                        + "    p.[deliveryID] = d.[deliveryID] \n"
                        + "WHERE accountID = ?\n"
                        + "ORDER BY p.[paymentID] DESC; ");

                stm.setInt(1, id);
                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO và thiết lập dữ liệu từ ResultSet
                    // Khởi tạo đối tượng Payment
                    Payment payment = new Payment();
                    Account acc = new Account();
                    Voucher vu = new Voucher();
                    Order a = new Order();
                    Delivery b = new Delivery();
// Thiết lập dữ liệu từ ResultSet vào đối tượng Payment
                    payment.setId(rs.getInt("paymentID"));
                    payment.setCreateTime(rs.getDate("createTime"));
                    vu.setId(rs.getInt("voucherID"));
                    payment.setVu(vu);
                    payment.setTotal(rs.getInt("total"));
                    payment.setStatus(rs.getInt("paymentStatus"));
                    b.setId(rs.getInt("deliveryID"));
                    payment.setDelivery(b);
                    a.setId(rs.getInt("cartID"));
                    payment.setOrder(a);
                    payment.setCusPhone(rs.getInt("cusPhone"));
                    payment.setCusAddress(rs.getString("cusAddress"));
                    payment.setName(rs.getString("cusName"));
                    acc.setId(rs.getInt("accountID"));
                    payment.setAcc(acc);
                    b.setIntendTime(rs.getDate("intendtime"));
                    b.setStatus(rs.getInt("status"));
                    payment.setDelivery(b);

                    list.add(payment);
// Đảm bảo bạn đã khởi tạo các setter trong lớp Payment để thiết lập dữ liệu
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

        return list; // Trả về đối tượng ProductDTO đã được thiết lập dữ liệu
    }

    public int countOrder() throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT COUNT(CartID) FROM Payment");
                rs = stm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {

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
                e.printStackTrace();
            }
        }
        return count;
    }

    public int SumPayment() throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int sum = 0;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT SUM(total) FROM payment");
                rs = stm.executeQuery();
                if (rs.next()) {
                    sum = rs.getInt(1);
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
        return sum;
    }

    public int countBooking() throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT COUNT(bookingID) FROM Payment"); 
                rs = stm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
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
                e.printStackTrace();
            }
        }
        return count;
    }

}
