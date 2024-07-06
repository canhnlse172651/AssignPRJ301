/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.ADMIN;

import DB_Connecttion.DB_Connection;
import MODEL.User_Model;
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
public class Account_DAO implements Serializable {

    Connection con = null;
    PreparedStatement stm = null;
    ResultSet resultSet = null;
    String sql = null;

    public List<User_Model> findAll() throws ClassNotFoundException, SQLException {
        List<User_Model> listUser = new ArrayList<>();
        try {
            con = DB_Connection.getConnection();
            if (con != null) {

                sql = "select * "
                        + "from [User] ";
            }

            stm = con.prepareStatement(sql);
            resultSet = stm.executeQuery();
            while (resultSet.next()) {
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
                User_Model user = new User_Model(userId, user_Name, user_password, fullName, email, numberOrdered, phone, status, address, role);
                listUser.add(user);
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
        return listUser;
    }

    public boolean insertUser(User_Model user) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "INSERT INTO [User] (username, password, full_name, email, number_ordered, phone, status, address, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            }
            stm = con.prepareStatement(sql);
            stm.setString(1, user.getUserName());
            stm.setString(2, user.getPassword());
            stm.setString(3, user.getFullName());
            stm.setString(4, user.getEmail());
            stm.setInt(5, user.getNumberOrdered());
            stm.setString(6, user.getPhone());
            stm.setBoolean(7, user.isStatus());
            stm.setString(8, user.getAddress());
            stm.setBoolean(9, user.isRole());
            int rowsInserted = stm.executeUpdate();
            return rowsInserted > 0;
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

    public User_Model findOneById(int id) throws ClassNotFoundException, SQLException {
        User_Model user = new User_Model();
        try {
            con = DB_Connection.getConnection();
            if (con != null) {

                sql = "select * "
                        + "from [User] where user_id = ?";
            }

            stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            resultSet = stm.executeQuery();
            while (resultSet.next()) {
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
                user = new User_Model(userId, user_Name, user_password, fullName, email, numberOrdered, phone, status, address, role);
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
        return user;
    }

    public boolean updateUser(User_Model user) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                String sql = "UPDATE [User] SET  password = ?, full_name = ?, email = ?, number_ordered = ?, phone = ?, status = ?, address = ?, role = ?, username = ? WHERE user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, user.getPassword());
                stm.setString(2, user.getFullName());
                stm.setString(3, user.getEmail());
                stm.setInt(4, user.getNumberOrdered());
                stm.setString(5, user.getPhone());
                stm.setBoolean(6, user.isStatus());
                stm.setString(7, user.getAddress());
                stm.setBoolean(8, user.isRole());
                stm.setString(9, user.getUserName());
                stm.setInt(10, user.getUserId());
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

    public boolean deleteUser(int userId) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                String sql = "DELETE FROM [User] WHERE user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, userId);
                int rowsDeleted = stm.executeUpdate();
                return rowsDeleted > 0;
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
