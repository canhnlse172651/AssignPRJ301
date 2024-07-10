/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

import java.util.Date;

/**
 *
 * @author LA DAT
 */
public class Orders_Model {

    private int orderId;
    private int userId;
    private int status;
    private Date orderDate;
    private Date deliveryDate;
    private double totalPrice;
    private String fullName;
    private String paymentType;
    private boolean paymentStatus;
    private String cardNumber;
    private Date paymentDate;
    private String bankBranding;
    private String cardholderName;

    // Constructor
    public Orders_Model() {
    }

    public Orders_Model(int orderId, int userId, int status, Date orderDate, Date deliveryDate, double totalPrice) {
        this.orderId = orderId;
        this.userId = userId;
        this.status = status;
        this.orderDate = orderDate;
        this.deliveryDate = deliveryDate;
        this.totalPrice = totalPrice;
    }

    public Orders_Model(int orderId, int userId, int status, Date orderDate, Date deliveryDate, double totalPrice,
            String fullName, String paymentType, boolean paymentStatus, String cardNumber, Date paymentDate,
            String bankBranding, String cardholderName) {
        this.orderId = orderId;
        this.userId = userId;
        this.status = status;
        this.orderDate = orderDate;
        this.deliveryDate = deliveryDate;
        this.totalPrice = totalPrice;
        this.fullName = fullName;
        this.paymentType = paymentType;
        this.paymentStatus = paymentStatus;
        this.cardNumber = cardNumber;
        this.paymentDate = paymentDate;
        this.bankBranding = bankBranding;
        this.cardholderName = cardholderName;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public boolean getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(boolean paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getBankBranding() {
        return bankBranding;
    }

    public void setBankBranding(String bankBranding) {
        this.bankBranding = bankBranding;
    }

    public String getCardholderName() {
        return cardholderName;
    }

    public void setCardholderName(String cardholderName) {
        this.cardholderName = cardholderName;
    }

    // toString method
    @Override
    public String toString() {
        return "OrderDetail{"
                + "orderId=" + orderId
                + ", userId=" + userId
                + ", status='" + status + '\''
                + ", orderDate=" + orderDate
                + ", deliveryDate=" + deliveryDate
                + ", totalPrice=" + totalPrice
                + ", fullName='" + fullName + '\''
                + ", paymentType='" + paymentType + '\''
                + ", paymentStatus='" + paymentStatus + '\''
                + ", cardNumber='" + cardNumber + '\''
                + ", paymentDate=" + paymentDate
                + ", bankBranding='" + bankBranding + '\''
                + ", cardholderName='" + cardholderName + '\''
                + '}';
    }
}
