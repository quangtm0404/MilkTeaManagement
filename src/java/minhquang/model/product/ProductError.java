/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhquang.model.product;

/**
 *
 * @author MinhQuang
 */
public class ProductError {

    private String productID;
    private String productName;
    private double price;
    private String image;
    private String description;
    private String cateID;
    private int quantity;

    public ProductError() {
        this.productID = "";
        this.productName = "";
        this.price = 0;
        this.image = "";
        this.description = "";
        this.cateID = "";
        this.quantity = 0;
    }

    public ProductError(String productID, String productName, double price, String image, String description, String cateID, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.image = image;
        this.description = description;
        this.cateID = cateID;
        this.quantity = quantity;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;

    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productID=" + productID + ", productName=" + productName + ", price=" + price + ", image=" + image + ", description=" + description + ", cateID=" + cateID + '}';
    }

}

