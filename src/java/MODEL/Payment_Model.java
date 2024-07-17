/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author LA DAT
 */
public class Payment_Model {
    private int paymentId;
    private String cardNumber;
    private String paymentDate;
    private String bank;
    private String owner;
    private boolean status;
    private String paymentType;

    public Payment_Model(int paymentId, String cardNumber, String paymentDate, String bank, String owner, boolean status, String paymentType) {
        this.paymentId = paymentId;
        this.cardNumber = cardNumber;
        this.paymentDate = paymentDate;
        this.bank = bank;
        this.owner = owner;
        this.status = status;
        this.paymentType = paymentType;
    }
    public Payment_Model() {
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }
    
    
}
