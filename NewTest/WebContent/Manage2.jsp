<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="userInfo.User"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Manager!</title>
<!-- 外部样式 style.css -->
<link rel="stylesheet" type="text/css" href="css/Mnge.css" />

<span id="date"> <script type="text/javascript"
		language="JavaScript">
		function usertypee(val) {	
			if (val == '0') {
				return '管理员';
			} else if (val == '1') {
				return '学生';
			} else if (val == '2') {
				return '教师';
			}
		}
			var d= new Date();
			var myYear = d.getFullYear();
			var myMonth = d.getMonth() + 1;
			var myDay = d.getDate();
			var myHour = d.getHours();
			var myMinute = d.getMinutes();
			var mySecond = d.getSeconds();
			document.write(myYear+"-"+myMonth+"-"+myDay+" "+myHour+":"+myMinute+":"+mySecond);
		</script>
</span>
<script language="JavaScript">
			function checkSearch() {
				var str = form2.search.value;
				if (str == "") {
					alert("请输入真实姓名！");
					form1.search.focus();
					return;
				} /*else {
					var objExp = /[\u4E00-\u9FA5]{2,}/;
					if (objExp.test(str) == true) {
						alert("输入正确! ");
					}
					else {
						alert("输入有误，请输入真实姓名！");
					}
				}*/
			}
		</script>
</head>
<body>
	<%
		String name = "";
		if (session.getAttribute("username") == null) //获取session内的对象
		{
			response.sendRedirect("Index.jsp");
		} else {
			name = (String) session.getAttribute("username");
		}
		/*java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat dtf = new java.text.SimpleDateFormat("yyyy/MM/dd");*/ //<%=name
	%>
	<div>
		<a href="Index.jsp" class="exit">退出</a>
	</div>
	<div id="div2">
		<div>
			<div id="header">
				<span id="linkage"> <%=name %>, Hello!
				</span>
			</div>
		</div>
	</div>
	<div id="div1">
		<h1>管理</h1>
	</div>
	<form id="form2" method="post" action="FindServlet">
		<div id="div3">
		<input type="text" name="search" id="search" placeholder="用户名/姓名"/> 
		<input type="submit" name="btnSearch" onclick="checkSearch()" id="btnSearch" value="查找" />
		<a href="Rgstr.jsp">
		<input type="button" name="btnEdit" id="btnEdit" value="添加" /></a>
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
				</tr>
				<%
			// 获取用户信息集合
			List<User> list = (List<User>) request.getAttribute("list");
			// 判断集合是否有效
			if (list == null || list.size() < 1) {
						out.print("没有数据！");
					} else {
						 
						// 遍历图书集合中的数据
						for (User userinfo : list) {
				%>
				<tr align="center" bgcolor="white">
					<td><%=userinfo.getUsername()%></td>
					<td><%=userinfo.getName()%></td>
					<td><script type="text/javascript">document.write(usertypee('<%=userinfo.getUsertype()%>'));</script></td>
					<td><%=userinfo.getTel()%></td>
					<td><%=userinfo.getEmail()%></td>
					<td><%=userinfo.getApart()%></td>
					<td><a href='Rgstr.jsp?id=<%=userinfo.getId()%>'
						onclick="if(confirm('是否真的编辑该用户')==true){return true;}else {return false;}">编辑</a>
						<a href='DeleteServlet?id=<%=userinfo.getId()%>'
						onclick="if(confirm('是否真的删除该用户')==true){return true;}else {return false;}">删除</a></td>

				</tr>
				<%
					}
					}
				%>
			</table>
		</div>
		<div id="p1">lssxxx@163.com</div>
	</form>
	</div>
</body>
</html>