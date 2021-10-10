/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project2_adf2;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class SQLConnection {
    private String server = "localhost";
    private String username = "root";
    private String dbname = "project2";
    private Integer port = 3306;
    private String pass = "";
    public Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection con = null;
        MysqlDataSource data = new MysqlDataSource();
        data.setServerName(server);
        data.setUser(username);
        data.setPassword(pass);
        data.setDatabaseName(dbname);
        data.setPortNumber(port);
        con = data.getConnection();
        return con;
    }
}
