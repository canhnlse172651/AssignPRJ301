/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DB_Connecttion.DB_Connection;
import MODEL.Cate_Model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thinkpad
 */
public class Cate_DAO {

    public List<Cate_Model> getAllCate() throws Exception {

        List<Cate_Model> cateList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        String sql = null;
        ResultSet rs = null;

        try {
            con = DB_Connection.getConnection();
            if (con != null) {
                //2 create SQL String
                sql = "SELECT * FROM Categories";

            }
            // 3 Create statement Object
            stm = con.prepareStatement(sql);

            // 4 Excute query
            rs = stm.executeQuery();
            while (rs.next()) {

                int cateId = rs.getInt("category_id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                boolean status = rs.getBoolean("status");

                Cate_Model dto = new Cate_Model(cateId, name, image, status);

                cateList.add(dto);

            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
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
