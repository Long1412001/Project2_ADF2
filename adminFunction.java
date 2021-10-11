/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project2_adf2;

import com.mysql.cj.protocol.Resultset;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DELL
 */
public class adminFunction {
    int adminID;
    String username;
    String pass;
    int roleID;

    public adminFunction(){
        username = "";
        pass = "";
        roleID = 0;
    }
    
    public adminFunction(String username, String pass, int roleID) {
        this.username = username;
        this.pass = pass;
        this.roleID = roleID;
    }
    
    public boolean checkLogin() throws ClassNotFoundException, SQLException{
        try{
            SQLConnection getCon = new SQLConnection();
            Connection con = getCon.getConnection();
            Statement stmt = con.createStatement();
            ResultSet result = stmt.executeQuery("select count(*) from admin where UserName = '"+username+"' and Password = '"+pass+"' and RoleID = "+roleID);
            result.next();
            int count = result.getInt(1);
            if(count == 0){
                return false;
            }else return true;
        }catch(ClassNotFoundException | SQLException ex){}
        return false;
    }
    
    public static int checkRole(String role){
        try{
            SQLConnection getCon = new SQLConnection();
            Connection con = getCon.getConnection();
            Statement stmt = con.createStatement();
            ResultSet result = stmt.executeQuery("select * from role where RoleName = '"+role+"'");
            result.next();
            int id = result.getInt(1);
            return id;
        }catch(ClassNotFoundException | SQLException ex){}
        return -1;
    }
    
    public void addAdmin(){
        try{
            SQLConnection getCon = new SQLConnection();
            Connection con = getCon.getConnection();
            Statement stmt = con.createStatement();
            stmt.executeUpdate("insert admin(UserName, Password, RoleID) values('"+username+"', '"+pass+"', "+roleID+")");
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
    
    public static String SHA1(String pass) throws NoSuchAlgorithmException{
        MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] messageDigest = md.digest(pass.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
    }
    public static void main(String args[]) throws NoSuchAlgorithmException{
        System.out.println(SHA1("1234567"));
    }
}
