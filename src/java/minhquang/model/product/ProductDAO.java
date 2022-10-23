/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.product;

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
public class ProductDAO {
    private static final String GETALLPRODUCTS = "SELECT productID, productName, price, [image], [description], cateID, [quantity] FROM tblProducts ORDER BY productID";
    private static final String SEARCHPRODUCTBYCATE = "SELECT productID, productName, price, [image], [description], [quantity] FROM tblProducts"
            + " WHERE cateID = ? ";
    private static final String SEARCH = "SELECT productID, productName, price, [image], [description], cateID, [quantity] FROM tblProducts WHERE productName LIKE ?";
    private static final String GETTOTALPRODUCTS = "SELECT COUNT(productID) FROM tblProducts";
    private static final String DELETE = "DELETE FROM tblProducts WHERE productID = ?";
    private static final String UPDATE = "UPDATE tblProducts SET productName = ?, [price] = ?, [image] = ?, [description] = ?, cateID = ?, [quantity] = ? WHERE productID = ?";
    private static final String ADD = "INSERT INTO tblProducts (productID, productName, [price], [image], [description], cateID, [quantity]) VALUES (?,?,?,?,?,?,?)";
    private static final String SEARCHBYID = "SELECT productName, price, [image], [description], cateID, [quantity] FROM tblProducts WHERE productID = ? ";
    private static final String UPDATEQUANTITY = "UPDATE tblProducts SET [quantity] = ? WHERE productID = ?";
    private static final String GETQUANTITY = "SELECT [quantity] FROM tblProducts WHERE productID = ?";
    private static final String CHECKEXISTID = "SELECT productName FROM tblProducts WHERE productID = ?";
    private static final String GETBESTSELLERPRODUCT = "SELECT productID, productName, price, [image], description, cateID, quantity FROM tblProducts WHERE productID = (SELECT productID FROM \n" +
                                                        " (SELECT productID, COUNT(productID) AS [NoOrder] FROM tblOrderDetail GROUP BY productID HAVING COUNT(productID) \n" +
                                                        " >= ALL(SELECT COUNT(productID) AS [NoOrder] FROM tblOrderDetail GROUP BY productID) ) AS a)";
    
    public boolean updateQuantity(String productID, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(UPDATEQUANTITY);
                ptm.setInt(1, quantity);
                ptm.setString(2, productID);
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
    
    public int getQuantity(String productID) throws SQLException {
        int quantity = -1;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GETQUANTITY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if(rs.next()) quantity = rs.getInt("quantity");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        
        return quantity;
    }
    
    public ProductDTO getProductByID(String productID) throws SQLException {
        ProductDTO p = null;
        Connection conn= null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(SEARCHBYID);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if(rs.next()) {
                    
                    String productName = rs.getString("productName");
                    double price = (double)rs.getFloat("price");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String cateID = rs.getString("cateID");
                    int quantity = rs.getInt("quantity");
                    p = new ProductDTO(productID, productName, price, image, description, cateID, quantity); 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        
        return p;
    }
    public boolean existID(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null; 
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(CHECKEXISTID);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if(rs.next()) {
                    String productName = rs.getString("productName");
                    if(!productName.isEmpty()) check = true;
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    public boolean addProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(ADD);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getProductName());
                ptm.setFloat(3, (float)product.getPrice());
                ptm.setString(4, product.getImage());
                ptm.setString(5, product.getDescription());
                ptm.setString(6, product.getCateID());
                ptm.setInt(7, product.getQuantity());
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
    public boolean updateProduct(ProductDTO updateProduct) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, updateProduct.getProductName());
                ptm.setFloat(2, (float)updateProduct.getPrice());
                ptm.setString(3, updateProduct.getImage());
                ptm.setString(4, updateProduct.getDescription());
                ptm.setString(5, updateProduct.getCateID());
                ptm.setInt(6, updateProduct.getQuantity());
                ptm.setString(7, updateProduct.getProductID());
                if(ptm.executeUpdate() > 0) check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
        }
        
        
        return check;
    }
    
    public boolean deleteProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
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
    
    public List<ProductDTO> getAllProducts() throws SQLException {
        List<ProductDTO> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GETALLPRODUCTS);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = (double)rs.getFloat("price");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String cateID = rs.getString("cateID");
                    int quantity = rs.getInt("quantity");               
                    productList.add(new ProductDTO(productID, productName, price, image, description, cateID, quantity)); 
                }
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs !=null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        
        
        return productList;
    }
    
    public List<ProductDTO> getProductByCate (String cateID) throws SQLException {
        List<ProductDTO> productList = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(SEARCHPRODUCTBYCATE);
                ptm.setString(1, cateID);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = (double)rs.getFloat("price");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    int quantity = rs.getInt("quantity");
                    productList.add(new ProductDTO(productID, productName, price, image, description, cateID, quantity)); 
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        
        return productList;
    }
    
    public List<ProductDTO> getProductByName(String search) throws SQLException {
        List<ProductDTO> pList = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1,"%" + search + "%");
                //ptm.setString(2,"%" + search.toUpperCase() + "%");
                rs = ptm.executeQuery();
                while(rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = (double)rs.getFloat("price");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String cateID = rs.getString("cateID");
                    int quantity = rs.getInt("quantity");
                    pList.add(new ProductDTO(productID, productName, price, image, description, cateID, quantity)); 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        
        return pList;
    }
    public ProductDTO getBestSeller() throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GETBESTSELLERPRODUCT);
                rs = ptm.executeQuery();
                if(rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    double price = (double)rs.getFloat("price");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String cateID = rs.getString("cateID");
                    int quantity = rs.getInt("quantity");
                    product = new ProductDTO(productID, productName, price, image, description, cateID, quantity); 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return product;
    }
    // Dem so luong Products
    public int getTotalProducts() throws SQLException {
        int result = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
            ptm = conn.prepareStatement(GETTOTALPRODUCTS);
            rs = ptm.executeQuery();
            if(rs.next()) {
                result = rs.getInt(1);
            }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        
        
        return result;
    }
    public static void main(String[] args) {
        try {
            ProductDAO dao = new ProductDAO();
            System.out.println(dao.addProduct(new ProductDTO("MT6", "Trà Thái Xanh", 150000, "http..", "ABCD", "ICB", 100)));
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
