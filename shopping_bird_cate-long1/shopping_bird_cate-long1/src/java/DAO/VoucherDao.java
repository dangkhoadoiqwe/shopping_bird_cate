/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Account;
import DTO.CategoryDTO;
import DTO.Product;
import DTO.Voucher;
import UTILS.DBContext;
import java.sql.Connection;
import java.sql.Date;
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
public class VoucherDao {

    public List<Voucher> searchVouchersByDate(Date startDate, Date endDate) {
        List<Voucher> voucherList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                String query = "SELECT [voucherID]\n"
                        + "      ,[voucherName]\n" 
                        + "      ,[dateStart]\n"
                        + "      ,[dateEnd]\n" 
                         + "      ,[value]\n"  
                         + "      ,[voucherStatus]\n"  
                        + "       FROM Voucher WHERE dateStart >= ? AND dateEnd <= ?";
                stmt = conn.prepareStatement(query);
                stmt.setDate(1, startDate);
                stmt.setDate(2, endDate);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    Voucher voucher = new Voucher();
                    voucher.setId(rs.getInt("voucherID"));
                    voucher.setName(rs.getString("voucherName"));
                    voucher.setDateStart(rs.getDate("dateStart"));
                    voucher.setDateEnd(rs.getDate("dateEnd"));
                    voucher.setCode(rs.getString("value"));
                     voucher.setStatus(rs.getInt("voucherStatus"));
                    // Thêm các trường dữ liệu khác cần thiết

                    voucherList.add(voucher);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return voucherList;
}

    
     public boolean updateVoucher(int voucherID, String voucherName, Date dateStart, Date dateEnd, double value, int voucherStatus) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DBContext.getConnection();
            if (connection != null) {
                String updateQuery = "UPDATE Voucher "
                        + "SET voucherName = ?, "
                        + "dateStart = ?, "
                        + "dateEnd = ?, "
                        + "value = ?, "
                        + "voucherStatus = ? "
                        + "WHERE voucherID = ?";

                preparedStatement = connection.prepareStatement(updateQuery);
                preparedStatement.setString(1, voucherName);
                preparedStatement.setDate(2, new java.sql.Date(dateStart.getTime()));
                preparedStatement.setDate(3, new java.sql.Date(dateEnd.getTime()));
                preparedStatement.setDouble(4, value);
                preparedStatement.setInt(5, 1);
                preparedStatement.setInt(6, voucherID);

                int rowsUpdated = preparedStatement.executeUpdate();

                return rowsUpdated > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
             Logger.getLogger(VoucherDao.class.getName()).log(Level.SEVERE, null, ex);
         } finally {
            // Đảm bảo đóng tài nguyên
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

  public boolean insertVoucher(String voucherName, Date dateStart, Date dateEnd, int value) throws SQLException, ClassNotFoundException {
    try (Connection conn = DBContext.getConnection();
         PreparedStatement stmt = conn.prepareStatement("INSERT INTO Voucher (accountID, voucherName, dateStart, dateEnd, voucherStatus, value, catevoucherID) VALUES (?, ?, ?, ?, 1, ?, 1)")) {
        
        stmt.setInt(1, 1); // Thay thế bằng giá trị thực tế
        stmt.setString(2, voucherName);
        stmt.setDate(3, dateStart);
        stmt.setDate(4, dateEnd);
        stmt.setInt(5, value);
        
        int rowsInserted = stmt.executeUpdate();
        return rowsInserted > 0;
    } catch (SQLException e) {
        // Xử lý hoặc ném lại ngoại lệ
        throw e;
    }
}

   public void updateVoucherStatus(int voucherId, int newStatus) {
    try (Connection conn = DBContext.getConnection();
         PreparedStatement stmt = conn.prepareStatement("UPDATE Voucher SET voucherStatus = ? WHERE voucherID = ?")) {
        stmt.setInt(1, newStatus); // Trạng thái mới
        stmt.setInt(2, voucherId); // ID của voucher cần cập nhật

        int rowsUpdated = stmt.executeUpdate();
        System.out.println(rowsUpdated + " voucher(s) updated.");
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
    }
}


    public int getCoupon(String code, String id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(" select value from [Voucher] where voucherName = ? AND accountID = ?");
                stm.setString(1, code);
                 stm.setString(2, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error user: " + e.getMessage());
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
        return 0;
    }
    public List<Voucher> getAllVoucher() throws SQLException {
    List<Voucher> list = new ArrayList<>();
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    try {
        con = DBContext.getConnection();
        if (con != null) {
            stm = con.prepareStatement("SELECT [voucherID],accountID, voucherName, dateStart, dateEnd, voucherStatus ,value FROM Voucher");
            rs = stm.executeQuery();
            while (rs.next()) {
                Voucher vu = new Voucher();
                Account ac = new Account();
                vu.setId(rs.getInt("voucherID"));
                // Lấy thông tin từ kết quả truy vấn và đặt vào đối tượng Voucher và Account
                ac.setId(rs.getInt("accountID"));
                vu.setAccount(ac);
                vu.setName(rs.getString("voucherName"));
                vu.setDateStart(rs.getDate("dateStart"));
                vu.setDateEnd(rs.getDate("dateEnd"));
                vu.setStatus(rs.getInt("voucherStatus"));
                vu.setCode(rs.getString("value"));
                // Thêm đối tượng Voucher vào danh sách
                list.add(vu);
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
