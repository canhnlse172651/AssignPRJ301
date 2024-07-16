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
    
     private int productId;
    private int userId;
    private int quantity;
   
     private Product_Model product;
    
    // Constructors
    public Cart_Model() {}
     public Cart_Model(int productId, int userId, int quantity) {
        this.productId = productId;
        this.userId = userId;
        this.quantity = quantity;
     }

    public Cart_Model(int productId, int userId, int quantity, Product_Model product) {
        this.productId = productId;
        this.userId = userId;
        this.quantity = quantity;
        this.product = product;
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
