/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Account;
import DTO.BookingRequest;
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
public class BookingDao {

      private static final String getBookingRequestsByAccountId =
            "SELECT B.bookingID AS ID, " +
            "B.createTime AS 'Ngày đặt hàng', " +
            "Account.name AS Tên, " +
            "m.name AS 'Chất liệu', " +
            "B.birdType, " +
            "B.color AS Màu, " +
            "B.quantity AS 'Số lượng', " +
            "B.size AS 'Kích thước', " +
            "B.image AS Ảnh, " +
            "B.note AS 'Chú thích', " +
            "B.total AS 'Số tiền', " +
            "B.status AS 'Trạng thái' " +
            "FROM BookingRequest B " +
            "INNER JOIN Account ON B.accountID = Account.accountID " +
            "INNER JOIN Material m ON B.materialID = m.materialID " +
            "WHERE Account.accountID = ?";

    public static List<BookingRequest> getBookingRequestsByAccountId(int accountId) {
        List<BookingRequest> bookings = new ArrayList<>();

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(getBookingRequestsByAccountId);
                stm.setInt(1, accountId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Account account = new Account();
                    Material material = new Material();
                    BookingRequest booking = new BookingRequest();
                    booking.setBookingRequestId(rs.getInt("ID"));
                    booking.setCreateTime(rs.getDate("Ngày đặt hàng"));
                    account.setName(rs.getString("Tên"));
                    booking.setBirdType(rs.getString("birdType"));
                    material.setName(rs.getString("Chất liệu"));
                    booking.setColor(rs.getString("Màu"));
                    booking.setQuantity(rs.getInt("Số lượng"));
                    booking.setSize(rs.getString("Kích thước"));
                    booking.setImage(rs.getString("Ảnh"));
                    booking.setNote(rs.getString("Chú thích"));
                    booking.setTotal(rs.getInt("Số tiền"));
                    booking.setStatus(rs.getInt("Trạng thái"));

                    booking.setAccount(account);
                    booking.setMaterial(material);

                    bookings.add(booking);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return bookings;
    }
}








