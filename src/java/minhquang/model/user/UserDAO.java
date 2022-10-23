/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import minhquang.utils.DBUtils;

/**
 *
 * @author MinhQuang
 */
public class UserDAO {

    public static final String SIGNUP = "INSERT INTO tblUsers(userID, [username],[password],fullName,[email],roleID, address, phoneNo) VALUES(?,?,?,?,?,?,?,?)";
    public static final String LOGIN = "SELECT userID, userName,fullname, phoneNo, roleID, [address], [password] FROM tblUsers WHERE email = ?";
    private static final String LOGINV2 = "SELECT userID,email,fullname, phoneNo, roleID, [address] FROM tblUsers WHERE username = ? and [password] = ?";
    private static final String GETALL = "SELECT userID,[username], fullName, [email], phoneNo, [address], roleID FROM tblUsers";
    private static final String SEARCH = "SELECT userID, userName,fullName, [email], phoneNo, [address], roleID FROM tblUsers WHERE userName LIKE ?";
    private static final String UPDATE = "UPDATE tblUsers SET [username] = ?, fullName = ?, address = ?, phoneNo = ?, roleID = ? WHERE userID = ?";
    private static final String DELETE = "DELETE FROM tblUsers WHERE userID = ?";
    private static final String US = "USR";
    
    public boolean update(UserDTO updateUser) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, updateUser.getUsername());
                ptm.setString(2, updateUser.getName());
                ptm.setString(3, updateUser.getAddress());
                ptm.setString(4, updateUser.getPhoneNo());
                ptm.setString(5, updateUser.getRoleID());
                ptm.setString(6, updateUser.getId());
                if(ptm.executeUpdate() > 0) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    public boolean Delete(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
                if(ptm.executeUpdate() > 0) check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
         
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        
        return check;
    }
    public boolean signUp(UserDTO googleUser) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SIGNUP);
            ptm.setString(1, googleUser.getId());
            ptm.setString(2, googleUser.getUsername());
            ptm.setString(3, googleUser.getPassword());
            ptm.setString(4, googleUser.getName());
            ptm.setString(5, googleUser.getEmail());
            ptm.setString(6, US);
            ptm.setString(7, googleUser.getAddress());
            ptm.setString(8, googleUser.getPhoneNo());
            ptm.executeUpdate();
            check = true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public UserDTO checkLoginV2(String username, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGINV2);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if(rs.next()) {
                    String userID = rs.getString("userID");
                    String email = rs.getString("email");
                    String fullName = rs.getString("fullName");
                    String phoneNo = rs.getString("phoneNo");
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("address");
                    user = new UserDTO(userID, email, username, password, fullName, address, phoneNo, roleID);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return user;
    }

    public List<UserDTO> search(String search) throws SQLException {
        List<UserDTO> userList = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String username = rs.getString("username");
                    String fullName = rs.getString("fullName");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String phoneNo = rs.getString("phoneNo");
                    String roleID = rs.getString("roleID");
                    userList.add(new UserDTO(userID,username, fullName, email, address, phoneNo, roleID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return userList;

    }

    public List<UserDTO> getAllUser() throws SQLException {
        List<UserDTO> userList = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETALL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String username = rs.getString("username");
                    String name = rs.getString("fullName");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String phoneNo = rs.getString("phoneNo");
                    String roleID = rs.getString("roleID");
                    userList.add(new UserDTO(userID, username ,name, email, address, phoneNo, roleID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return userList;
    }

    public UserDTO checkLogin(UserDTO googleUser) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(LOGIN);
            String goo = googleUser.getEmail();
            ptm.setString(1, googleUser.getEmail());
            rs = ptm.executeQuery();
            if (rs.next()) {
                googleUser.setRoleID(rs.getString("roleID"));
                googleUser.setUsername(rs.getString("username"));
                googleUser.setPassword(rs.getString("password"));
                googleUser.setAddress(rs.getString("address"));
                googleUser.setPhoneNo(rs.getString("phoneNo"));
                user = googleUser;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return user;
    }

    public static void main(String[] args) {
        try {
            UserDTO updateUser = new UserDTO("100129541662209644947", "quangtm0809", "Nhan To", "quangtm0404@gmail.com", "add", "0908070605", "USR");
            System.out.println(new UserDAO().update(updateUser));
            

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
