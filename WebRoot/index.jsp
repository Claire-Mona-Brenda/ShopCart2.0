<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,com.po.GoodInfo" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%!
	static ArrayList<GoodInfo> goodsList=new ArrayList<GoodInfo>();
	static{
		String[] names={"Vero Mosa2017冬季新款英伦风两穿轻薄中长款风衣","Vero Moda2017秋季新款印花V领修身A摆连衣裙"
						,"Vero Moda斗篷两件套针织连衣裙","Vero Moda2017秋季新款露肩罗纹领修身针织连衣裙"
						,"Vero Moda2017冬季新款网纱圆领翻领包臀针织连衣裙","Vero Moda2017秋季新款千鸟格九分直通休闲裤"};
		float[] prices={749,699,539.4f,699,549,449};
		for(int i=0;i<6;i++){
			GoodInfo single=new GoodInfo();
			single.setName(names[i]);
			single.setPrice(prices[i]);
			single.setNum(1);
			single.setId(i);
			goodsList.add(single);
		}
	}
 %>
<%
	session.setAttribute("goodsList", goodsList);
	response.sendRedirect("show.jsp");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品列表初始化</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
  </body>
</html>
