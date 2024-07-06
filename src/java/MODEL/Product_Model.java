/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author Thinkpad
 */
public class Product_Model {
    private int id;
    private int categoryId;
    private String name;
    private int status;
    private String size;
    private double price;
    private int stockQuantity;
    private String description;
    private String image;

    // Constructors
    public Product_Model() {
    }

    public Product_Model(int id, int categoryId, String name, int status, String size, double price, int stockQuantity, String description, String image) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.status = status;
        this.size = size;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.description = description;
        this.image = image;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    // toString method for debugging
    @Override
    public String toString() {
        return "Product_DTO{" +
                "id=" + id +
                ", categoryId=" + categoryId +
                ", name='" + name + '\'' +
                ", status=" + status +
                ", size='" + size + '\'' +
                ", price=" + price +
                ", stockQuantity=" + stockQuantity +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
