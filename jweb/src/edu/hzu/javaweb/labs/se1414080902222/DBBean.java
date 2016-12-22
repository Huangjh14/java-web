  package edu.hzu.javaweb.labs.se1414080902222;
 
  /*
  * To change this license header, choose License Headers in Project Properties.
  * To change this template file, choose Tools | Templates
  * and open the template in the editor.
  */
  /**
  *
  * @author Administrator
  */
  import java.sql.*;
 
  public class DBBean {
     private Connection conn = null;
    private PreparedStatement PPstmt = null;
     private Statement stmt = null;
     //����mysql���ݿ��е�test���ݿ�
    public Connection getConnection(){
        try{
             if(conn == null){
                 Class.forName("com.mysql.jdbc.Driver");
                 conn = DriverManager.getConnection(
                     "jdbc:mysql://localhost:3306/youju?useUnicode=true&charset=gbk","root","root");   
             }
         }catch(ClassNotFoundException e){
            e.printStackTrace();
             System.out.println("δ�ܼ������ݿ���������");
         }catch(SQLException e0){
             e0.printStackTrace();
             System.out.println("���ݿ�����ʧ��");
         }
         return conn;
    }
     
     //����������
     public PreparedStatement getPreparedStatement(String sql){
        try{
             conn = getConnection();
             PPstmt = conn.prepareStatement(sql);
         }catch(SQLException e){
             e.printStackTrace();
             System.out.println("���ݿ�Ԥ����������ʧ��");
         }
 
         return PPstmt;
     }
     public Statement getStatement(){
        try{
             stmt = conn.createStatement();
         }catch(SQLException e){
             System.out.println(e);
             e.printStackTrace();
             System.out.println("���ݿ���������ʧ��");
         }
         return stmt;
     }
     public void closeResource(Connection conn,Statement stmt,PreparedStatement PPstmt){
         try{
 
             if(conn != null)
                 conn.close();
             if(stmt != null)
                 stmt.close();
             if(PPstmt != null){
                 PPstmt.close();
             }
        }catch(SQLException e0){
            System.out.println("���ݿ���Դ�ر�ʧ��");
         }
 
     }
    }