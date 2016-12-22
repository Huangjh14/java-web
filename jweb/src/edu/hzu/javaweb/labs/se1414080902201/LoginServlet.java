package edu.hzu.javaweb.labs.se1414080902201;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
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
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet",urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// JDBC �����������ݿ� URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/todox";
	
	// ���ݿ���û���������
	static final String USER = "root";
	static final String PASS = ""; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        if(email.equals("")){
        	request.setAttribute("tip", "���䲻��Ϊ�գ�");                                        
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
            dispatcher.forward(request, response);
            return;
        }
        if(password.equals("")){
        	request.setAttribute("tip", "���벻��Ϊ�գ�");                                        
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
            dispatcher.forward(request, response);
            return;
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
			sql = "SELECT * FROM user WHERE email='"+email+"'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				id = rs.getString("id");
				String pass = rs.getString("password");
				System.out.println(id);
				if(!password.equals(pass)){
					request.setAttribute("tip", "�������");                                        
		            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
		            dispatcher.forward(request, response);
		            return;
				}
			}else{
				request.setAttribute("tip", "������δע�ᣡ");                                        
	            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");   
	            dispatcher.forward(request, response);
	            return;
			}
			
			// ��ɺ�ر�
			rs.close();
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

        //���� Cookie
 		Cookie cookie_email = new Cookie("email",email);
 		Cookie cookie_id = new Cookie("id",id);
 		if(remember != null){
 			// ���ù�������Ϊ30���
 	 		cookie_email.setMaxAge(60*60*24*30);
 	 		cookie_id.setMaxAge(60*60*24*30);
 		}else{
 			//���ù���ʱ��Ϊ1Сʱ
 			cookie_email.setMaxAge(60*60);
 			cookie_id.setMaxAge(60*60);
 		}
 		// ����Ӧͷ�� Cookie
 		response.addCookie(cookie_email);
 		response.addCookie(cookie_id);
 		response.sendRedirect("index");


	}

}
