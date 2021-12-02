package NewTest.test.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userInfo.User;

@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//解决乱码问题
		response.setContentType("text/html; charset=UTF-8");
		//创建Session对象保存用户信息
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		
		//创建user对象，保存账号、密码
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		//创建Session对象，保存user对象
		request.getSession().setAttribute("user", user);
		//登录成功，跳转指定页面
		PrintWriter out1 = response.getWriter();
		// 设置request的编码
		request.setCharacterEncoding("utf-8");
		
		out.println("用户信息如下"+"<br>");
		out1.println("用户名"+username+"<br>");
		out1.println("密码"+password+"<br>");
			
		HttpSession session = request.getSession();
		//方法体中的参数要与setAttribute()键一致
		if (user.getUsername() == null) {
			response.getWriter().print("您还未登录，请<a href='Index.jsp'>登录</a>");
		}
		else {
			response.setHeader("Refresh", "5;url=Manage.jsp?username1="+user.getUsername());
			Cookie c = new Cookie("JSESSIONID",session.getId());
			c.setMaxAge(30*60);
			c.setPath("Index.jsp");
			response.addCookie(c);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
