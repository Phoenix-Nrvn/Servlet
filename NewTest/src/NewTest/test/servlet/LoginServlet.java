package NewTest.test.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userInfo.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		
		
		if (username.equals("3190911") && password.equals("123456")) {
			//创建user对象，保存账号、密码
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			//登录成功，跳转指定页面
			PrintWriter out1 = response.getWriter();
			// 设置request的编码
			request.setCharacterEncoding("utf-8");
			
			out1.println("用户名"+username+"<br>");
			out1.println("密码"+password+"<br>");
			//创建Session对象，保存user对象
			//request.getSession().setAttribute("user", user);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect("IndexServlet");
			//out1.println("点击进入<a href='Manage.jsp'>用户管理</a>界面");
			
		}
		else {
			out.println("账号或密码错误，点击<a href='Index.jsp'>重新</a>输入......");
			//response.sendRedirect("Index.jsp");
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
