<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>�ֻ�����ϵͳ��¼</title>
	<style type="text/css">
		#Box{margin:30px auto;width: 500px;border: 1px solid #ccc;}
		.btn{width: 45px;height: 20px;}
		h3{display: block;margin-top: 80px;margin-left: 480px;}
	</style>
</head>
<body>
	<form>
		<h3>�ֻ�����ϵͳ��¼</h3>
		<div id="Box">
			<div style="margin:20px auto;"><label>�ۻ�Ա�˺�<input type="text"  name="username"></label></div>
			<div style="margin:20px auto;"><label>&nbsp;&nbsp;����&nbsp;<input type="password" name="password"></label></div>
			<div style="margin:20px auto;"><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">��ס����&nbsp;&nbsp;<input type="submit" value="��¼"></label></div>
		</div>
		<c:if test="${requestScope.username=='admin' }">
			<c:out value="${'��ӭ��½' }"></c:out>
		</c:if>
	</form>
</body>
</html>
