package model;
//���ļ���û��ʹ�ã�Ϊ����׼��
public class User {
	private String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPasssword() {
		return passsword;
	}
	public void setPasssword(String passsword) {
		this.passsword = passsword;
	}
	private String passsword;
	
	public User(){
		
	}
	public User(String username,String password){
		this.username=username;
		this.passsword=password;
	}
	
}
