/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

import DAO.Product_DAO;

/**
 *
 * @author Thinkpad
 */
public class Cart_Model {
    
     int productId;
     int userId;
    int quantity;
   String productName;
   String productImage;
   int stockQuantity;
   double price;

    public Cart_Model(int productId, int userId, int quantity, String productName, String productImage, int stockQuantity, double price) {
        this.productId = productId;
        this.userId = userId;
        this.quantity = quantity;
        this.productName = productName;
        this.productImage = productImage;
        this.stockQuantity = stockQuantity;
        this.price = price;
    }
   
   
    
    
    // Constructors
    public Cart_Model() {}
     public Cart_Model(int productId, int userId, int quantity) {
        this.productId = productId;
        this.userId = userId;
        this.quantity = quantity;
     }

    public String getProductName() {
        return productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public double getPrice() {
        return price;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

  
    // Getters and setters
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Methods for database operations
   
    
}
