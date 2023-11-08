/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Account;
import DTO.BookingRequest;
import DTO.Delivery;
import DTO.Order;
import DTO.Payment;
import DTO.Product;
import DTO.Voucher;
import UTILS.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hailo
 */
public class PaymentDao {
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
     public Timestamp getCurrentDateTime() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Timestamp currentDateTime = null;

        try {
            conn = DBContext.getConnection(); // Thay thế bằng phương thức kết nối cơ sở dữ liệu thực tế của bạn
            String sql = "SELECT CURRENT_TIMESTAMP AS CurrentDateTime";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            if (rs.next()) {
                currentDateTime = rs.getTimestamp("CurrentDateTime");
            }
        } catch (SQLException e) {
            // Xử lý lỗi hoặc log lỗi tại đây
            throw e;
        } catch (ClassNotFoundException ex) {
         Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
     } finally {
            // Đóng tất cả các tài nguyên (stmt, rs, conn) tại đây
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return currentDateTime;
    }
     public List<Payment> getPaymentsForLast7Months() {
    List<Payment> payments = new ArrayList<>();

    String sql = "WITH MonthRange AS (" +
            "    SELECT DISTINCT" +
            "        CONVERT(DATE, DATEADD(MONTH, -6 + number, GETDATE())) AS sale_month" +
            "    FROM" +
            "        master.dbo.spt_values" +
            "    WHERE" +
            "        type = 'P'" +
            "        AND number BETWEEN 0 AND 6" +
            ")" +
            "SELECT" +
            "    mr.sale_month AS sale_month," +
            "    COALESCE(SUM(p.total), 0) AS total_quantity" +
            "FROM" +
            "    MonthRange mr" +
            "LEFT JOIN" +
            "    Payment p ON YEAR(mr.sale_month) = YEAR(p.createTime) AND MONTH(mr.sale_month) = MONTH(p.createTime)" +
            "GROUP BY" +
            "    mr.sale_month" +
            "ORDER BY" +
            "    mr.sale_month;";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = DBContext.getConnection();
        stmt = conn.prepareStatement(sql);
        
        rs = stmt.executeQuery();

        while (rs.next()) {
            Payment payment = new Payment();
            payment.setCreateTime(rs.getDate("sale_month"));
            payment.setTotall(rs.getDouble("total_quantity"));
            payments.add(payment);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
    } finally {
        // Đảm bảo đóng tất cả các tài nguyên ở đây, như stmt, conn, và rs
        // Thông thường, bạn nên sử dụng blok try-with-resources để đảm bảo tài nguyên được đóng đúng cách.
    }

    return payments;
}

    public List<Payment> getPaymentSummaryLast7Days() {
        List<Payment> paymentSummaries = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet resultSet = null;

        try {
            conn = DBContext.getConnection();
            String sql = "-- Tạo một bảng tạm thời chứa chuỗi ngày trong 7 ngày gần đây\n" +
"WITH DateRange AS (\n" +
"    SELECT\n" +
"        DATEADD(DAY, number, DATEADD(DAY, -6, CAST(GETDATE() AS DATE))) AS sale_date\n" +
"    FROM\n" +
"        master.dbo.spt_values\n" +
"    WHERE\n" +
"        type = 'P'\n" +
"        AND number BETWEEN 0 AND 6\n" +
")\n" +
"\n" +
"-- Kết hợp bảng DateRange với dữ liệu Payment và tính tổng\n" +
"SELECT\n" +
"    dr.sale_date AS sale_date,\n" +
"    COALESCE(SUM(p.total), 0) AS total_quantity\n" +
"FROM\n" +
"    DateRange dr\n" +
"LEFT JOIN\n" +
"    Payment p ON dr.sale_date = CONVERT(DATE, p.createTime)\n" +
"GROUP BY\n" +
"    dr.sale_date\n" +
"ORDER BY\n" +
"    dr.sale_date;";

            stmt = conn.prepareStatement(sql);
            resultSet = stmt.executeQuery();

            while (resultSet.next()) {
                Payment payment = new Payment();

                payment.setCreateTime(resultSet.getDate("sale_date"));
                payment.setTotal(resultSet.getInt("total_quantity"));

                paymentSummaries.add(payment);
            }
        } catch (SQLException e) {
            // Xử lý lỗi truy vấn hoặc ngoại lệ
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PaymentDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng tài nguyên: resultSet, stmt và conn
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                // Xử lý lỗi đóng kết nối
                e.printStackTrace();
            }
        }

