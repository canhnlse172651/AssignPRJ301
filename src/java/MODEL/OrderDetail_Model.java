/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author LA DAT
 */
public class OrderDetail_Model {
    private int orderId;
    private int productId;
    private int quantityDetail;
    private int rating;
    private double total;

    public OrderDetail_Model(int orderId, int productId, int quantityDetail, int rating, double total) {
        this.orderId = orderId;
        this.productId = productId;
        this.quantityDetail = quantityDetail;
        this.rating = rating;
        this.total = total;
    }
    public OrderDetail_Model() {
       
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantityDetail() {
        return quantityDetail;
    }

    public void setQuantityDetail(int quantityDetail) {
        this.quantityDetail = quantityDetail;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
}
