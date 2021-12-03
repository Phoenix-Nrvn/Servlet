<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="cn.NewTest.db.ConnDB"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/justTc.css">
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
					var okMsg = '输入正确';
					$parent.append('<span class="formtips_onSuccess" color="red">'+okMsg+'</span>');
				}
			}
			if ($(this).is("#pass") ){
				if (this.value=="" || this.value.length < 6) {
					var errorMsg = '密码至少6位';
					$parent.append('<span class="formtips_onError">'+errorMsg+'</span>');
				} else {
					var okMsg = '输入正确';
					$parent.append('<span class="formtips_onSuccess">'+okMsg+'</span>');
				}
			}
			if ($(this).is("#pass2") ){
				if (this.value=="" || (this.value != $("#pass")[0].value)) {
					var errorMsg = '密码不一致';
					$parent.append('<span class="formtips_onError">'+errorMsg+'</span>');
				} else {
					var okMsg = '输入正确';
					$parent.append('<span class="formtips_onSuccess">'+okMsg+'</span>');
				}
			}
			if ($(this).is('#name')) {
				if (this.value=="" || (this.value!="" && !/^[\u4e00-\u9fa5]{2,4}$/.test(this.value) ) ) {
					var errorMsg = '请输入正确的姓名';
					$parent.append('<span class="formtips_onError">'+errorMsg+'</span>');
				} else {
					var okMsg = '输入正确';
					$parent.append('<span class="formtips_onSuccess">'+okMsg+'</span>');
				}
			}
			if ($(this).is('#email')) {
				if (this.value=="" || (this.value!="" && !/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/.test(this.value) ) ) {
					var errorMsg = '请输入正确的E-Mail地址。';
					$parent.append('<span class="formtips_onError">'+errorMsg+'</span>');
				} else {
					var okMsg = '输入正确。';
					$parent.append('<span class="formtips_onSuccess">'+okMsg+'</span>');
				}
			}
			if ($(this).is('#tel')) {
				if (this.value=="" || (this.value!="" && !/^1[3456789]\d{9}$/.test(this.value) ) ) {
					var errorMsg = '请输入正确的手机号码';
					$parent.append('<span class="formtips_onError">'+errorMsg+'</span>');
				} else {
					var okMsg = '输入正确';
					$parent.append('<span class="formtips_onSuccess">'+okMsg+'</span>');
				}
			}
			if ($(this).is('#apart')) {
				if (this.value=="" ) {
					var errorMsg = '请输入工作地址';
					$parent.append('<span class="formtips_onError">'+errorMsg+'</span>');
				} else {
					var okMsg = '输入正确';
					$parent.append('<span class="formtips_onSuccess">'+okMsg+'</span>');
				}
			}
			if ($(this).is('#cfcode')) {
				if (this.value=="" ) {
					var errorMsg = '请输入验证码';
					$parent.append('<span class="formtips_onError">'+errorMsg+'</span>');
				} else {
					var okMsg = '输入正确';
					$parent.append('<span class="formtips_onSuccess">'+okMsg+'</span>');
				}
			}
		});
		$('#send').click(function(){
			$("form .required:input").trigger('blur');
			var numError = $('form .formtips_onError').length;
			if (numError) {
				alert("请输入注册信息！")
				return false;
			}
			alert("成功！");
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
	//根据id内的值，判断使用类型为注册或修改信息
		String id ="0";
		String susername = "";
		String spassword = "";
		String name = "";
		String usertype = "1";
		String tel = "";
		String email = "";
		String apart = "";
		String fhref = "";
		
		if (request.getParameter("id") != null && request.getParameter("id") != "") {
			fhref="修改";
			try {
				String sql = "SELECT * FROM tb_account WHERE id = '" + request.getParameter("id") + "'";
				ResultSet rs = ConnDB.query(sql);
				
				if (rs.next()) {
					id = rs.getString("id"); //id
					susername = (rs.getString("susername"));
					spassword = (rs.getString("spassword"));
					name = (rs.getString("name"));
					tel = (rs.getString("tel"));
					email = (rs.getString("email"));
					apart = (rs.getString("apart"));
					usertype = (rs.getString("usertype"));
					rs.close(); // 关闭ResultSet
					ConnDB.close();
				}  
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else {
			fhref = "注册";
		}
	%>
	<form name="form1" method="POST">
	<div class="container">
	<img src="img/e29.JPG" class="jpg">
	<div class="all">
	<h1><%=fhref %></h1>
		<div class="int">
			<label for="username">用户名：&nbsp;&nbsp;&nbsp;</label>
			<input id="username" type="text" name="username" class="required" value="<%=susername %>" placeholder="请输入不小于6个字符"/>
		</div>
		<div class="int">
			<label for="pass">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
			<input id="pass" type="password" name="password" class="required" value="<%=spassword%>"placeholder="密码长度不小于6"/>
		</div>
		<div class="int">
			<label for="pass2">确认密码：</label>
			<input type="password" id="pass2" class="required" value="<%=spassword %>" placeholder="注意输入一致"/>
		</div>
		<div class="int">
			<label for="name">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
			<input type="text" class="required" id="name" name="name" value="<%=name %>" placeholder="2位以上汉字"/>
		</div>
		<div class="int">
			<label for="email">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
			<input type="text" id="email" class="required" name="email" value="<%=email %>" placeholder="xxxxx@xx.xx"/>
		</div>
		<div class="int">
			<label for="tel">手机号码：</label>
			<input type="text" id="tel" class="required" name="tel" value="<%=tel %>" placeholder="请输入11位数字"/>
		</div>
		<div class="int">
			<label for="apart">工作单位：</label>
			<input type="text" id="apart" value="<%=apart %>" name="apart" class="required"/>
		</div>
		<div class="int">
			<label for="cfcode">验证码：&nbsp;&nbsp;&nbsp;</label>
			<input type="text" name="cfcode" id="cfcode" value="uwv6" class="required" placeholder="注意右侧验证码大小写">
			<img src="img/timg.jpg" alt="验证码" width="60" height="20"/>
		</div>
		<div class="int">
			<label for="usertype">用户类型</label>
			<input type="radio" name="usertype" value="1" checked="checked">学生
			<input type="radio" name="usertype" value="2">教师
			<input type="radio" name="usertype"value="0">其他
			<input type="hidden" name="id" value="<%=id%>">
		</div>
		<div>
			<input type="submit" value="提交" id="send" class="sub"/>
			<input type="reset" id="res" class="sub"/>
		</div>
		</div>
	</div>
	</form>
	<script type="text/javascript">	
	
	var radios = document.getElementsByName('usertype');
	for (var i = 0, length = radios.length; i < length; i++) {
		if (radios[i].value=='<%=usertype%>') {
			radios[i].checked = true;
			// 选中后退出循环
			break;
		}
	} 
		if(form1.id.value=="0") //跳转选项
		{
			form1.action="RgstrServlet";
		}else//修改
		{	
			form1.action="UpdateServlet";
		}
	</script>
</body>
</html>