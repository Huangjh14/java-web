<%@ page contentType="text/html" language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ҳ�����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<center><h1>�Ƶ����ϵͳ</h1></center>

    <script> 
//ȡ���������Ĳ���error����yes�Ƚ�
  var errori ='<%=request.getParameter("error")%>';
  if(errori=='yes'){
   alert("��¼ʧ��!");
  history.back();
  }
	</script>
	<h2>	  	<%request.setCharacterEncoding("utf-8"); %>
    <c:out value="${param.username}" default=""/>
	<% Calendar rightNow=Calendar.getInstance();
	   Integer Hour=new Integer(rightNow.get(Calendar.HOUR_OF_DAY));
	   request.setAttribute("hour",Hour);
	%>
	<c:if test="${hour>=0&&hour<=11}">����ã�</c:if>
	<c:if test="${hour>=12&&hour<=17}">����ã�</c:if>
	<c:if test="${hour>=18&&hour<=23}">���Ϻã�</c:if> </h2>
  </body>
</html>
