package control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import util.Build;
import model.User;

public class Load {
	Build build = new Build();
	
	// ��¼
	public String load(User us,HttpServletRequest request) {
		String name=us.getUsername();
		String pass=us.getPasssword();
		HttpSession session=request.getSession();
		
		
		@SuppressWarnings("unchecked")
		Map<String, String> map=(Map<String, String>) session.getAttribute("user");
		if(map!=null){
			String check_pass=map.get(name);
			if (check_pass!=null) {
				if(check_pass.equals(pass)){
					return "shop_manager.jsp";
				}else{
					return "�����������������";
				}
			} else {
				return "�˺Ų����ڣ�����������";
			}
		}else{
			return "�˺Ų����ڣ�����������";
		}
	}
	
	// ע��
	public String enroll(HttpServletRequest request,User us) {
		String name=us.getUsername();
		String pass=us.getPasssword();
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		Map<String, String> map=(Map<String, String>) session.getAttribute("user");
		
		if(map.containsKey(name)){
			return "�˻��Ѵ��ڣ�����������";
		}else if (build.add(name,pass)) {
			//�����û�session
			map.put(name,pass);
			session.setAttribute("user", map);
			return "shop_manager.jsp";
		} else {
			System.out.println("����û�����");
			return "ϵͳ�������Ժ�����";
		}
	}
}
