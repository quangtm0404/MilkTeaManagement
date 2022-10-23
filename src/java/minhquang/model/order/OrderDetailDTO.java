/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.order;

/**
 *
 * @author MinhQuang
 */
public class OrderDetailDTO {
    private int detailID;
    private int orderID;
    private String productID;
    private double price;
    private int quantity;

    public OrderDetailDTO() {
        this.detailID = 0;
        this.orderID = 0;
        this.productID = "";
        this.price = 0;
        this.quantity = 0;
    }

    public OrderDetailDTO(int detailID, int orderID, String productID, double price, int quantity) {
        this.detailID = detailID;
        this.orderID = orderID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
    }

    
    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
