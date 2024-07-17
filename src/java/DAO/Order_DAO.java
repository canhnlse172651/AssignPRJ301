/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB_Connecttion.DB_Connection;
import MODEL.Cate_Model;
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
public class Order_DAO implements Serializable {

    Connection con = null;
    PreparedStatement stm = null;
    ResultSet resultSet = null;
    String sql = null;

    public int insertOrder(Orders_Model order) throws SQLException, ClassNotFoundException {
        int orderId=-1;
        try {            
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "INSERT INTO [Grocery].[dbo].[Order] ([user_id], [status], [order_Date],  [totalPrice], [address], [phone], [shipping], [fullName])\n"
                        + "VALUES (?, 0 , GETDATE(),  ? , ? ,  ? , ? , ?);";
            }
            stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, order.getUserId());
            stm.setDouble(2, order.getTotalPrice());
            stm.setString(3, order.getAddress());
            stm.setString(4, order.getPhone());
            stm.setInt(5, order.getShipping());
            stm.setString(6, order.getFullNameOrder());            
            int rowsInserted = stm.executeUpdate();
            if(rowsInserted == 0){
                throw new SQLException("Inserting order failed, no rows affected.");
            }
             resultSet = stm.getGeneratedKeys();
            if (resultSet.next()) {
                orderId = resultSet.getInt(1);
            } else {
                throw new SQLException("Inserting order failed, no ID obtained.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
        return orderId;
    }
    
}
