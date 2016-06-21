package cn.com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.dao.UserDao;
import cn.com.model.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");
		UserDao userdao = new UserDao();
		HttpSession session = request.getSession();

		// 用户登录
		if ("login".equals(flag)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			User user = userdao.login(username, password);
			if (user != null) {
				Cookie cookie1 = new Cookie("username", URLEncoder.encode(
						username, "UTF-8"));
				Cookie cookie2 = new Cookie("password", password);
				cookie1.setMaxAge(60 * 60*24*365);
				cookie2.setMaxAge(60 * 60*24*365);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				session.setAttribute("usertype", user.getUser_type());
				session.setAttribute("userid", user.getUser_id());
				request.getRequestDispatcher("InfoServlet?flag=infolist").forward(request,
						response);
			} else {
				request.setAttribute("loginstatus", "0");
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			}
		}

		// 用户注册
		if ("register".equals(flag)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");			
			int i = userdao.checkname(username);
			if (i == 1) {
				request.getRequestDispatcher("register.jsp").forward(request,
						response);
			} else if (i == 0) {
				Cookie cookie1 = new Cookie("username", URLEncoder.encode(
						username, "UTF-8"));
				Cookie cookie2 = new Cookie("password", password);
				cookie1.setMaxAge(60 * 60);
				cookie2.setMaxAge(60 * 60);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				int j = userdao.register(username, password);
				if (j > 0) {
					response.sendRedirect("login.jsp");
				}
			}
		}

		// 查找用户列表
		if ("userlist".equals(flag)) {
			int page = 1;
			String newpage = request.getParameter("newpage");
			if (newpage != null && !"".equals(newpage)) {
				page = Integer.parseInt(newpage);
			}
			int num = 10;
			int start = (page - 1) * num;
			int maxnum = userdao.userlistmaxnum();
			int maxpage = maxnum % num > 0 ? maxnum / num + 1 : maxnum / num;
			List<User> userlist = userdao.userlist(start, num);
			request.setAttribute("userlist", userlist);
			request.setAttribute("page", page);
			request.setAttribute("start", start);
			request.setAttribute("maxpage", maxpage);
			request.getRequestDispatcher("userlist.jsp").forward(request,
					response);
		}

		// 跳至用户修改界面
		if ("edituser".equals(flag)) {
			String newpage = request.getParameter("newpage");
			int userid = Integer.parseInt(request.getParameter("userid"));
			User user = userdao.editsearchbyid(userid);
			request.setAttribute("user", user);
			request.setAttribute("newpage", newpage);
			request.getRequestDispatcher("edituser.jsp").forward(request,
					response);
		}

		// 保存用户修改
		if ("saveedituser".equals(flag)) {
			String newpage = request.getParameter("newpage");
			int userid = Integer.parseInt(request.getParameter("userid"));
			String password = request.getParameter("password");
			boolean f = userdao.saveedituser(userid, password);
			if (f) {
				request.setAttribute("newpage", newpage);
				request.getRequestDispatcher("UserServlet?flag=userlist")
						.forward(request, response);
			}
		}

		// 封锁或解封用户
		if ("deluser".equals(flag)) {
			String newpage = request.getParameter("newpage");
			int userid = Integer.parseInt(request.getParameter("userid"));
			int userstatus = Integer.parseInt(request
					.getParameter("userstatus"));
			boolean f = userdao.deluser(userid, userstatus);
			if (f) {
				request.setAttribute("newpage", newpage);
				request.getRequestDispatcher("UserServlet?flag=userlist")
						.forward(request, response);
			}
		}

		// 搜索
		if ("search".equals(flag)) {
			String searchval = request.getParameter("searchval");
			String mark = request.getParameter("mark");
			int page = 1;
			String newpage = request.getParameter("newpage");
			if (newpage != null && !"".equals(newpage)) {
				page = Integer.parseInt(newpage);
			}
			int num = 10;
			int start = (page - 1) * num;
			int maxnum = userdao.searchmaxnum(searchval);
			int maxpage = maxnum % num > 0 ? maxnum / num + 1 : maxnum / num;
			List<User> userlist = userdao.search(searchval, mark, start, num);
			request.setAttribute("userlist", userlist);
			request.setAttribute("page", page);
			request.setAttribute("start", start);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("searchval", searchval);
			request.getRequestDispatcher("userlist.jsp").forward(request,
					response);
		}
		
		if ("checkusername".equals(flag)) {
			String username = request.getParameter("username");	
			int i = userdao.checkname(username);
			if(i==1){
//				response.setContentType("text/html;charset=UTF-8");//设置类型
				PrintWriter out = response.getWriter();
				out.write("false");
				out.flush();
				out.close();
			}
		}
		
		if("exit".equals(flag)){
			session.invalidate();
			response.sendRedirect("login.jsp");
		}
	}

}
