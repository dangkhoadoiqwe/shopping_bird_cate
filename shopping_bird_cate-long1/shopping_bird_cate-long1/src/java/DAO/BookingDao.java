/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Account;
import DTO.BookingRequest;
import DTO.Material;
import UTILS.DBContext;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.util.Date;
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

    String listBookingSql = "SELECT * FROM dbo.BookingRequest br \n"
            + "INNER JOIN dbo.Account a ON br.accountID = a.accountID \n"
            + "INNER JOIN dbo.Material m ON br.materialID = m.materialID"; 

    String getBookingRequestsByAccountId
            = "SELECT B.bookingID AS ID, "
            + "B.createTime AS 'Ngày đặt hàng', "
            + "Account.name AS Tên, "
            + "m.name AS 'Chất liệu', "
            + "B.birdType, "
            + "B.color AS Màu, "
            + "B.quantity AS 'Số lượng', "
            + "B.size AS 'Kích thước', "
            + "B.image AS Ảnh, "
            + "B.note AS 'Chú thích', "
            + "B.total AS 'Số tiền', "
            + "B.status AS 'Trạng thái' "
            + "FROM BookingRequest B "
            + "INNER JOIN Account ON B.accountID = Account.accountID "
            + "INNER JOIN Material m ON B.materialID = m.materialID "
            + "WHERE Account.accountID = ?";

    String getBookingById = "SELECT * FROM BookingRequest br INNER JOIN Account a ON br.accountID = a.accountID WHERE br.bookingID = ?";
    
     String addBookingSql = "INSERT INTO dbo.BookingRequest(accountID, birdType,color,size,materialID,image,quantity,status,subtotal,total,createTime,note,"
            + "cusAddress, cusPhone,materialCustom)"
            + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    public boolean addBookingRequest(int cusId, String birdType, String color, String size, int materialId, String materialName, String image, int quantity, int status, String subtotal, int total,
            Date createTime, String note, String cusAddress, int cusPhone) {
        try {
            try (Connection con = DBContext.getConnection()) {
                try (PreparedStatement stm = con.prepareStatement(addBookingSql)) {
                    stm.setInt(1, cusId);
                    stm.setString(2, birdType);
                    stm.setString(3, color);
                    stm.setString(4, size);
                    stm.setInt(5, materialId);
                    stm.setString(6, image);
                    stm.setInt(7, quantity);
                    stm.setInt(8, status);
                    stm.setString(9, subtotal); // Use the correct parameter index (8) for subtotal
                    stm.setInt(10, total); // Use the correct parameter index (9) for total
                    stm.setTimestamp(11, new java.sql.Timestamp(createTime.getTime()));
                    stm.setString(12, note);
                    stm.setString(13, cusAddress);
                    stm.setInt(14, cusPhone);
                    stm.setString(15, materialName);
                    int rowsAffected = stm.executeUpdate(); // Use executeUpdate to execute an insert query
                    return rowsAffected > 0; // 
                }
            }
        } catch (SQLException | ClassNotFoundException  e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<BookingRequest> listBookingRequest() {
        List<BookingRequest> list = new ArrayList<>();
        try {
            try (Connection con = DBContext.getConnection()) {
                try (PreparedStatement stm = con.prepareStatement(listBookingSql)) {
                    try (ResultSet rs = stm.executeQuery()) {
                        while (rs.next()) {
                            Account account = new Account();
                            account.setId(rs.getInt("accountID"));
                            account.setName(rs.getString("name"));
                            account.setPhone(rs.getString("phone"));
                            account.setStatus(rs.getInt("status"));
                            account.setEmail(rs.getString("email"));
                            Material material = new Material();
                            material.setId(rs.getInt("materialID"));
                            material.setName(rs.getString(27));
                            material.setPrice(rs.getInt(28));
                            BookingRequest booking = new BookingRequest();
                            booking.setAccount(account);
                            booking.setBookingRequestId(rs.getInt("bookingID"));
                            booking.setBirdType(rs.getString("birdType"));
                            booking.setColor(rs.getString("color"));
                            booking.setCreateTime(rs.getDate("createTime"));
                            booking.setSize(rs.getString("size"));
                            booking.setMaterial(material);
                            booking.setStatus(rs.getInt("status"));
                            booking.setSubtotal(rs.getString("subtotal"));
                            booking.setTotal(rs.getInt("total"));
                            booking.setNote(rs.getString("note"));
                            booking.setCusAddress(rs.getString("cusAddress"));
                            booking.setCusPhone(rs.getString("cusPhone"));
                            booking.setQuantity(rs.getInt("quantity"));
                            booking.setMaterialCustom(rs.getString("materialCustom"));
                            list.add(booking);
                        }
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
        }
        return list;
    }

    public List<BookingRequest> getBookingRequestsByAccountId(int accountId) {
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
        } catch (ClassNotFoundException | SQLException e) {
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

    public BookingRequest getBookingRequestById(int id) {
        try {
            try (Connection con = DBContext.getConnection()) {
                try (PreparedStatement stm = con.prepareStatement(getBookingById)) {
                    stm.setInt(1, id);
                    try (ResultSet rs = stm.executeQuery()) {
                        if (rs.next()) {
                            BookingRequest booking = new BookingRequest();
                            Account account = new Account();
                            Material material = new Material();
                            booking.setBookingRequestId(rs.getInt(1));
                            account.setId(rs.getInt(2));
                            account.setName(rs.getString(18));
                            account.setEmail(rs.getString("email"));
                            booking.setAccount(account);
                            booking.setBirdType(rs.getString(3));
                            System.out.println("data: " + new String(rs.getString(4).getBytes("iso-8859-1"), "utf-8"));
                            booking.setColor(new String(rs.getString(4).getBytes("iso-8859-1"), "utf-8"));
                            booking.setSize(rs.getString(5));
                            material.setId(rs.getInt(6));
                            booking.setMaterial(material);
                            booking.setImage(rs.getString(7));
                            booking.setQuantity(rs.getInt(8));
                            booking.setStatus(rs.getInt(9));
                            booking.setSubtotal(rs.getString(10));
                            booking.setTotal(rs.getInt(11));
                            booking.setCreateTime(rs.getDate(12));
                            booking.setNote(rs.getString(13));
                            booking.setCusAddress(rs.getString(14));
                            booking.setCusPhone(rs.getString(15));
                            booking.setMaterialCustom(rs.getString(16));
                            return booking;
                        }
                    }
                }

            }
        } catch (SQLException | ClassNotFoundException | UnsupportedEncodingException e) {
        }
        return null;
    }

    String updateBooking = "UPDATE BookingReques SET birdType = ?, color = ?, size = ?, ";

    public boolean updateBooking(int id, String cusName, String email, String size, int quantity, String birdType, String note, String color, int status, String subtotal, int total) {
        try {
            try (Connection con = DBContext.getConnection()) {
                try (PreparedStatement stm = con.prepareStatement(getBookingById)) {
                    stm.setString(1, birdType);
                    stm.setString(2, color);
                }

            }
        } catch (SQLException | ClassNotFoundException e) {
        }
        return false;

    }

}
