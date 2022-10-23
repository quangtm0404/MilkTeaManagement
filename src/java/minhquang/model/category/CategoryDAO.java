/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import minhquang.utils.DBUtils;

/**
 *
 * @author MinhQuang
 */
public class CategoryDAO {
    public static final String ALLCATEGORY = "SELECT cateID, cateName FROM tblCategories";
    
    public List<CategoryDTO> getListCategory() throws SQLException {
        List<CategoryDTO> cateList = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(ALLCATEGORY);
            rs = ptm.executeQuery();
            while(rs.next()) {
                String cateID = rs.getString("cateID");
                String cateName = rs.getString("cateName");
               
                cateList.add(new CategoryDTO(cateID, cateName));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        
        
        return cateList;
    }
    
   
}
