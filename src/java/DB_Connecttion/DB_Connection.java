/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Connecttion;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Thinkpad
 */
public class DB_Connection implements Serializable{
      private static final String DB_NAME = "Grocery";
    private static final String DB_USER_NAME = "sa";
    private static final String DB_PASSWORD = "123456";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME;
        conn = DriverManager.getConnection(url, DB_USER_NAME, DB_PASSWORD);
        return conn;
    }
    
    
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        // Thử kết nối đến cơ sở dữ liệu
        Connection connection = DB_Connection.getConnection();
        // Kiểm tra kết nối
        if (connection != null) {
            System.out.println("Kết nối thành công!");
        } else {
            System.out.println("Kết nối thất bại!");
        }
    }
    
}
