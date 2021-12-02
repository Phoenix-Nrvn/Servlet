<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Login In</title>
		<link rel="stylesheet" type="text/css" href="Indexc.css">
		<script src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		$(function(){
		$("form :input.required").each(function() {
			var $required = $("<strong class='high'> *</strong>");
			$(this).parent().append($required);
		});
		$('form :input').blur(function() {
			var $parent = $(this).parent();
			$parent.find(".high").remove();
			$parent.find(".formtips_onError").remove();
			$parent.find(".formtips_onSuccess").remove();
			//验证用户名
			if ($(this).is('#username') ){
				if( this.value=="" || this.value.length < 6 ){
					var errorMsg = '请输入至少6位的用户名';
					$parent.append('<span class="formtips_onError">'+errorMsg+'</span>');
				} else {
					var okMsg = '格式正确';
					$parent.append('<span class="formtips_onSuccess" color="red">'+okMsg+'</span>');
				}
			}
			if ($(this).is("#pwd3") ){
				if (this.value=="" || this.value.length < 6) {
					var errorMsg = '密码至少6位';
					$parent.append('<span class="formtips_onError">'+errorMsg+'</span>');
				} else {
					var okMsg = '格式正确';
					$parent.append('<span class="formtips_onSuccess">'+okMsg+'</span>');
				}
			}
			if ($(this).is("#Ccode") ){
				if (this.value=="") {
					var errorMsg = '请输入验证码';
					$parent.append('<span class="formtips_onError">'+errorMsg+'</span>');
				} else if (this.value=="uwv6") {
					var okMsg = '输入正确';
					$parent.append('<span class="formtips_onSuccess">'+okMsg+'</span>');
				}
			}
		});
		$('#send').click(function(){
			$("form .required:input").trigger('blur');
			var numError = $('form .formtips_onError').length;
			if (numError) {
				alert("请输入登录信息！")
				return false;
			}
			alert("跳转成功！");
		});
		$(function() {
			$(":input").focus(function() {
				$(this).addClass("focus");
			}).blur(function() {
				$(this).removeClass("focus");
			});
		});
		})
		</script>
	</head>
	<body>
	<% 
        request.setCharacterEncoding("utf-8"); 
        String username = ""; 
        String password = "";
        Cookie[] cookies = request.getCookies(); 
        if(cookies != null && cookies.length > 0) { 
            for(Cookie c:cookies) { 
                if(c.getName().equals("usernameCookie")) { 
                    username = URLDecoder.decode(c.getValue(), "utf-8"); 
                } else if(c.getName().equals("passwordCookie")) { 
                    password = URLDecoder.decode(c.getValue(), "utf-8"); 
                }
            } 
        }
   %>
   <%
		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat dtf = new java.text.SimpleDateFormat("yyyy/MM/dd");
	%>
		<div id="div2">
			<div id="header" class="top">
				<span>
	<a href="#" id="linkage1"><b>用户登录</b></a>
	</span>
	<span id="date"><%=date %></span>
</div>
		<div id="div1"><h1>登录</h1><br/>
			<h5>无账号？<a href="Rgster.jsp" id="linkage2">点击注册</a></h5>
		</div>
		
		<form action="InfoServlet" method="POST" id="regForm">
		<table>
			<tr>
				<td>
					用户名:
				</td>
				<td>
					<input type="text" name="username" id="username" value="<%=username%>"/>
				</td>
			</tr>
			<tr>
				<td>
					密&nbsp;&nbsp;&nbsp;码:
				</td>
				<td>
					<input type="password" name="password" id="pwd3" value=" "/>
				</td>
			</tr>
			<tr>
				<td>
					用户类型:
				</td>
				<td>
					<input type="radio" name="usertype" checked="checked" value="1">学生
					<input type="radio" name="usertype" value="2">教师
					<input type="radio" name="usertype" value="0">其他
				</td>
			</tr>
			<tr>
				<td>
					验证码:
				</td>
				<td>
					<input type="text" name="验证码" id="Ccode" value="uwv6"/>
					
				</td>
				<td>
					<img src="img/timg.jpg" alt="验证码" width="60" height="25"/>
				</td>
			</tr>
			<tr>
				<td><input type = "checkbox" name = "isChecked" checked = "checked">七天免登录</td>
			</tr>
		<th></th>
		<th>
		<input type="submit" id="send" class="button" value="登录" />
		<input type="reset" class="button" value="重置" />
		</th>
		</table>
		</form>
		<div class="footer">请联系：lssxxx@163.com</div>
		</div>
	</body>
</html>