        return paymentSummaries;
    }

    public boolean CancleProductStatus(String cartID,String note ) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("UPDATE Delivery\n"
                        + "SET Status = 5\n"
                        + "FROM Delivery\n"
                        + "INNER JOIN Payment ON Delivery.deliveryID = Payment.deliveryID\n"
                        + "WHERE Payment.cartID = ?;");

                stm.setString(1, cartID);
                check = stm.executeUpdate() > 0;
                 stm = con.prepareStatement("UPDATE Cart\n"
                        + "SET note = ?\n"
                        + "FROM Cart\n" 
                        + "WHERE cartID = ?;");
                 stm.setString(1, note);
                 stm.setString(2, cartID);
                   check = stm.executeUpdate() > 0;
                   
                stm = con.prepareStatement("UPDATE Payment SET paymentStatus = 3 ");
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
        try (Connection con = DBContext.getConnection(); PreparedStatement updateDeliveryStatus = con.prepareStatement(
                " UPDATE Delivery \n"
                + "               SET Status = ?\n"
                + "              FROM Delivery  \n"
                + "              WHERE Delivery.deliveryID  = ?"); PreparedStatement updatePaymentStatus = con.prepareStatement(
                        "UPDATE payment "
                        + "SET paymentStatus = 1 "
                        + "WHERE EXISTS ( "
                        + "    SELECT 1 "
                        + "    FROM delivery "
                        + "    WHERE delivery.deliveryID = payment.deliveryID "
                        + "    AND delivery.status = 4);")) {

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
                        + "    d.[status]  as deli \n"
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
                     payment.setDelivery(b);
                    b.setStatus(rs.getInt("deli"));
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

     public List<Payment> getidBooking(int id) throws SQLException {
        List<Payment> list = new ArrayList<>(); // Khởi tạo đối tượng ProductDTO

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT  \n" +
"    p.[paymentID],  \n" +
"    p.[createTime],  \n" +
"    p.[voucherID],  \n" +
"    p.[total],  \n" +
"    p.[paymentStatus],  \n" +
"    p.[deliveryID],  \n" +
"    p.[cartID],  \n" +
"    p.[bookingID],  \n" +
"    p.[cusPhone],  \n" +
"    p.[cusAddress],  \n" +
"    p.[cusName],  \n" +
"   f.[accountID],  \n" +
"    d.[intendtime],f.status,  \n" +
"    d.[status] as deli \n" +
"FROM  \n" +
"    payment AS p  \n" +
"   \n" +
"JOIN  \n" +
"    BookingRequest AS f  \n" +
"    ON  \n" +
"    f.[bookingID] = p.[bookingID]  \n" +
"JOIN  \n" +
"    Delivery AS d  \n" +
"    ON  \n" +
"    p.[deliveryID] = d.[deliveryID]  \n" +
"WHERE f.[accountID] = ?\n" +
"ORDER BY p.[paymentID] DESC; ");

                stm.setInt(1, id);
                rs = stm.executeQuery();

                while (rs.next()) {
                    // Tạo một đối tượng ProductDTO và thiết lập dữ liệu từ ResultSet
                    // Khởi tạo đối tượng Payment
                    Payment payment = new Payment();
                    Account acc = new Account();
                    Voucher vu = new Voucher();
                    BookingRequest a = new BookingRequest();
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
                    a.setId(rs.getInt("bookingID"));
                    payment.setBookingRequest(a);
                    payment.setCusPhone(rs.getInt("cusPhone"));
                    payment.setCusAddress(rs.getString("cusAddress"));
                    payment.setName(rs.getString("cusName"));
                    acc.setId(rs.getInt("accountID"));
                    payment.setAcc(acc);
                    b.setIntendTime(rs.getDate("intendtime"));
                    a.setStatus(rs.getInt("status"));
                     payment.setBookingRequest(a);
                    b.setStatus(rs.getInt("deli"));
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
    public void insertCheckout(String name, int bookingID, String address, String phone, float discountTotal, int status) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement insertdeliveryIDQuerys = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();

            if (con != null) {
                // Tạo một bản ghi mới trong bảng Delivery
                String insertdeliveryIDQuery = "INSERT INTO Delivery (status, intendTime) VALUES (?, DATEADD(DAY, 20, GETDATE()))";
                insertdeliveryIDQuerys = con.prepareStatement(insertdeliveryIDQuery);
                insertdeliveryIDQuerys.setInt(1, 1); // status
                insertdeliveryIDQuerys.executeUpdate();

                // Lấy pid của đơn hàng mới nhất
                String getdeliveryIDQuery = "SELECT TOP 1 deliveryID FROM Delivery ORDER BY deliveryID DESC";
                statement = con.prepareStatement(getdeliveryIDQuery);
                rs = statement.executeQuery();

                int pid = 0; // Khởi tạo deliveryID mặc định

                if (rs.next()) {
                    pid = rs.getInt("deliveryID");
                }

                // Tạo một bản ghi mới trong bảng Payment
                String insertpaymentDetailsQuery = "INSERT INTO Payment ([createTime], feeShip, [total], [paymentStatus], [deliveryID], [bookingID], [cusPhone], [cusAddress], [cusName]) VALUES (GETDATE(), 30, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement insertpaymentDetailsStmt = con.prepareStatement(insertpaymentDetailsQuery);
                insertpaymentDetailsStmt.setDouble(1, discountTotal);
                insertpaymentDetailsStmt.setInt(2, status);
                insertpaymentDetailsStmt.setInt(3, pid);
                insertpaymentDetailsStmt.setInt(4, bookingID);
                insertpaymentDetailsStmt.setString(5, phone);
                insertpaymentDetailsStmt.setString(6, address);
                insertpaymentDetailsStmt.setString(7, name);
                insertpaymentDetailsStmt.executeUpdate();

                String updatestatusbooking = "UPDATE BookingRequest SET status = 3 WHERE bookingID = ?";
                statement = con.prepareStatement(updatestatusbooking);
                statement.setInt(1, bookingID); // Đặt giá trị của bookingID
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi trong quá trình thực hiện đơn hàng: " + e.getMessage());
        } finally {
            // Đóng tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (insertdeliveryIDQuerys != null) {
                insertdeliveryIDQuerys.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
