<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="justTc.css">
</head>
<body>
 <% 
    request.setCharacterEncoding("UTF-8"); 
    // 首先判断用户是否勾选了记住账户信息,如果勾选了值默认是on,也可以通过input的value属性设置 
        // 获取输入的username和password,进行编码 
        String username = URLEncoder.encode(request.getParameter("username"), "UTF-8"); 
        String password = URLEncoder.encode(request.getParameter("password"), "UTF-8"); 
        String name = URLEncoder.encode(request.getParameter("name"),"UTF-8");
        String tel = URLEncoder.encode(request.getParameter("tel"),"UTF-8");
        String email = URLEncoder.encode(request.getParameter("email"),"UTF-8");
        String apart = URLEncoder.encode(request.getParameter("apart"),"UTF-8");
        // 新建cookie对象 
        Cookie usernameCookie = new Cookie("usernameCookie", username); 
        Cookie passwordCookie = new Cookie("passwordCookie", password); 
        Cookie nameCookie = new Cookie("nameCookie", name);
        Cookie telCookie = new Cookie("telCookie", tel);
        Cookie emailCookie = new Cookie("emailCookie", email);
        Cookie apartCookie = new Cookie("apartCookie", apart);
        // 设置cookie的有效期7天，单位为秒 
        usernameCookie.setMaxAge(604800); 
        passwordCookie.setMaxAge(604800); 
        // 写入cookie对象 
        response.addCookie(usernameCookie); 
        response.addCookie(passwordCookie); 
        response.addCookie(nameCookie);
        response.addCookie(telCookie);
        response.addCookie(emailCookie);
        response.addCookie(apartCookie);
    %>
     <hr>
     <div class="container">
	<img src="img/e29.JPG" class="jpg">
	<div class="all1">
    <a href="user_info.jsp" id="as">显示用户信息</a>
    <br><br>
    <a href="Index.jsp" id="as">直接登录</a>
    </div>
    </div>
</body>
</html>