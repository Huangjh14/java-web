package edu.hzu.javaweb.labs.se1414080902208;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/1414080902208")
public class Se1414080902208Servlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	public Se1414080902208Servlet() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("gb2312");
  		
                response.setCharacterEncoding("gb2312");
  		
                PrintWriter out = response.getWriter();
 		
                String Score = new String(request.getParameter("score"));
 		
                String Comment = new String(request.getParameter("comment"));
 		
                HttpSession session=request.getSession(true);
 		
                String msg = "";
  		
                if (Score.equals("")) {
 	out.println("���ֲ���Ϊ��");
 			msg = "���ֲ���Ϊ��";
  		} else if (Comment.equals("")) {
 			out.println("���۲���Ϊ��");
 			msg =                 "���۲���Ϊ��";
  		} 
                else {
  			boolean flat = true;
  			char[] str=Score.toCharArray();
  			for (int i = 0;i < Score.length();i++) {
  	int x = str[i] - '0';
  				if (!(x >= 0 && x <= 10)) {
 // �������Ϊ10�֣���	
	                     out.println("��������ȷ������");
 					msg = "��������ȷ������";
  					flat = false;
  					break;
  				}
 
  				for (int i = 0;i < Amount.length();i++) {
  					int x = sstr[i] - '0';
  					if (!(x >= 0 && x <= 100)) {

 //�����������Ϊ100 ����			out.println("����������Χ����������");
 						msg = "����������Χ����������";
  						flat = false;
  						break;
  					}
  				}
  			}
 			
if (flat){ 
                              Connection conn = null;
				PreparedStatement stmt = null;
		        DBBean db = new DBBean();
				try {
			        conn = db.getConnection();
			        String sql = "insert into transfer values(?,?)";
			        stmt = db.getPreparedStatement(sql);
			        stmt.setString(1,Score);
			        stmt.setString(2,Comment);
			        stmt.executeUpdate();
			        db.closeResource(conn,null,stmt);
				} catch (SQLException e) {
					e.printStackTrace();
				}
out.println("���۳ɹ�");}
 			if (flat) msg = "���۳ɹ�";
  		}
 	

	
	public void init() throws ServletException {
		// Put your code here
	}

}















i