<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册结果</title>
<!-- 外部样式 style.css -->
<link rel="stylesheet" type="text/css" href="css/Indexc.css" />
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat dtf = new java.text.SimpleDateFormat("yyyy/MM/dd");
		
		String fhref = request.getAttribute("fhref").toString();
		if (fhref == null) {
			fhref = "登录";
		}
	%>


	<div id="wrap">
		<div id="header">
			<div>
				<span id="title"> <a href="#"><%=fhref %>结果</a>
				</span> <span id="date"><%=dtf.format(date)%></span>
			</div>
		</div>
		<div id="content">

			  
			<h1><%=fhref %>失败，点击<a href="Rgstr.jsp">注册</a></h1>
			<%
				//定时跳转网页
				response.setHeader("refresh", "3;URL=Rgstr.jsp");
			%>
		</div>
			<div class="footer">请联系：lssxxx@163.com</div>
	</div>
</body>
</html>