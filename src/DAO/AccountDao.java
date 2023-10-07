/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Account;
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
public class AccountDao {

    public Account getAccount(String username, String password) {
        try {
            try (Connection con = DBContext.getConnection()) {
                if (con != null) {
                    String sql = "SELECT * FROM Account WHERE name = ? and password = ?";
                    try (PreparedStatement stm = con.prepareStatement(sql)) {
                        stm.setString(1, username);
                        stm.setString(2, password);
                        try (ResultSet rs = stm.executeQuery()) {
                            if (rs.next()) {
                                username = rs.getString(1);
                                password = rs.getString(2);
                                int role = rs.getInt(3);
                                Account acc = new Account(role, sql, password, sql, role, password, role, role, role);
                                return acc;
                            }
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return null;
    }
     private static final String GET_allCus = "SELECT accountID, email, name, profilePhoto, role, phone, accountStatus FROM Account WHERE role = 2";
      public static List<Account> getAllCus() throws SQLException {
        List<Account> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_allCus);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Account acc = new Account();
                    acc.setId(rs.getInt(1));
                    acc.setEmail(rs.getString(2));
                    acc.setName(rs.getString(3));
                    acc.setProfilePhoto(rs.getString(4));
                    acc.setRole(rs.getInt(5));
                    acc.setPhone(rs.getInt(6));
                    acc.setStatus(rs.getInt(7));
                    list.add(acc);
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
        private static final String BAN_ACCOUNT = "UPDATE Account SET accountStatus = ? WHERE accountID = ?";
         public boolean banAccount(int id, int status) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(BAN_ACCOUNT);
                stm.setInt(1, status);
                stm.setInt(2, id);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }     
        return check;
    }
          private static final String FIND_ACCOUNT_BY_OPTION = "SELECT * FROM dbo.tblAccount\n";
          public static ArrayList<Account> findAccByOption(String txtSearch, String searchBy) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Account> list = new ArrayList<>();
        try {
            con = DBContext.getConnection();
            if (con != null) {
                String sql = FIND_ACCOUNT_BY_OPTION;
                if (searchBy.equalsIgnoreCase("byName")) {
                    sql = sql + "where name like ?";
                } else if (searchBy.equalsIgnoreCase("byEmail")) {
                    sql = sql + "where email like ?";
                } else {
                    sql = sql + "where phone like ?";
                }
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + txtSearch + "%");
                rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int accountID = rs.getInt("accountID");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String password = rs.getString("password");
                        String phone = rs.getString("phone");
                        int accountStatus = rs.getInt("accountStatus");
                        Account acc = new Account(accountID, email, password, name, accountID, phone, accountStatus, accountID, accountID);
                        list.add(acc);
                    }
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
