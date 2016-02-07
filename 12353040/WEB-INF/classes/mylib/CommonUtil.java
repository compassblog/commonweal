package mylib;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
public class CommonUtil{
    private static Connection conn;
    public static boolean connect(){
        String connectString = "jdbc:mysql://localhost:3306/12353040"+"?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(connectString,"user","123456");
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return false;
    }
    /**执行数据库查询操作
    *输入一个标准的SQL查询语句
    *返回一个ResultSet
    *如果没有查询到结果
    *ResultSet依旧不是null
    **/
    public static ResultSet executeQuery(String sqlSentence){
        Statement stat;
        ResultSet rs = null;
        try{
            stat = conn.createStatement();
            rs = stat.executeQuery(sqlSentence);
        }catch(Exception e){
          System.out.println(e.getMessage());
        }
        return rs;
    }
    /**用来执行数据库 增加 删除 修改 操作
    *传入一个标准的SQL语句
    *成功则返回false
    **/
    public static boolean execute(String sqlSentence){
        Statement stat;
        boolean cnt = true;
        try{
            stat = conn.createStatement();
            cnt = stat.execute(sqlSentence);
            System.out.println("excute success!");
            }catch(Exception e){
                System.out.println(e.getMessage());
             }
        return cnt; //成功返回false
        }
}
