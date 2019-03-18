<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'select.jsp' starting page</title>
    
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
    <p>选择一个目录</p>
    <form action="read.jsp" method="post">
    	<select name="fileDir">
    		<option value="D:\android\java\jdk\jre\bin">D:\android\java\jdk\jre\bin</option>
    		<option value="D:\Myeclipse\Workspaces\ch7">D:\Myeclipse\Workspaces\ch7</option>
    		<option value="D:\Myeclipse\Workspaces\ch8">D:\Myeclipse\Workspaces\ch8</option>
    	</select>
    	<input type="submit" value="提交">
    </form>
  </body>
</html>
