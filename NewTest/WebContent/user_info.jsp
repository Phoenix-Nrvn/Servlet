<!--user_info.jsp-->
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息界面</title>
<link rel="stylesheet" type="text/css" href="css/justTc.css">
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="userInfo.User">
	<jsp:setProperty property="*" name="user"/>
</jsp:useBean> 

   	<form method="POST" action="FindServlet">
	<div class="container">
	<img src="img/e84.JPG" class="jpg">
	<div class="all1">
		<div class="int">
			<label for="username">用户名：&nbsp;&nbsp;&nbsp;</label>
			<jsp:getProperty property="username" name="user"/>
		</div>
		<div class="int">
			<label for="pass">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
			<jsp:getProperty property="password" name="user"/>
		</div>
		<div class="int">
			<label for="name">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
			<jsp:getProperty property="name" name="user"/>
		</div>
		<div class="int">
			<label for="email">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
			<jsp:getProperty property="email" name="user"/>
		</div>
		<div class="int">
			<label for="tel">手机号码：</label>
			<jsp:getProperty property="tel" name="user"/>
		</div>
		<div class="int">
			<label for="apart">工作单位：</label>
			<jsp:getProperty property="apart" name="user"/>
		</div>
		<div>
			<input type="submit" value="登录" id="send" class="sub"/>
		</div>
		</div>
	</div>
	</form> 
</body>
</html>