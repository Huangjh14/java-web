package edu.hzu.javaweb.labs.se1414080902201;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Se1414080902201Servlet
 */
@WebServlet(name="Se1414080902201Servlet",urlPatterns="/1414080902201")
public class Se1414080902201Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// JDBC �����������ݿ� URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/todox?characterEncoding=utf-8";
	
	// ���ݿ���û���������
	static final String USER = "root";
	static final String PASS = ""; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Se1414080902201Servlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("����get����...");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("����post����...");
		Connection conn = null;
		Statement stmt = null;
		String id = null;
        // ��������
        String item = request.getParameter("item");
        //��ȡcookie
        Cookie cookie = null;
    	Cookie[] cookies = null;
    	cookies = request.getCookies();

    	for (int i = 0; i < cookies.length; i++){
    		cookie = cookies[i];
    		if((cookie.getName()).equals("id")){
    			id = cookie.getValue();
    			break;
    		}
    	}
        //�������ݿ�
        try{
			// ע�� JDBC ������
			Class.forName("com.mysql.jdbc.Driver");
			// ��һ������
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			// ִ�� SQL ��ѯ
			stmt = conn.createStatement();
			String sql;
			sql = "INSERT INTO plan (userId,content) VALUES ('"+id+"','"+item+"')";
			stmt.executeUpdate(sql);
			PrintWriter out = response.getWriter();
			out.println(":) ����ɹ���");
			// ��ɺ�ر�
			stmt.close();
			conn.close();
		} catch(SQLException se) {
			// ���� JDBC ����
			se.printStackTrace();
		} catch(Exception e) {
			// ���� Class.forName ����
			e.printStackTrace();
		}finally{
			// ��������ڹر���Դ�Ŀ�
			try{
				if(stmt!=null)
				stmt.close();
			}catch(SQLException se2){
			}
			try{
				if(conn!=null)
				conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
	}

}
