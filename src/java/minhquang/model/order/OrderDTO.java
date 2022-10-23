/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.order;

import java.sql.Date;

/**
 *
 * @author MinhQuang
 */
public class OrderDTO {
    private int orderID;
    private String userID;
    private Date createDate;
    private float total;

    public OrderDTO() {
    }
    
    public OrderDTO(int orderID, Date createDate, float total) {
        this.orderID = orderID;
        this.createDate = createDate;
        this.total = total;
    }
    
    public OrderDTO(int orderID,String userID, Date createDate, float total) {
        this.orderID = orderID;
        this.createDate = createDate;
        this.total = total;
    }
    public OrderDTO(int orderID, String userID, Date createDate) {
        this.orderID = orderID;
        this.userID = userID;
        this.createDate = createDate;
        this.total = 0;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    
    
    
}
