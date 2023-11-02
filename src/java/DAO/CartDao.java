/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.CartDetail;
import DTO.Product;
import UTILS.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author hailo
 */
public class CartDao {

    public void closeResources(ResultSet rs, PreparedStatement stm, Connection con) {
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

    public int getCartIdForAccount(Connection con, int accId) {
        try {
            String sql = "SELECT cartID FROM Cart WHERE accountID = ?";
            try (PreparedStatement stm = con.prepareStatement(sql)) {
                stm.setInt(1, accId);
                try (ResultSet rs = stm.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<CartDetail> getListCartDetail(int cartId) {
        List<CartDetail> list = new ArrayList<>();
        try {
            try (Connection con = DBContext.getConnection()) {
                String sql = "SELECT * FROM CartDetail c INNER JOIN Product p ON c.productID = p.productID WHERE cartID = ? and cartStatus = 0";
                try (PreparedStatement stm = con.prepareStatement(sql)) {
                    stm.setInt(1, cartId);
                    try (ResultSet rs = stm.executeQuery()) {
                        while (rs.next()) {
                            CartDetail cartDetail = new CartDetail();
                            Product product = new Product();
                            cartDetail.setCartId(rs.getInt("cartID"));
                            cartDetail.setColor(rs.getString("color"));
                            cartDetail.setId(rs.getInt("cartDetailID"));
                            product.setId(rs.getInt("productID"));
                            product.setName(rs.getString("productName"));
                            product.setPrice(rs.getFloat("price"));
                            product.setImage(rs.getString("image"));
                            cartDetail.setProduct(product);
                            int q = updateAndGetQuantityCartDetail(cartId, product.getId(), rs.getInt("quantity"));
                            cartDetail.setQuantity(q);
                            System.out.println(q);
                            cartDetail.setSize(rs.getString("size"));
                            cartDetail.setStatus(rs.getInt("cartStatus"));
                            list.add(cartDetail);
                        }
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean insertItemToCart(int accId, int productId, int quantity) {
        try {
            try (Connection con = DBContext.getConnection()) {
                int cartId = getCartIdForAccount(con, accId);
                System.out.println("cartID: " + cartId);
                if (cartId == 0) {
                    cartId = createCartForAccount(con, accId);
                }
                System.out.println("newCartID: " + cartId);
                List<CartDetail> list = getListCartDetail(cartId);
                if (list != null) {
                    for (CartDetail cartDetail : list) {
                        if (cartDetail.getProduct().getId() == productId) {
                            cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
                            return updateQuantityCartDetail(con, cartId, productId, cartDetail.getQuantity());
                        }
                    }
                }
                return insertToCartDetail(con, cartId, productId, quantity);
            }
        } catch (SQLException | ClassNotFoundException e) {
        }
        return false;
    }

    public int createCartForAccount(Connection con, int accId) {
        try {
            String sql = "INSERT INTO Cart(accountID) values (?)";
            try (PreparedStatement stm = con.prepareStatement(sql)) {
                stm.setInt(1, accId);
                stm.execute();
                return getCartIdForAccount(con, accId);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public boolean updateQuantityCartDetail(Connection con, int cartId, int productId, int quantity) {
        try {
            String sql = "UPDATE CartDetail SET quantity = CASE\n"
                    + "    WHEN ? > Product.quantity THEN Product.quantity\n"
                    + "    ELSE ?\n"
                    + "END\n"
                    + "FROM CartDetail JOIN Product ON CartDetail.productID = Product.productID\n"
                    + "WHERE CartDetail.cartID = ? AND CartDetail.productID = ?;";
            try (PreparedStatement stm = con.prepareStatement(sql)) {
                stm.setInt(1, quantity);
                stm.setInt(2, quantity);
                stm.setInt(3, cartId);
                stm.setInt(4, productId);
                return stm.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean insertToCartDetail(Connection con, int cartId, int productId, int quantity) {
        try {
            String sql = "INSERT INTO CartDetail(cartID,productID,quantity,cartStatus) values(?,?,?,?)";
            try (PreparedStatement stm = con.prepareStatement(sql)) {
                stm.setInt(1, cartId);
                stm.setInt(2, productId);
                stm.setInt(3, quantity);
                stm.setInt(4, 0);
                return stm.executeUpdate() > 0;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public int updateAndGetQuantityCartDetail(int cartId, int productId, int quantityPush) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            boolean check = updateQuantityCartDetail(con, cartId, productId, quantityPush);
            if (check) {
                String sql = "SELECT quantity FROM CartDetail WHERE cartID = ? and productID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, cartId);
                stm.setInt(2, productId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, stm, con);
        }
        return 0;
    }

    public boolean deleteProductInCart(int cartId, int productId) {
        try {
            try (Connection con = DBContext.getConnection()) {
                String sql = "DELETE FROM CartDetail WHERE cartID = ? and productID = ?";
                try (PreparedStatement stm = con.prepareStatement(sql)) {
                    stm.setInt(1, cartId);
                    stm.setInt(2, productId);
                    return stm.executeUpdate() > 0;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
        }
        return false;
    }

    public int createListCartAndGenerateId(String[] listProductID) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            int listID = generateListCartId(con, stm, rs);
            for (String id : listProductID) {
                String sql = "INSERT INTO ListCartDetail(listID, cartDetailID) values(?,?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, listID);
                stm.setInt(2, Integer.parseInt(id));
                stm.execute();
            }
            return listID;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, stm, con);
        }
        return 0;
    }

    private int generateListCartId(Connection con, PreparedStatement stm, ResultSet rs) {
        try {
            String sql = "SELECT TOP 1 listID FROM ListCartDetail order by listID desc";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

    public void updateStatusCartDetail(int cartDetailId, int status, int paymentID, int acc) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            String updateSql = "UPDATE CartDetail SET cartStatus = ?, paymentID = ? WHERE cartDetailID = ?";
            stm = con.prepareStatement(updateSql);
            stm.setInt(1, status);
            stm.setInt(2, paymentID);
            stm.setInt(3, cartDetailId);
            stm.execute();
            String insertSql = "INSERT INTO Feedback (cartDetailID, createTime, accountID, feedbackStatus) VALUES (?, GETDATE(), ?, 0)";
            stm = con.prepareStatement(insertSql);
            stm.setInt(1, cartDetailId);
            stm.setInt(2, acc);
            stm.execute();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, stm, con);
        }
    }

    public List<Product> getProductByPaymentId(int payId) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Product> list = new ArrayList<>();
        try {
            con = DBContext.getConnection();
            String sql
                    = "SELECT *\n"
                    + "FROM Product p\n"
                    + "JOIN CartDetail cd ON cd.productID = p.productID\n"
                    + "JOIN Payment pay ON pay.paymentID = cd.paymentID \n"
                    + "WHERE pay.paymentID = ?;";
            stm = con.prepareStatement(sql);
            stm.setInt(1, payId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("productName"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPrice(rs.getFloat("price"));
                product.setImage(rs.getString("image"));
                list.add(product);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, stm, con);
        }
        return list;
    }

    public void removeAllFormCart(int accID) {
        try {
            try (Connection con = DBContext.getConnection()) {
                String sql = "DELETE cd FROM CartDetail cd\n"
                        + "JOIN Cart c ON c.cartID = cd.cartID\n"
                        + "JOIN Account a ON a.accountID = c.accountID\n"
                        + "WHERE a.accountID = ?";
                try (PreparedStatement stm = con.prepareStatement(sql)) {
                    stm.setInt(1, accID);
                    stm.execute();
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
