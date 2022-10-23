/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.role;

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
public class RoleDAO {
    private static final String GETALLROLE = "SELECT roleID, roleName FROM tblRoles";
    
    public List<RoleDTO> getAllRole() throws SQLException {
       List<RoleDTO> roleList = new ArrayList();
       Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GETALLROLE);
            rs = ptm.executeQuery();
            while(rs.next()) {
                String roleID = rs.getString("roleID");
                String roleName = rs.getString("roleName");
                roleList.add(new RoleDTO(roleID, roleName));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
       
       
       return roleList;
    }
}
