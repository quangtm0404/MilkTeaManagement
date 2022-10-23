/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import minhquang.model.product.ProductDTO;
import minhquang.utils.DBUtils;

/**
 *
 * @author MinhQuang
 */
public class OrderDetailDAO {
    
    private static final String CREATEORDERDETAIL = "INSERT INTO tblOrderDetail( orderID, productID, quantity, price) VALUES ( ?, ?, ?, ?)";

    public boolean createOrderDetail(ProductDTO item, int orderID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(CREATEORDERDETAIL);
                
                ptm.setInt(1, orderID);
                ptm.setString(2, item.getProductID());
                ptm.setInt(3, item.getQuantity());
                ptm.setFloat(4, (float)item.getPrice());
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
    
    
}
