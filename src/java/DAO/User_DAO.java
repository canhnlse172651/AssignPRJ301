/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODEL.User_Model;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DB_Connecttion.DB_Connection;
import java.sql.SQLException;

/**
 *
 * @author Thinkpad
 */
public class User_DAO implements Serializable {

    public User_Model checkLogin(String userName, String password) throws ClassNotFoundException, SQLException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet resultSet = null;
        String sql = null;
        User_Model user = null;

        try {

            con = DB_Connection.getConnection();

            if (con != null) {

                sql = "select * "
                        + "from [User] "
                        + "where username = ? "
                        + "and password = ?";
            }

            stm = con.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setString(2, password);

            resultSet = stm.executeQuery();
            
          

            if (resultSet.next()) {
                int userId = resultSet.getInt("user_id");
                String user_Name = resultSet.getString("username");
                String user_password = resultSet.getString("password");
                String fullName = resultSet.getString("full_name");
                String email = resultSet.getString("email");
                int numberOrdered = resultSet.getInt("number_ordered");
                String phone = resultSet.getString("phone");
                boolean status = resultSet.getBoolean("status");
                String address = resultSet.getString("address");
                boolean role = resultSet.getBoolean("role");

                user = new User_Model(userId,userName,user_password,fullName,email,numberOrdered,phone,status,address,role);
                

            }

        } finally {

            if (resultSet != null) {
                resultSet.close();
            }
            if (stm != null) {
                stm.close();;
            }
            if (con != null) {
                con.close();
            }

        }
        
        return user;

    }

}
