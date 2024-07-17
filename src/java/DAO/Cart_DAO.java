/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB_Connecttion.DB_Connection;
import MODEL.Cart_Model;
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
 * @author Thinkpad
 */
public class Cart_DAO implements Serializable {

    Connection con;
    PreparedStatement stm;
    ResultSet resultSet;

    public Cart_Model findOneCart(int userId, int productId) throws SQLException, ClassNotFoundException {

        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                String sql = "SELECT * FROM [cart] WHERE user_id = ? AND product_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, userId);
                stm.setInt(2, productId);
                resultSet = stm.executeQuery();
                if (resultSet.next()) {
                    Cart_Model cart = new Cart_Model();
                    cart.setUserId(resultSet.getInt("user_id"));
                    cart.setProductId(resultSet.getInt("product_id"));
                    cart.setQuantity(resultSet.getInt("quantity"));
                    return cart;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
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
        return null;
    }

    public boolean insertCart(Cart_Model cart) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                String sql = "INSERT INTO [cart] (user_id, product_id, quantity) VALUES (?, ?, ?);";
                      
                stm = con.prepareStatement(sql);
                stm.setInt(1, cart.getUserId());
                stm.setInt(2, cart.getProductId());
                stm.setInt(3, 1);
                int rowsInserted = stm.executeUpdate();
                return rowsInserted > 0;
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

    public boolean updateCart(Cart_Model cart) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                String sql = "UPDATE [cart] SET quantity = ? WHERE user_id = ? AND product_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, cart.getQuantity());
                stm.setInt(2, cart.getUserId());
                stm.setInt(3, cart.getProductId());
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

    public List<Cart_Model> getCartsByUserId(int userId) throws SQLException, ClassNotFoundException {
        List<Cart_Model> carts = new ArrayList<>();

        try {
            con = DB_Connection.getConnection();
            String sql = "SELECT c.user_id, c.product_id,c.quantity, p.name AS product_name, p.price, p.image, p.stock_quantity, p.size\n"
                    + "  FROM cart as c JOIN Product as p ON c.product_id = p.product_id \n"
                    + "  WHERE c.user_id = ? and p.status = 1";

            stm = con.prepareStatement(sql);
            stm.setInt(1, userId);

            resultSet = stm.executeQuery();

            while (resultSet.next()) {
                int productId = resultSet.getInt("product_id");
                int quantity = resultSet.getInt("quantity");
                String productName = resultSet.getString("product_name");
                double productPrice = resultSet.getDouble("price");
                String productImage = resultSet.getString("image");
                int stockQuantityProduct = resultSet.getInt("stock_quantity");
                String size = resultSet.getString("size");
                Cart_Model cart = new Cart_Model(productId, userId, quantity, productName, productImage, stockQuantityProduct, productPrice);
                cart.setSize(size);
                // Tạo đối tượng Cart và thêm vào danh sách
                carts.add(cart);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            // Đóng ResultSet, PreparedStatement và Connection
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

        return carts;
    }
    public boolean deleteCart(Cart_Model cart) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                String sql = "BEGIN TRANSACTION;\n"
                        + "DELETE [cart] where user_id= ? AND product_id = ? ;\n"
                        + "UPDATE [Product] SET stock_quantity = stock_quantity + ? WHERE product_id = ?;\n"
                        + "IF @@ROWCOUNT = 0\n"
                        + "BEGIN\n"
                        + "    ROLLBACK TRANSACTION;\n"
                        + "    PRINT 'Error: Product not found or insufficient stock quantity';\n"
                        + "END\n"
                        + "ELSE\n"
                        + "BEGIN\n"
                        + "    COMMIT TRANSACTION;\n"
                        + "    PRINT 'Product deleted to cart and stock quantity updated successfully';\n"
                        + "END;";
                stm = con.prepareStatement(sql);
                stm.setInt(1, cart.getUserId());
                stm.setInt(2, cart.getProductId());
                stm.setInt(3, cart.getQuantity());
                stm.setInt(4, cart.getProductId());
                int rowsInserted = stm.executeUpdate();
                return rowsInserted > 0;
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
}
