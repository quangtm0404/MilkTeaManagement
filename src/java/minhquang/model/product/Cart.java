/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.product;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author MinhQuang
 */
public class Cart {
    private Map<String, ProductDTO> cart;

    public Cart() {
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }
    
    public boolean addToCart(ProductDTO item) {
        boolean check = false;
        
        if(this.cart == null) this.cart = new HashMap<>();
        if(this.cart.containsKey(item.getProductID())) {
            int curQuantity = this.cart.get(item.getProductID()).getQuantity();
            item.setQuantity(curQuantity + item.getQuantity());
        }
        this.cart.put(item.getProductID(), item);
        check = true;
        return check;
    }
    
    public double getTotalPrice() {
        double price = 0;
        if(this.cart != null) {
            for (ProductDTO item : this.cart.values()) {
                price += item.getPrice() * item.getQuantity();
            }
        }
        return price;
    }
    
    public boolean remove(String productID) {
        boolean check = false;
        if(this.cart != null) {
            if(this.cart.containsKey(productID)) {
                this.cart.remove(productID);
                check = true;
            }
        }
        
        return check;
    }
    
    public boolean edit(String id, int quantity) {
        boolean check = false;
        
         if(this.cart != null) {
            if(this.cart.containsKey(id)) {
                this.cart.get(id).setQuantity(quantity);
                check = true;
                
            }
        }
        
        return check;
    }
    
    public boolean checkValid() throws SQLException {
        boolean check = true;
        ProductDAO productDao = new ProductDAO();
        for (ProductDTO item : cart.values()) {
            if(item.getQuantity() > productDao.getProductByID(item.getProductID()).getQuantity()) check = false;
        }
        
        return check;
    }
    
}
