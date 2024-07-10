/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.ADMIN;

import DB_Connecttion.DB_Connection;
import MODEL.Cate_Model;
import MODEL.Orders_Model;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author LA DAT
 */
public class Order_DAO implements Serializable {

    Connection con = null;
    PreparedStatement stm = null;
    ResultSet resultSet = null;
    String sql = null;

    public List<Orders_Model> findAll() throws ClassNotFoundException, SQLException {

        List<Orders_Model> orderList = new ArrayList<>();
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "SELECT o.*, u.full_name, p.payment_type, p.status as paymentStatus, p.card_number, p.payment_date, p.bank_branding, p.cardholder_name \n"
                        + "From (([Order] as o JOIN [User] as u ON o.user_id = u.user_id) JOIN Payment as p ON o.order_id = p.payment_id)";
            }
            stm = con.prepareStatement(sql);
            resultSet = stm.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                int userId = resultSet.getInt("user_id");
                int status = resultSet.getInt("status");
                Date orderDate = resultSet.getDate("order_date");
                Date deliveryDate = resultSet.getDate("delivery_date");
                double totalPrice = resultSet.getDouble("totalPrice");
                String fullName = resultSet.getString("full_name");
                String paymentType = resultSet.getString("payment_type");
                String paymentStatus = resultSet.getString("paymentStatus");
                String cardNumber = resultSet.getString("card_number");
                Date paymentDate = resultSet.getDate("payment_date");
                String bankBranding = resultSet.getString("bank_branding");
                String cardholderName = resultSet.getString("cardholder_name");
                Orders_Model dto = new Orders_Model(orderId, userId, status, orderDate, deliveryDate, totalPrice, fullName, paymentType, paymentStatus, cardNumber, paymentDate, bankBranding, cardholderName);
                orderList.add(dto);
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

        return orderList;
    }

    public boolean updateOrderStatus(int orderId, String status) throws SQLException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "UPDATE [Order] SET status = ? WHERE order_id = ?";
            }
            stm.setString(1, status);
            stm.setInt(2, orderId);
            boolean rowUpdated = stm.executeUpdate() > 0;
            return rowUpdated;
        } catch (Exception e) {
            System.out.println("DAO.ADMIN.Order_DAO.updateOrderStatus()" + e);
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

    public boolean updatePaymentStatus(int paymentId, String status) throws SQLException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "UPDATE Payment SET status = ? WHERE payment_id = ?";
            }
            stm.setString(1, status);
            stm.setInt(2, paymentId);
            boolean rowUpdated = stm.executeUpdate() > 0;
            return rowUpdated;
        } catch (Exception e) {
            System.out.println("DAO.ADMIN.Order_DAO.updateOrderStatus()" + e);
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
