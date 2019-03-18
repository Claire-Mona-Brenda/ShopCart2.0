<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,com.po.GoodInfo" %>
<jsp:useBean id="myCart" class="com.action.shopCart" scope="session"></jsp:useBean>
<%
	ArrayList cartList=myCart.getCartList();
	float total=0;
 %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/basic.css">

  </head>
  
  <body>
    <div class="myCart">
    	<div class="head">
    		<p>我的购物车</p>
    	</div>
    	<%
    		if(cartList==null||cartList.size()==0){
    	%>
    	<div class="empty">
    		<div class="pic"><img src="images/gouwuche.png"></div>
    		<div class="ehead"><p>购物车竟然是空的</p></div>
    		<div class="econtent"><p>再忙，也要记得买点什么犒赏自己~~</p></idv>
    	</div>
    	<%
    		}else{
    			for(int i=0;i<cartList.size();i++){
    				GoodInfo single=(GoodInfo)cartList.get(i);
    				String name=single.getName();
    				int num=single.getNum();
    				int id=single.getId();
    				float singlePrice=single.getPrice();
    				total+=singlePrice;
    	%>
    	<div class="good">
    		<div class="pic">
    			<img src="images/<%=id%>.png">
    		</div>
    		<div class="content">
    			<p><%=name %></p>
    			<div class="numInfo">
    				<span class="price"><%=singlePrice %>￥</span>
    				<span class="num"><%=num %>件</span>
    				<div class="action"><a href="doCart.jsp?action=remove&name=<%=name%>">移除</a></div>
    			</div>
    		</div>
    	</div>
    	<%
    			}
    		}
    	 %>
    	 <div class="pay">
    	 	<span>应付金额：<%=total %></span>
    	 </div>
    	 <div class="bottom">
    	 	<span class="continue"><a href="show.jsp">继续购物</a></span>
    	 	<span class="clear"><a href="doCart.jsp?action=clear">清空购物车</a></span>
    	 </div>
    </div>
  </body>
</html>
