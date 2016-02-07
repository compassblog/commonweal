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
    /**ִ�����ݿ��ѯ����
    *����һ����׼��SQL��ѯ���
    *����һ��ResultSet
    *���û�в�ѯ�����
    *ResultSet���ɲ���null
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
    /**����ִ�����ݿ� ���� ɾ�� �޸� ����
    *����һ����׼��SQL���
    *�ɹ��򷵻�false
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
        return cnt; //�ɹ�����false
        }
}
