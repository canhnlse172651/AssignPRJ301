/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.ADMIN;

import DB_Connecttion.DB_Connection;
import MODEL.Cate_Model;
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
public class Category_DAO implements Serializable {

    Connection con = null;
    PreparedStatement stm = null;
    ResultSet resultSet = null;
    String sql = null;

    public List<Cate_Model> findAll() throws ClassNotFoundException, SQLException {

        List<Cate_Model> cateList = new ArrayList<>();
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "SELECT * FROM Categories";
            }
            stm = con.prepareStatement(sql);
            resultSet = stm.executeQuery();
            while (resultSet.next()) {
                int cateId = resultSet.getInt("category_id");
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                boolean status = resultSet.getBoolean("status");
                Cate_Model dto = new Cate_Model(cateId, name, image, status);
                cateList.add(dto);
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

        return cateList;
    }

    public boolean insertCategory(Cate_Model cate) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "INSERT INTO [Categories] (name, image, status) VALUES (?, ?, ? )";
            }
            stm = con.prepareStatement(sql);
            stm.setString(1, cate.getName());
            stm.setString(2, cate.getImage());
            stm.setBoolean(3, cate.getStatus());
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

    public Cate_Model findOneById(int id) throws ClassNotFoundException, SQLException {
        Cate_Model cate = new Cate_Model();
        try {
            con = DB_Connection.getConnection();
            if (con != null) {

                sql = "select * "
                        + "from [Categories] where category_id = ?";
            }

            stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            resultSet = stm.executeQuery();
            while (resultSet.next()) {
                int cateId = resultSet.getInt("category_id");
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                boolean status = resultSet.getBoolean("status");
                cate = new Cate_Model(cateId, name, image, status);
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
        return cate;
    }

    public boolean updateCategory(Cate_Model cate) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "UPDATE [Categories] SET  name = ?, image = ?,  status = ? WHERE category_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, cate.getName());
                stm.setString(2, cate.getImage());
                stm.setBoolean(3, cate.getStatus());
                stm.setInt(4, cate.getCategoryId());
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

    public boolean deleteCategory(int categoryId) throws SQLException, ClassNotFoundException {
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                Cate_Model cate = findOneById(categoryId);
                cate.setStatus(false);
                return updateCategory(cate);
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

    public Cate_Model findOneByName(String categoryName) throws ClassNotFoundException, SQLException {
        Cate_Model cate = new Cate_Model();
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "select * from [Categories] where name = ? ";
            }

            stm = con.prepareStatement(sql);
            stm.setString(1, categoryName);
            resultSet = stm.executeQuery();
            while (resultSet.next()) {
                int cateId = resultSet.getInt("category_id");
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                boolean status = resultSet.getBoolean("status");
                cate = new Cate_Model(cateId, name, image, status);
            }
        } catch (ClassNotFoundException | SQLException e) {
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
        return cate;
    }

    public List<Cate_Model> findTopCate() throws ClassNotFoundException, SQLException {

        List<Cate_Model> cateList = new ArrayList<>();
        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                sql = "SELECT c.category_id, c.name, c.image, c.status, COUNT(p.category_id) AS productCount FROM Categories c LEFT JOIN Product p ON c.category_id = p.category_id\n"
                        + "GROUP BY c.category_id, c.name, c.image, c.status ORDER BY productCount DESC";
            }
            stm = con.prepareStatement(sql);
            resultSet = stm.executeQuery();
            while (resultSet.next()) {
                int cateId = resultSet.getInt("category_id");
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                int number = resultSet.getInt("productCount");
                boolean status = resultSet.getBoolean("status");
                Cate_Model cate = new Cate_Model(cateId, name, image, status);                
                cate.setProductNumber(number);
                cateList.add(cate);
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

        return cateList;
    }
}
