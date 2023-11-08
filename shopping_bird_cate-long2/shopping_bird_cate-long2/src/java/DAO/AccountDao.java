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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hailo
 */
public class AccountDao {
private static final String REGIS = "INSERT INTO Account(email, password, name, role, phone, accountStatus, point)VALUES(?, ?, ?, ?, ?, 1, 10)";

     public boolean registerAccount(Account account) throws SQLException {
        String insertQuery = "INSERT INTO Account(email, password, name, role, phone, accountStatus, point) VALUES (?, ?, ?, ?, ?, 1, 10)";
        try (Connection connection = DBContext.getConnection();
             PreparedStatement statement = connection.prepareStatement(insertQuery)) {
            statement.setString(1, account.getEmail());
            statement.setString(2, account.getPassword());
            statement.setString(3, account.getName());
            statement.setInt(4, 1);
            statement.setString(5, account.getPhone());
            

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
      private static final String CHECK_DUPLICATE = "SELECT email FROM Account WHERE email = ? COLLATE SQL_Latin1_General_CP1_CS_AS";

    public boolean checkDuplicate(String email) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(CHECK_DUPLICATE);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }
    private static final String REGISTER = "INSERT INTO Account(email, password, name, role, phone, accountStatus, Address)VALUES(?, ?, ?, ?, ?, 1, ?)";

    public boolean insertAccount(Account acc) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(REGISTER);
                stm.setString(1, acc.getEmail());
                stm.setString(2, acc.getPassword());
                stm.setString(3, acc.getName());
                stm.setInt(4, acc.getRole());
                stm.setString(5, acc.getPhone());
                stm.setString(6, acc.getAddress());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
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
        return check;
    }
    
     private static final String GET_Staff = "SELECT accountID, email, name, profilePhoto, phone, Address, accountStatus, role\n"
            + "         FROM Account\n"
            + "         WHERE role =3";

