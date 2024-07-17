/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB_Connecttion.DB_Connection;
import MODEL.Cart_Model;
import MODEL.Payment_Model;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author LA DAT
 */
public class Payment_DAO implements Serializable {

    Connection con = null;
    PreparedStatement stm = null;
    ResultSet resultSet = null;
    String sql = null;

    public boolean insertPayment(Payment_Model payment) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                String sql = "INSERT INTO [Grocery].[dbo].[Payment] \n"
                        + "([payment_id], [card_number], [bank_branding], [cardholder_name], [status], [payment_type])\n"
                        + "VALUES (?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, payment.getPaymentId());
                stm.setString(2, payment.getCardNumber());
                stm.setString(3, payment.getBank());
                stm.setString(4, payment.getOwner());
                stm.setBoolean(5, false);
                stm.setString(6, payment.getPaymentType());
                int rowsInserted = stm.executeUpdate();
                return rowsInserted > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DAO.Payment_DAO.insertPayment()"+e);
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
