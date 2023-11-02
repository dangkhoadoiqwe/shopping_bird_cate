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
 * Đối tượng DAO cho Feedback
 */
public class FeedbackDao {

    // Các phương thức DAO hiện có
    public void addRatingAndFeedback(int productID, int accountID, int rating, String comment, int carID) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();

            if (con != null) {
                String insertSql = "UPDATE Feedback\n"
                        + "SET rating = ?, comment = ?, feedbackStatus = 1, createTime = GETDATE()\n"
                        + "WHERE cartDetailID = ?;";
                PreparedStatement insertStmt = con.prepareStatement(insertSql);
                insertStmt.setInt(1, rating);
                insertStmt.setString(2, comment);
                insertStmt.setInt(3, productID);
                insertStmt.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Lỗi trong quá trình thực hiện đơn hàng: " + e.getMessage());
        } finally {
            // Đóng tất cả tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public List<Feedback> getALLfeedback(int proid) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Feedback> feedbacks = new ArrayList<>();

        try {
            conn = DBContext.getConnection();
            if (conn != null) {
                String sql = "SELECT f.* , acc.name\n"
                        + "FROM Feedback f\n"
                        + "INNER JOIN CartDetail cd ON f.cartDetailID = cd.cartDetailID\n"
                        + "INNER JOIN Product p ON cd.productID = p.productID\n"
                        + "INNER JOIN Account acc ON acc.accountID = f.accountID\n"
                        + "WHERE   cd.productID =  ?";

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
        } catch (SQLException | ClassNotFoundException ex) {
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
            }
        }

        return feedbacks;
    }

    public List<Feedback> getfeedByPaymentID(int paymentID) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Feedback> products = new ArrayList<>();

        try {
            conn = DBContext.getConnection(); // Khởi tạo kết nối đến cơ sở dữ liệu
            String sql
                    = "SELECT f.* , p.price ,p.productName,p.quantity,p.image\n"
                    + "FROM Feedback f\n"
                    + "INNER JOIN CartDetail cd ON f.cartDetailID = cd.cartDetailID\n"
                    + "INNER JOIN Product p ON cd.productID = p.productID\n"
                    + "WHERE   cd.paymentID = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, paymentID);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Feedback feed = new Feedback();
                Product product = new Product();
                feed.setCreateTime(rs.getDate("createTime"));
                feed.setRating(rs.getInt("rating"));
                feed.setStatus(rs.getInt("feedbackStatus"));
                feed.setCartDetailID(rs.getInt("cartDetailID"));
                feed.setComment(rs.getString("comment"));
                product.setName(rs.getString("productName"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPrice(rs.getFloat("price"));
                product.setImage(rs.getString("image"));
                feed.setProduct(product);
                products.add(feed);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đảm bảo tài nguyên được đóng sau khi sử dụng
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

        return products;
    }

    public double calculateAverageRatingByProductID(int productID) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        double averageRating = 0.0;

        try {
            conn = DBContext.getConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        String query = "SELECT AVG(rating) AS average_rating FROM Feedback WHERE productID = ?";

        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setInt(1, productID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    averageRating = resultSet.getDouble("average_rating");
                }
            }
        } catch (SQLException e) {
        }

        return averageRating;
    }
}
