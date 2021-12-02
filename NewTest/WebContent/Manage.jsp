<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.net.URLEncoder"%>
    <%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Manager!</title>
		<style type="text/css">
			#div1 {
				font_family: "微软雅黑";
				color: darkcyan;
				padding-left: 15px;
			}
			#div2 {
				border-width: 3px;
				
				border-color: #F0F8FF;
				margin-left: 15px;
				box-shadow: 0px 0px 5px 5px #85a385;
			}
			#div3 {
				padding-left: 15px;
			}
			#div4 {
				margin: 15px;
			}
			#linkage {
				font-family: "arial black";
				font-size: 25px;
				color: #ffffff;
			}
			#p1{
				margin-top: 20px;
				padding: 5px 5px 5px 15px;
				color:white;
				background-color: #ffaa00;
				box-shadow: 0px 0px 5px 5px #85a385;
			}
			#header {
				padding:25px 15px 15px 15px;
				margin: 10 10px 10 10px;
				background: #fea900;
				box-shadow: 0px 0px 5px 5px #85a385;
			}
			table,th,td {
				border:1px solid silver;
			}
			table {
				border-collapse: collapse;
			}
			#date {
				float: right;
				padding: 30px 10px 10px 10px;
				height: 40px;
				color: aliceblue;
				text-align: right;
			}
			.exit {
				float: right;
				margin:0 0 0 10px;
				color: #fff;
				line-height: 80px;
			}
			body {
				margin-right: 250px;
				margin-left: 250px;
				margin-top: 100px;
				font-size: 16px;
				font-family: Arial;
				padding: 15px 0;
				background: #FFFFFF;
				background: url(img/53e06e8bba9d9.jpg) no-repeat center center fixed;
				background-size: cover;
			}
		</style>
		<span id="date">
		<script type="text/javascript" language="JavaScript">
			var d= new Date();
			var myYear = d.getFullYear();
			var myMonth = d.getMonth() + 1;
			var myDay = d.getDate();
			var myHour = d.getHours();
			var myMinute = d.getMinutes();
			var mySecond = d.getSeconds();
			document.write(myYear+"-"+myMonth+"-"+myDay+" "+myHour+":"+myMinute+":"+mySecond);
			window.onload = function () {
				var oBton = document.getElementById("btn1");
				oBton.onclick = function() {
					alert("确认更改密码? ");
				};
				var oBt = document.getElementById("btn2");
				oBt.onclick = function() {
					alert("确认删除? ");
				};
			}
		</script>
		</span>
		<script language="JavaScript">
			function checkRealName() {
				var str = form2.RealName.value;
				if (str == "") {
					alert("请输入真实姓名！");
					form1.realName.focus();
					return;
				} else {
					var objExp = /[\u4E00-\u9FA5]{2,}/;
					if (objExp.test(str) == true) {
						alert("输入正确! ");
					}
					else {
						alert("输入有误，请输入真实姓名！");
					}
				}
			}
		</script>
	</head>
	<body>
	<% 
    request.setCharacterEncoding("UTF-8"); 
    // 首先判断用户是否勾选了记住账户信息,如果勾选了值默认是on,也可以通过input的value属性设置 
    String[] r = request.getParameterValues("isChecked"); 
    if(r != null && r.length > 0) { 
        // 获取输入的username和password,进行编码 
        String username = URLEncoder.encode(request.getParameter("username"), "UTF-8"); 
        String password = URLEncoder.encode(request.getParameter("password"), "UTF-8"); 
        // 新建cookie对象 
        Cookie usernameCookie = new Cookie("usernameCookie", username); 
        Cookie passwordCookie = new Cookie("passwordCookie", password); 
        // 设置cookie的有效期7天，单位为秒 
        usernameCookie.setMaxAge(604800); 
        passwordCookie.setMaxAge(604800); 
        // 写入cookie对象 
        response.addCookie(usernameCookie); 
        response.addCookie(passwordCookie); 
    } else { 
        //如果用户取消了记住账户信息，则应该对cookie里的信息进行清理 
        Cookie[] cookies = request.getCookies(); 
        if(cookies != null && cookies.length > 0) { 
            for(Cookie c:cookies) { 
                if(c.getName().equals("usernameCookie") || c.getName().equals("passwordCookie")) { 
                    // 使cookie过期 
                    c.setMaxAge(0); 
                    response.addCookie(c); 
                } 
            }
        }
    }
    %> 
    <%
    // 读取cookie里的信息
    request.setCharacterEncoding("utf-8"); 
    /*HttpServletResponse httpServletResponse = FacesUtil.getHttpServletResponse();
    Cookie cookie = new Cookie(ConstantProp.DEFAULT_P2PTYPE,CCaiConstantProp.P2PTYPE);
    cookie.setDomain("localhost");
    cookie.setPath("/");
    httpServletResponse.addCookie(cookie);
    Cookie cc = new Cookie("JSESSIONID",session.getId());
	cc.setMaxAge(30*60);
	cc.setPath("Index.jsp");
	response.addCookie(cc);*/
    String username = ""; 
    String password = ""; 
    Cookie[] cookies = request.getCookies();
    if(cookies != null && cookies.length > 0) { 
        for(Cookie c:cookies) { 
            if(c.getName().equals("usernameCookie")) { 
                // 解码 
                username = URLDecoder.decode(c.getValue(), "utf-8");
            } else if(c.getName().equals("passwordCookie")) { 
                password = URLDecoder.decode(c.getValue(), "utf-8"); 
            } 
        } 
    } 
    else {
    	response.sendRedirect("Index.jsp");
    }
	//方法体中的参数要与setAttribute()键一致
	String user = request.getParameter("username");
	session.setAttribute("username", user);
	%>
	<%
		String path = request.getContextPath();
		String username1 = request.getParameter("username1");
	%>
	<div><a href="Index.jsp" class="exit">退出</a></div>
		<div id="div2">
		<div>
			<div id="header">
					<span id="linkage">
						<%=username1 %>, Hello!
					</span>
				</div>
			</div>
		</div>
		<div id="div1"><h1>管理</h1></div>
		<form id = "form2" method="post">
			<div id="div3">
				<input type="text" name="RealName" id="RealName"/>
				<input type="button" name="find1" onclick="checkRealName()" value="查找" />
				<input type="button" id="btn1"  value="修改" />
				<input type="button" id="btn2" value="删除" />
			</div>
			<div id="div4">
		<table cellspacing="3" align="center" width="100%">
		<tr bgcolor="#ffaa7f">
			<th>用户名</th>
			<th>姓名</th>
			<th>用户类型</th>
			<th>手机号</th>
			<th>邮箱</th>
			<th>所在单位</th>
			<th>操作</th>
		</tr>
		<tr>
			<td align="right">三儿</td>
			<td align="right">张三</td>
			<td align="right">学生</td>
			<td align="center">13089561238</td>
			<td align="center">578962156.stu.xaut.edu</td>
			<td align="right">计算机学院</td>
			<td align="center"><a href="#">修改密码</a></td>
		</tr>
		<tr>
			<td align="right">四儿</td>
			<td align="right">李四</td>
			<td align="right">学生</td>
			<td align="center">13089264568</td>
			<td align="center">578961236.stu.xaut.edu</td>
			<td align="right">水利学院</td>
			<td align="center"><a href="#">修改密码</a></td>
		</tr>
		<tr>
			<td align="right">五儿</td>
			<td align="right">王五</td>
			<td align="right">老师</td>
			<td align="center">13082341238</td>
			<td align="center">578567856.stu.xaut.edu</td>
			<td align="right">机械学院</td>
			<td align="center"><a href="#">重置密码</a></td>
		</tr>
		</table>
		</div>
		<div id="p1">lssxxx@163.com</div>
		</form>
		</div>
	</body>
</html>