<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,com.po.GoodInfo" %>
<%
	ArrayList<GoodInfo>goodsList=(ArrayList<GoodInfo>)session.getAttribute("goodsList");
 %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品列表显示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/basic.css">

  </head>
  
  <body>
  	<div class="myCart">
  		<div class="head"><p>我的宝贝</p></div>
    	<%
    		if(goodsList==null||goodsList.size()==0){
    	%>
    	<div class="empty">
    		<div class="pic"><img src="images/gouwuche.png"></div>
    		<div class="ehead"><p>购物车竟然是空的</p></div>
    		<div class="econtent"><p>再忙，也要记得买点什么犒赏自己~~</p></idv>
    	</div>
    	<%
    		}else{
     			for(int i=0;i<goodsList.size();i++){
    				GoodInfo single=(GoodInfo)goodsList.get(i);
    	%>
    	<div class="good">
    		<div class="pic">
    			<img src="images/<%=single.getId()%>.png">
    		</div>
    		<div class="content">
    			<p class="chead"><%=single.getName() %></p>
    			<div class="numInfo">
    				<span class="price">￥<%=single.getPrice() %></span>
    				<span class="num"><%=single.getNum() %>件</span>
    				<div class="action"><a href="doCart.jsp?action=buy&id=<%=i %>" onclick="alert('添加成功')">添加致购物车</a></div>
    			</div>
    		</div>
    	</div>
    	<% 
    			}
    		}
    	 %>
    	<div class="checkCart">
    		<a href="shopCart.jsp">查看购物车</a>
    	</div>
  	</div>
  </body>
</html>
