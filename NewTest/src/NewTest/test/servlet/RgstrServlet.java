package NewTest.test.servlet;
/**
 * 调用sql语句，连接数据库，将提交的注册信息导入数据库
 * 若成功，随后跳转至user_info.jsp界面
 * 若失败，返回Rgstr界面，重新输入
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.NewTest.db.ConnDB;

@WebServlet("/RgstrServlet")
public class RgstrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RgstrServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		System.out.println(request.getParameter("username"));
		
		String sql = "INSERT INTO tb_account(susername, spassword, name, tel, email, apart, usertype) VALUES('" +
				request.getParameter("username")+"','" + request.getParameter("password") + "','" + 
				request.getParameter("name") + "','" + request.getParameter("tel") + "','" + 
				request.getParameter("email") + "','" + request.getParameter("apart") + "','" + 
				request.getParameter("usertype") + "')";
		
		System.out.print(sql);
		
		int rows = ConnDB.update(sql);
		request.setAttribute("fhref", "注册");
		if (rows > 0) {			
			request.getRequestDispatcher("user_info.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("LoginError.jsp").forward(request, response);
		}
		ConnDB.close();
	}
}

