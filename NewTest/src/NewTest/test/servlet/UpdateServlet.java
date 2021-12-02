package NewTest.test.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.NewTest.db.ConnDB;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateServlet() {
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
		response.setCharacterEncoding("UTF-8");
		//System.out.println(request.getParameter("id"));
		int id = Integer.parseInt(request.getParameter("id"));
		//System.out.println("OKKK!");

		String sql = "UPDATE tb_account " + "SET susername='" + request.getParameter("username")
				+ "',spassword='" + request.getParameter("password") + "',name='" + request.getParameter("name")+ 
				"',usertype='" + request.getParameter("usertype") + "',tel='" + request.getParameter("tel")
				+ "',email='" + request.getParameter("email") + "',apart='" + request.getParameter("apart") 
				 + "' WHERE id = " + id;
		System.out.print(sql);
		int rows = ConnDB.update(sql);
		request.setAttribute("fhref", "ÐÞ¸Ä");
		if (rows > 0) {
			request.getRequestDispatcher("RegResult.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("Index.jsp").forward(request, response);
		}
		ConnDB.close();

	}

}
