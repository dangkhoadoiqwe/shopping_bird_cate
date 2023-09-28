/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.UserDTO;
import ULTILS.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author MSI AD
 */
public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    
   
   

    
    public void signUpAccount(String username, String fullName, String email, String gender, Date dob, String phone, String password) {
        String query = "INSERT INTO Customers VALUES(?,?,?,?,?,?,?,NULL,'assets/img/user_image_default.png',1,4)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareCall(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setDate(5, dob);
            ps.setString(6, new String(fullName.getBytes("UTF-8"), "UTF-8"));
            ps.setString(7, gender);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    
    
   public UserDTO checkExistAccount(String username) {
    String query = "SELECT * FROM Customers WHERE email = ?";
    try (
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
    ) {
        ps.setString(1, username);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return new UserDTO(
                    rs.getInt("ID"),
                    rs.getString("FirstName"),
                    rs.getString("LastName"),
                    rs.getString("Email"),
                    rs.getString("Password"),
                    rs.getString("Address"),
                    rs.getString("Phone"),
                    rs.getString("Roles"),
                    rs.getInt("Status")
                );
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}


 public UserDTO checkExistEmail(String email) {
    String query = "SELECT * FROM Customers WHERE email = ?";
    try (
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
    ) {
        ps.setString(1, email);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return new UserDTO(
                    rs.getInt("ID"),
                    rs.getString("FirstName"),
                    rs.getString("LastName"),
                    rs.getString("Email"),
                    rs.getString("Password"),
                    rs.getString("Address"),
                    rs.getString("Phone"),
                    rs.getString("Roles"),
                    rs.getInt("Status")
                );
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

   public UserDTO checkExistPhone(String phone) {
    String query = "SELECT * FROM Customers WHERE phone = ?";
    try (
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
    ) {
        ps.setString(1, phone);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return new UserDTO(
                    rs.getInt("ID"),
                    rs.getString("FirstName"),
                    rs.getString("LastName"),
                    rs.getString("Email"),
                    rs.getString("Password"),
                    rs.getString("Address"),
                    rs.getString("Phone"),
                    rs.getString("Roles"),
                    rs.getInt("Status")
                );
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

  
    public UserDTO login(String username, String password) {
         UserDTO user = null;
    String query = "SELECT * FROM Customers WHERE Email = ? AND Password = ? AND status = 1";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();
        if (rs.next()) {
            user = new UserDTO(
                rs.getInt("CustomerID"),
                rs.getString("FirstName"),
                rs.getString("LastName"),
                rs.getString("Email"),
                rs.getString("Password"),
                rs.getString("Address"),
                rs.getString("PhoneNumber"),
                rs.getString("Roles"),
                rs.getInt("status")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database connections here
    }
    return user;
}


    private static final String LOGIN_GOOGLE = "SELECT * FROM Customers WHERE email = ?";

   public UserDTO checkLogin(String email) throws SQLException {
    UserDTO user = null;
    try (
        Connection conn = DBContext.getConnection();
        PreparedStatement ptm = conn.prepareStatement(LOGIN_GOOGLE);
    ) {
        ptm.setString(1, email);
        try (ResultSet rs = ptm.executeQuery()) {
            if (rs.next()) {
                user = new UserDTO(
                    rs.getInt("ID"),
                    rs.getString("FirstName"),
                    rs.getString("LastName"),
                    rs.getString("Email"),
                    rs.getString("Password"),
                    rs.getString("Address"),
                    rs.getString("Phone"),
                    rs.getString("Roles"),
                    rs.getInt("Status")
                );
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return user;
}

   

    public void changePasswordByEmail(String password, String email) {
        String query = "UPDATE Customers SET password = ? WHERE email = ? AND status = 1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    

    public String getEmailByUsername(String user_name) {
        String email = "";
        String query = "SELECT email FROM Customers WHERE LastName = ? AND status = 1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                email = rs.getString("email");
            }
        } catch (Exception e) {
        }
        return email;
    }

    public String getPhoneByUsername(String user_name) {
        String name = "";
        String query = "SELECT phone FROM Customers WHERE user_name = ? AND status = 1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                name = rs.getString("phone");
            }
        } catch (Exception e) {
        }
        return name;
    }

    public String getFullNameByUsername(String user_name) {
        String name = "";
        String query = "SELECT fullname FROM Customers WHERE user_name = ? AND status = 1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                name = rs.getString("fullname");
            }
        } catch (Exception e) {
        }
        return name;
    }

   
}
