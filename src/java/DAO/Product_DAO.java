/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB_Connecttion.DB_Connection;
import MODEL.Product_Model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;  

/**
 *
 * @author Thinkpad
 */
public class Product_DAO {

    public List<Product_Model> getProductsByCategory(int categoryId) throws Exception {

        List<Product_Model> productList = new ArrayList<>();

        Connection con = null;
        PreparedStatement stm = null;
        String sql = null;
        ResultSet rs = null;

        try {

            con = DB_Connection.getConnection();
            if (con != null) {
                //2 create SQL String
                sql = "SELECT * FROM Product WHERE category_id = ? ";

            }
            // 3 Create statement Object
            stm = con.prepareStatement(sql);
            stm.setInt(1, categoryId);

            // 4 Excute query
            rs = stm.executeQuery();
            while (rs.next()) {

                int product_id = rs.getInt("product_id");

                String name = rs.getString("name");

                int status = rs.getInt("status");

                String size = rs.getString("size");

                double price = rs.getDouble("price");

                int stock = rs.getInt("stock_quantity");

                String des = rs.getString("description");

                String image = rs.getString("image");

                // 5.1 get data from Result set
                // 5.2 set data to DTO properties
                Product_Model dto = new Product_Model(product_id, categoryId, name, status, size, price, stock, des, image);

                productList.add(dto);
                
               
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();;
            }
            if (con != null) {
                con.close();
            }
        }

        return productList;

    }
    
    
     public Product_Model getProductById(int productId) throws SQLException, ClassNotFoundException {
        Product_Model product = null;
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            con = DB_Connection.getConnection();
            String sql = "SELECT * FROM Product WHERE product_id = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, productId);
            rs = statement.executeQuery();

            if (rs.next()) {
               
                int id = rs.getInt("product_id");
                int categoryId = rs.getInt("category_id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                String size = rs.getString("size");
                double price = rs.getDouble("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String description = rs.getString("description");
                String image = rs.getString("image");
                
                product = new Product_Model(id, categoryId, name, status, size, price, stockQuantity, description, image);
                // Set other product properties as needed
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            if (con != null) {
                con.close();
            }
        }

        return product;
    }
}
    
   
    
    

