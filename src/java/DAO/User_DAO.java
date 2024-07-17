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
import javax.naming.NamingException;

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

                user = new User_Model(userId, userName, user_password, fullName, email, numberOrdered, phone, status, address, role);

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

    public boolean createAccount(User_Model user) throws NamingException, SQLException, ClassNotFoundException {

        if (user == null) {
            return false;
        }
        Connection connection = null;

        PreparedStatement preStatement = null;

        boolean result = false;
        try {
            // 1. Get connect database
            connection = DB_Connection.getConnection();

            //2. Create SQL String
            if (connection != null) {
                String sql = "Insert Into [User]([username], [password], full_name, [email], number_ordered, [phone], [status], [address], [role])"
                        + "Values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
                // 3. Create Statement object
                preStatement = connection.prepareStatement(sql);
                preStatement.setString(1, user.getUserName());
                preStatement.setString(2, user.getPassword());
                preStatement.setString(3, user.getFullName());
                preStatement.setString(4, user.getEmail());
                preStatement.setInt(5, user.getNumberOrdered());
                preStatement.setString(6, user.getPhone());
                preStatement.setBoolean(7, user.isStatus());
                preStatement.setString(8, user.getAddress());

                preStatement.setBoolean(9, user.isRole());

                //4. Excute Query
                int effectRows = preStatement.executeUpdate();

                // 5. Process Result
                if (effectRows > 0) {
                    result = true;
                }
            }

        } finally {
            if (preStatement != null) {
                preStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        return result;
    }
    
     public boolean isUserExist(String username, String email,String phone) throws NamingException, SQLException, ClassNotFoundException {
        Connection connection = null;
        PreparedStatement preStatement = null;
        ResultSet rs = null;
        boolean exists = false;

        try {
            connection = DB_Connection.getConnection();
            if (connection != null) {
                String sql = "SELECT [username] FROM [User] WHERE [username] = ? OR [email] = ?  OR [phone] = ? ";
                preStatement = connection.prepareStatement(sql);
                preStatement.setString(1, username);
                preStatement.setString(2, email);
                preStatement.setString(3, phone);

                rs = preStatement.executeQuery();
                if (rs.next()) {
                    exists = true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preStatement != null) {
                preStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return exists;
    }
    

}
