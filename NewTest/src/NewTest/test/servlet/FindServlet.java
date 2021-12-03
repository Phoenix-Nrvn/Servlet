package NewTest.test.servlet;
/**
 * 连接数据库，SELECT子句，提供在数据库中根据id查找信息的服务
 * 建立ArrayList，将数据库中信息导出到list，特别地：
 * 1. 为list添加"list"属性，以便之后将数据在Manage2.jsp中显示
 * 2. 根据search的内容是否为空，确定是查找时输出单条信息还是全部读取
 */
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userInfo.User;
import cn.NewTest.db.ConnDB;

/**
 * Servlet implementation class FindServlet
 */
@WebServlet("/FindServlet")
public class FindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			String searchtext = request.getParameter("search");
			
			String sql = "SELECT * FROM tb_account";
			
			if(searchtext != null && !searchtext.equals(""))
			{
				sql = sql + " WHERE susername LIKE '%" + searchtext + "%' or name LIKE '%" + searchtext + "%'";
			}

			ResultSet rs = ConnDB.query(sql);
			
			List<User> list = new ArrayList<User>();
			// 获取数据库中的信息，进入list
			while (rs.next()) {
				User userinfo = new User();
				userinfo.setId(rs.getString("id"));
				userinfo.setUsername(rs.getString("susername"));
				userinfo.setPassword(rs.getString("spassword"));
				userinfo.setUsertype(rs.getString("usertype"));
				userinfo.setName(rs.getString("name"));
				userinfo.setEmail(rs.getString("email"));
				userinfo.setApart(rs.getString("apart"));
				userinfo.setTel(rs.getString("tel"));
				list.add(userinfo);
			}
			
			request.setAttribute("list", list);
			rs.close(); // 关闭ResultSet
			ConnDB.close(); // 关闭数据库
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//跳转至管理界面
		request.getRequestDispatcher("Manage2.jsp").forward(request, response);
	}
}