    public static List<Account>getStaff() throws SQLException {
        List<Account> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(GET_Staff);
                rs = stm.executeQuery();

                while (rs.next()) {
                    Account ac = new Account();
                    ac.setId(rs.getInt("accountID"));
                    ac.setEmail(rs.getString("email"));
                    ac.setName(rs.getString("name"));
                    ac.setProfilePhoto(rs.getString("profilePhoto"));
                    ac.setPhone(rs.getString("phone"));
                    ac.setStatus(rs.getInt("role"));
                    ac.setAddress(rs.getString("Address"));
                        ac.setStatus(rs.getInt("accountStatus"));
                    list.add(ac);
                }
            }
        } catch (SQLException e) {
            throw e;
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
    
     private static final String GET_allCus = "SELECT accountID, email, name, profilePhoto, phone, accountStatus FROM Account WHERE role = 1";

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
                    acc.setPhone(rs.getString(5));
                    acc.setStatus(rs.getInt(6));
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
     private static final String UPDATE_ACCOUNT = "UPDATE Account SET name= ? , email = ? ,password = ?, phone = ?,Address=?,role =?  WHERE accountID = ? ";

    public boolean updateAccount(Account account) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        try {
            con = DBContext.getConnection();
             stm = con.prepareStatement(UPDATE_ACCOUNT);
            if (con != null) {
              stm.setString(1, account.getName());
            stm.setString(2, account.getEmail());
            stm.setString(3, account.getPassword());
            stm.setString(4, account.getPhone());
           stm.setString(5, account.getAddress());
            stm.setInt(6, account.getRole());
           stm.setInt(7, account.getId());
           stm.executeUpdate();
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
      private static final String BAN_ACCOUNT = "UPDATE Account SET accountStatus = ? WHERE accountID = ?";

    public boolean banAccount(int id, int status) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean check = false;
        List<Account> list = new ArrayList<>();
        Account acc = new Account();
        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement(BAN_ACCOUNT);
                stm.setInt(1, status);
                stm.setInt(2, id);
                check = stm.executeUpdate() > 0 ? true : false;
                list.add(acc);
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
    private static final String FIND_ACCOUNT_BY_Staff = "SELECT * FROM Account WHERE (role = 1 OR role = 3)";

    public static ArrayList<Account> findAccByStaff(String txtSearch, String searchBy) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Account> list = new ArrayList<>();
        try {
            con = DBContext.getConnection();
            if (con != null) {
                String sql = FIND_ACCOUNT_BY_Staff; 
                if (searchBy.equalsIgnoreCase("byName")) {
                    sql += " AND name LIKE ?";
                } else if (searchBy.equalsIgnoreCase("byEmail")) {
                    sql += " AND email LIKE ?";
                } else {
                    sql += " AND phone LIKE ?";
                }
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + txtSearch + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    Account ac = new Account();
                    ac.setId(rs.getInt("accountID"));
                    ac.setEmail(rs.getString("email"));
                    ac.setName(rs.getString("name"));
                    ac.setProfilePhoto(rs.getString("profilePhoto"));
                    ac.setPhone(rs.getString("phone"));
                    ac.setRole(rs.getInt("role"));
                    ac.setAddress(rs.getString("Address"));
                    ac.setStatus(rs.getInt("accountStatus"));
                    list.add(ac);
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
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
   private static final String FIND_ACCOUNT_BY_OPTION = "SELECT * FROM Account WHERE role = 4 ";

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
                    sql += "AND name LIKE ?";
                } else if (searchBy.equalsIgnoreCase("byEmail")) {
                    sql += "AND email LIKE ?";
                } else {
                    sql += "AND phone LIKE ?";
                }
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + txtSearch + "%");
                rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        Account acc = new Account();
                        acc.setId(rs.getInt(1));
                        acc.setEmail(rs.getString(2));
                        acc.setName(rs.getString(3));
                        acc.setProfilePhoto(rs.getString(4));
                        acc.setPhone(rs.getString(5));
                        acc.setStatus(rs.getInt(7));
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

    public int updateProfile(Account account) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBContext.getConnection();
            if (con != null) {
                // Định nghĩa truy vấn SQL để cập nhật thông tin tài khoản
                String query = "UPDATE Account SET email=?, name=?, phone=?, profilePhoto=?, Address=? WHERE accountID=?";
                stm = con.prepareStatement(query);

                // Đặt các giá trị tham số trong truy vấn
                stm.setString(1, account.getEmail());
                stm.setString(2, account.getName());
                stm.setString(3, account.getPhone());
                stm.setString(4, account.getProfilePhoto());
                stm.setString(5, account.getAddress());
                stm.setInt(6, account.getId());

                // Thực hiện truy vấn cập nhật
                int rowsAffected = stm.executeUpdate();

                return rowsAffected; // Trả về số dòng bị ảnh hưởng (thường là 1 nếu cập nhật thành công)
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0; // Trả về 0 nếu có lỗi hoặc không có bản ghi nào được cập nhật
    }

public Account getAccountByID(int accountID) throws SQLException {
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    Account account = null;

    try {
        con = DBContext.getConnection();
        if (con != null) {
            stm = con.prepareStatement("SELECT * FROM Account WHERE accountID = ?");
            stm.setInt(1, accountID);
            rs = stm.executeQuery();
            if (rs.next()) {
                account = new Account();
                account.setId(rs.getInt("accountID"));
                account.setName(rs.getString("name"));
                account.setPassword(rs.getString("password"));
                account.setProfilePhoto(rs.getString("profilePhoto"));
                account.setPhone(rs.getString("phone"));
                account.setRole(rs.getInt("role"));
                account.setStatus(rs.getInt("accountStatus"));
                account.setEmail(rs.getString("email"));
                account.setPoint(rs.getInt("point"));
                account.setAddress(rs.getString("Address"));
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
    return account;
}

     public List<Account> getAllacc() throws SQLException {
        List<Account> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBContext.getConnection();
            if (con != null) {
                stm = con.prepareStatement("SELECT  * FROM Account WHERE role = 1 and accountStatus = 1 ");
                rs = stm.executeQuery();
                while (rs.next()) {
                    Account user = new Account();
                    user.setId(rs.getInt("accountID")); 
                    user.setName(rs.getString("name"));
                    user.setPassword(rs.getString("password"));
                    user.setProfilePhoto(rs.getString("profilePhoto"));
                    user.setPhone(rs.getString("phone"));
                    user.setRole(rs.getInt("role"));
                    user.setStatus(rs.getInt("accountStatus"));
                    user.setEmail(rs.getString("email"));
                    user.setPoint(rs.getInt("point"));
                      user.setAddress(rs.getString("Address"));
                    // Thêm user vào danh sách
                    list.add(user);

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

   public Account getAccount(String username, String password) {
        try {
            try (Connection con = DBContext.getConnection()) {
                if (con != null) {
                    String sql = "SELECT * FROM Account WHERE email = ? and Password = ?   ";
                    try (PreparedStatement stm = con.prepareStatement(sql)) {
                        stm.setString(1, username);
                        stm.setString(2, password);
                        try (ResultSet rs = stm.executeQuery()) {
                            if (rs.next()) {
                                Account acc = new Account();
                                acc.setId(rs.getInt(1));
                                acc.setName(rs.getString(2));
                                acc.setPassword(rs.getString(3));
                                acc.setProfilePhoto(rs.getString(4));
                                acc.setPhone(rs.getString(5).trim());
                                acc.setRole(rs.getInt(6));
                                acc.setStatus(rs.getInt(7));
                                acc.setEmail(rs.getString(8));
                                acc.setPoint(rs.getInt(9));  
                                acc.setAddress(rs.getString(10));
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
}
