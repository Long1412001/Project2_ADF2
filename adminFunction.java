/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project2_adf2;

import com.mysql.cj.protocol.Resultset;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DELL
 */
public class adminFunction {
    public static boolean checkLogin(String username, String pass, int id) throws ClassNotFoundException, SQLException{
        try{
            SQLConnection getCon = new SQLConnection();
            Connection con = getCon.getConnection();
            Statement stmt = con.createStatement();
            ResultSet result = stmt.executeQuery("select count(*) from admin where UserName = '"+username+"' and Password = '"+pass+"' and FunctionID = "+id);
            result.next();
            int count = result.getInt(1);
            if(count == 0){
                return false;
            }else return true;
        }catch(ClassNotFoundException | SQLException ex){}
        return false;
    }
    
    public static int checkFunction(String func){
        try{
            SQLConnection getCon = new SQLConnection();
            Connection con = getCon.getConnection();
            Statement stmt = con.createStatement();
            ResultSet result = stmt.executeQuery("select * from function where FunctionName = '"+func+"'");
            result.next();
            int id = result.getInt(1);
            return id;
        }catch(ClassNotFoundException | SQLException ex){}
        return -1;
    }
    
    public static void addAdmin(String uname, String pass, int id){
        try{
            SQLConnection getCon = new SQLConnection();
            Connection con = getCon.getConnection();
            Statement stmt = con.createStatement();
            stmt.executeUpdate("insert admin(UserName, Password, FunctionID) values('"+uname+"', '"+pass+"', "+id+")");
        }catch(ClassNotFoundException | SQLException ex){}
    }
    
    public static boolean isUsername(String uname){
        try{
            SQLConnection getCon = new SQLConnection();
            Connection con = getCon.getConnection();
            Statement stmt = con.createStatement();
            ResultSet result = stmt.executeQuery("select count(*) from admin where UserName = '"+uname+"'");
            result.next();
            int count = result.getInt(1);
            if(count == 0){
                return false;
            }else return true;
        }catch(ClassNotFoundException | SQLException ex){}
        return false;
    }
}
