/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Account;
import DTO.Feedback;
import DTO.Product;
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
public class FeedbackDao {

   public List<Feedback> getALLfeedback(int proid) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    List<Feedback> feedbacks = new ArrayList<>();

    try {
        conn = DBContext.getConnection();
        if (conn != null) {
            String sql = "SELECT f.feedbackID, "
                    + "       f.createTime, "
                    + "       a.name, "
                    + "       f.rating, "
                    + "       f.comment, "
                    + "       f.feedbackStatus "
                    + "FROM Feedback f "
                    + "INNER JOIN Account a ON f.accountID = a.accountID "
                    + "WHERE f.productID = ?";

            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, proid); // Đặt giá trị cho dấu ? trong câu SQL
            rs = stmt.executeQuery();
            while (rs.next()) {
                Feedback b = new Feedback();
                Account c = new Account(); 
                b.setId(rs.getInt("feedbackID"));
                b.setCreateTime(rs.getDate("createTime"));
                c.setName(rs.getString("name"));
                b.setAccount(c);
                b.setRating(rs.getInt("rating"));
                b.setComment(rs.getString("comment"));
                b.setStatus(rs.getInt("feedbackStatus"));
                feedbacks.add(b);
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        // Đảm bảo giải phóng tài nguyên
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

    return feedbacks;
}


   public boolean addRatingAndFeedback(int productID, int accountID, int rating, String comment) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String sql = "INSERT INTO Feedback (productID, createTime, accountID, rating, comment, feedbackStatus) VALUES (?, GETDATE(), ?, ?, ?, 1)";
    
    try {
        conn = DBContext.getConnection(); // Thêm dòng này để thiết lập kết nối
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, productID);
        stmt.setInt(2, accountID);
        stmt.setInt(3, rating);
        stmt.setString(4, comment);
        int rowsAffected = stmt.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }   catch (ClassNotFoundException ex) {
            Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        // Đảm bảo đóng kết nối và các tài nguyên liên quan
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
        return false;
}

}
