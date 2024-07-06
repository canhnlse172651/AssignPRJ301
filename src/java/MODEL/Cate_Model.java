/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author Thinkpad
 */
public class Cate_Model {

    private int categoryId;
    private String name;
    private String image;
    private String status;

    // Constructors
    public Cate_Model(int categoryId, String name, String image, String status) {
        this.categoryId = categoryId;
        this.name = name;
        this.image = image;
        this.status = status;
    }

    // Getters and setters
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // toString method (optional for debugging purposes)
    @Override
    public String toString() {
        return "CategoryDTO{"
                + "categoryId=" + categoryId
                + ", name='" + name + '\''
                + ", image='" + image + '\''
                + ", status='" + status + '\''
                + '}';
    }
}