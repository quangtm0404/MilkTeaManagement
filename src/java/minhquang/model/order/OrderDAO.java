/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import minhquang.utils.DBUtils;

/**
 *
 * @author MinhQuang
 */
public class OrderDAO {

    
    private static final String CREATEORDER = "INSERT INTO tblOrders( userID, orderDate, total) VALUES( ?, ?, ?)";
    private static final String GETORDERID = "SELECT MAX(orderID) AS orderID FROM tblOrders";
    private static final String GETORDERINFO = "SELECT orderID, orderDate, total FROM tblOrders WHERE orderID = (SELECT MAX(orderID) AS [OrderID] FROM tblOrders)";

    public int createOrder(String userID, float total) throws SQLException {
        int oID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATEORDER);
               
                ptm.setString(1, userID);
                ptm.setObject(2, new Date(Calendar.getInstance().getTime().getTime()));
                ptm.setFloat(3, total);
                if (ptm.executeUpdate() > 0) {
                    ptm = conn.prepareStatement(GETORDERID);
                    rs = ptm.executeQuery();
                    if(rs.next()) oID = rs.getInt("orderID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            
        }

        return oID;
    }
    
    public OrderDTO createOrderV2(String userID, float total) throws SQLException {
        OrderDTO order = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATEORDER);
               
                ptm.setString(1, userID);
                ptm.setObject(2, new Date(Calendar.getInstance().getTime().getTime()));
                ptm.setFloat(3, total);
                if (ptm.executeUpdate() > 0) {
                    ptm = conn.prepareStatement(GETORDERINFO);
                    rs = ptm.executeQuery();
                    if(rs.next()) {
                        int orderID = rs.getInt("orderID");
                        Date orderDate = rs.getDate("orderDate");
                        order = new OrderDTO(orderID, userID ,orderDate, total);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            
        }
        return order;
    }
}
