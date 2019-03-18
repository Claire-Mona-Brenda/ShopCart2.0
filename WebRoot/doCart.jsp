<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,com.action.shopCart,com.po.GoodInfo" %>
<jsp:useBean id="myCart" class="com.action.shopCart" scope="session"></jsp:useBean>
<%
	String action=request.getParameter("action");
	if(action==null){
		action="";
	}
	if(action.equals("buy")){
		ArrayList<GoodInfo>goodsList=(ArrayList<GoodInfo>)session.getAttribute("goodsList");
		int id=Integer.parseInt(request.getParameter("id"));
		GoodInfo single=goodsList.get(id);
		single.setId(id);
		myCart.addItem(single);
		response.sendRedirect("show.jsp");
	}
	else if(action.equals("remove")){
	    String name=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
		myCart.removeItem(name);
		response.sendRedirect("shopCart.jsp");
	}
	else if(action.equals("clear")){
		myCart.clearCart();
		response.sendRedirect("shopCart.jsp");
	}
	else{
		response.sendRedirect("show.jsp");
	}
 %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>中间处理</title>
    
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
  </body>
</html>
