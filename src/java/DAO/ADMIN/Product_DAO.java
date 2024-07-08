/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.ADMIN;

import DB_Connecttion.DB_Connection;
import MODEL.Cate_Model;
import MODEL.Product_Model;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LA DAT
 */
public class Product_DAO implements Serializable {
    
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet resultSet = null;
    String sql = null;
    
    public List<Product_Model> findAll(int categoryId) throws ClassNotFoundException, SQLException {
        
        List<Product_Model> productList = new ArrayList<>();
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                if (categoryId == 0) {
                    sql = "SELECT p.*, c.name as cateName FROM Product as p JOIN Categories as c ON p.category_id = c.category_id";
                } else {
                    sql = "  SELECT p.*c.name as cateName FROM Product as p JOIN Categories as c ON p.category_id = c.category_id"
                            + "WHERE p.category_id = " + categoryId;
                }
                
                stm = con.prepareStatement(sql);
                resultSet = stm.executeQuery();
                while (resultSet.next()) {
                    int productId = resultSet.getInt("product_id");
                    int cateId = resultSet.getInt("category_id");
                    String name = resultSet.getString("name");
                    String size = resultSet.getString("size");
                    String description = resultSet.getString("description");
                    double price = resultSet.getDouble("price");
                    int quantity = resultSet.getInt("stock_quantity");
                    boolean status = resultSet.getBoolean("status");
                    String image = resultSet.getString("image");
                    String cateName = resultSet.getString("cateName");
                    System.out.println("DAO.ADMIN.Product_DAO.findAll()" + cateName);
                    Cate_Model cate = new Cate_Model();
                    cate.setCategoryId(cateId);
                    cate.setName(cateName);
                    Product_Model dto = new Product_Model(productId, cateId, name, status, size, price, quantity, description, image);
                    dto.setCateModel(cate);
                    dto.setCategoryName(cateName);
                    productList.add(dto);
                    System.out.println("---------------------------------------------------------------------------------------------------------------------------------------SERVLET.ADMIN.PROCUCT.AdminProductServlet.processRequest()");
                    for (Product_Model pro : productList) {
                        System.out.println("Name: " + pro.getName() + " Cate: " + pro.getCateModel().getName());
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return productList;
    }
    
    public boolean insertProduct(Product_Model product) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                String sql = "INSERT INTO Product (category_id, name, status, size, price, stock_quantity, description, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, product.getCategoryId());
                stm.setString(2, product.getName());
                stm.setBoolean(3, true);
                stm.setString(4, product.getSize());
                stm.setDouble(5, product.getPrice());
                stm.setInt(6, product.getStockQuantity());
                stm.setString(7, product.getDescription());
                stm.setString(8, product.getImage());
                int rowsInserted = stm.executeUpdate();
                return rowsInserted > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public Product_Model findOneById(int id) throws ClassNotFoundException, SQLException {
        Product_Model product = new Product_Model();
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                
                sql = "select * "
                        + "from [Product] where product_id = ?";
            }
            
            stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            resultSet = stm.executeQuery();
            while (resultSet.next()) {
                int productId = resultSet.getInt("product_id");
                int cateId = resultSet.getInt("category_id");
                String name = resultSet.getString("name");
                String size = resultSet.getString("size");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("stock_quantity");
                boolean status = resultSet.getBoolean("status");
                String image = resultSet.getString("image");
                product = new Product_Model(productId, cateId, name, status, size, price, quantity, description, image);
            }
        } catch (SQLException e) {
            System.out.println("DAO.ADMIN.Account_DAO.findAll()" + e);
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return product;
    }
    
    public boolean updateProduct(Product_Model product) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "UPDATE Product SET category_id = ?, name = ?, status = ?, size = ?, price = ?, stock_quantity = ?, description = ?, image = ? WHERE product_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, product.getCategoryId());
                stm.setString(2, product.getName());
                stm.setBoolean(3, product.getStatus());
                stm.setString(4, product.getSize());
                stm.setDouble(5, product.getPrice());
                stm.setInt(6, product.getStockQuantity());
                stm.setString(7, product.getDescription());
                stm.setString(8, product.getImage());
                stm.setInt(9, product.getId());
                int rowsUpdated = stm.executeUpdate();
                return rowsUpdated > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public boolean deleteProduct(int categoryId) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                Product_Model product = findOneById(categoryId);
                product.setStatus(false);
                return updateProduct(product);
            }
        } catch (Exception e) {
            System.out.println("DAO.ADMIN.Category_DAO.deleteCategory()" + e);
            return false;
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
