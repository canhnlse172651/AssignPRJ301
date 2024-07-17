/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB_Connecttion.DB_Connection;
import MODEL.OrderDetail_Model;
import MODEL.Orders_Model;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author LA DAT
 */
public class OrderDetail_DAO implements Serializable {
    Connection con = null;
    PreparedStatement stm = null;
    ResultSet resultSet = null;
    String sql = null;

    public boolean insertOrderDetail(OrderDetail_Model orderDetail, int userId) throws SQLException, ClassNotFoundException {
        try {            
            con = DB_Connection.getConnection();
            if (con != null) {
                sql =  "BEGIN TRANSACTION;\n"
                        +"INSERT INTO [OrderDetail] (order_id, product_id, quantity, total ) VALUES (?, ?, ?, ?);\n"
                        + "UPDATE [Product] SET stock_quantity = stock_quantity - ? WHERE product_id = ?;\n"
                        + "DELETE [cart] where user_id= ? AND product_id = ? ;\n"
                        + "IF @@ROWCOUNT = 0\n"
                        + "BEGIN\n"
                        + "    ROLLBACK TRANSACTION;\n"
                        + "    PRINT 'Error: Product not found or insufficient stock quantity';\n"
                        + "END\n"
                        + "ELSE\n"
                        + "BEGIN\n"
                        + "    COMMIT TRANSACTION;\n"
                        + "    PRINT 'Product added to orderDetail and stock quantity updated successfully';\n"
                        + "END;";
            }
            stm = con.prepareStatement(sql);
            stm.setInt(1, orderDetail.getOrderId());
            stm.setInt(2, orderDetail.getProductId());
            stm.setInt(3, orderDetail.getQuantityDetail());
            stm.setDouble(4, orderDetail.getTotal());      
            stm.setInt(5, orderDetail.getQuantityDetail());
            stm.setInt(6, orderDetail.getProductId());
            stm.setInt(7, userId);
            stm.setInt(8, orderDetail.getProductId());
            int rowsInserted = stm.executeUpdate();
            return (rowsInserted > 0);
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
       
    }
}
