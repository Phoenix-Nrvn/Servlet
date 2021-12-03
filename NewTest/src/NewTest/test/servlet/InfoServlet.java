package NewTest.test.servlet;
/**
 * 一方面通过建立Cookie，对用户信息进行记忆
 * 同时起到一个承接跳转的作用
 */
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.NewTest.db.ConnDB;

/**
 * Servlet implementation class InfoServlet
 */
@WebServlet("/InfoServlet")
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InfoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			String sql = "SELECT * FROM tb_account WHERE susername='" + username + "' and spassword='" + password + "'";
			ResultSet rs = ConnDB.query(sql); // mysql执行后返回到结果集合

			if (rs.next()) { // 判断光标向后移动，并判断是否有效
				HttpSession session = request.getSession();
				session.setAttribute("username", username);// 保存用户名到session对象中
				System.out.println(username);
				String[] r = request.getParameterValues("isChecked");
				if (r != null && r.length > 0) {
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
					// 如果用户取消了记住账户信息，则应该对cookie里的信息进行清理
					Cookie[] cookies = request.getCookies();
					if (cookies != null && cookies.length > 0) {
						for (Cookie c : cookies) {
							if (c.getName().equals("usernameCookie") || c.getName().equals("passwordCookie")) {
								// 使cookie过期
								c.setMaxAge(0);
								response.addCookie(c);
							}
						}
					}
				}
				rs.close(); // 关闭ResultSet
				ConnDB.close(); // 关闭数据库
				request.getRequestDispatcher("FindServlet").forward(request, response);
			} else {
				rs.close(); // 关闭ResultSet
				System.out.println("Ouch!");
				request.getRequestDispatcher("LoginError.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
