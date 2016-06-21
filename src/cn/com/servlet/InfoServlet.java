package cn.com.servlet;

import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.dao.InfoDao;
import cn.com.model.Info;

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
		InfoDao infodao = new InfoDao();
		String flag = request.getParameter("flag");
		HttpSession session = request.getSession();
		// 主页与维护页面的投票列表展示功能和搜索功能
		if ("infolist".equals(flag)) {
			// 获取搜索关键字和标记，标记用于判断主页与维护页
			String keyword = request.getParameter("keyword");
			String mark = request.getParameter("mark");
			// 【开始】计算页面部分
			int page = 1;
			// 获取新页码
			String newpage = request.getParameter("newpage");
			// 没有新页码默认为第一页
			if (newpage != null && !"".equals(newpage)) {
				page = Integer.parseInt(newpage);
			}
			// 定义每页显示条数，计算每页起始条，获取总条数，计算总页数
			int num = 10;
			int start = (page - 1) * num;
			int maxnum = infodao.infolistmaxnum(keyword);
			int maxpage = maxnum % num > 0 ? maxnum / num + 1 : maxnum / num;
			// 【结束】计算页面部分
			// 获取信息列表
			List<Info> infolist = infodao.infolist(start, num, keyword);
			// 存储下个页面需要用得到的值
			request.setAttribute("infolist", infolist);
			request.setAttribute("keyword", keyword);
			request.setAttribute("page", page);
			request.setAttribute("start", start);
			request.setAttribute("maxpage", maxpage);

			if ("weihu".equals(mark)) {
				// 跳转至维护页
				request.getRequestDispatcher("weihu.jsp").forward(request,
						response);
			} else {
				// 跳转至主页
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			}
		}

		// 显示投票结果功能
		if ("clicktitle".equals(flag)) {
			// 获取投票id
			int infoid = Integer.parseInt(request.getParameter("infoid"));
			// 查找投票信息
			Info info = infodao.clicktitlesearchtitle(infoid);
			request.setAttribute("info", info);
			// 查找选项信息
			List<Info> infolist = infodao.clicktitlesearch(infoid,
					info.getInfo_pnum());
			request.setAttribute("infolist", infolist);
			// 跳至投票结果页面
			request.getRequestDispatcher("singleshow.jsp").forward(request,
					response);
		}

		// 点击“我要参与”进入
		if ("clickjoin".equals(flag)) {
			// 获取投票id
			int infoid = Integer.parseInt(request.getParameter("infoid"));
			// 获取投票信息
			Info info = infodao.clicktitlesearchtitle(infoid);
			request.setAttribute("info", info);
			// 获取选项信息
			List<Info> infolist = infodao.clickjoinsearch(infoid);
			request.setAttribute("infolist", infolist);
			// 跳至参与投票页面
			request.getRequestDispatcher("singlejoin.jsp").forward(request,
					response);
		}

		// 参与投票功能
		if ("join".equals(flag)) {
			// 获取用户id与投票id
			int userid = Integer.parseInt(session.getAttribute("userid")
					.toString());
			int infoid = Integer.parseInt(request.getParameter("infoid"));
			// 获取用户是否已经投过该投票
			String infoid_s = infodao.searchkongzhi(userid, infoid);
			if ("".equals(infoid_s) || infoid_s == null) {
				// 未进行投票，可以投票
				// 获取选择的选项
				String[] options = request.getParameterValues("options");
				int f = 0;
				// 为选择的选项增加一票
				for (int i = 0; i < options.length; i++) {
					f = infodao.join(infoid, options[i], i) + f;
				}
				if (f > 0) {
					// 若仅投一个选项，则记录，用于删除选项时减去相应的总投票人数
					if (f == 1) {
						infodao.join(infoid, options[0], -1);
					}
					request.setAttribute("infoid", infoid);
					// 进行标记，表示该用户已投过该投票
					boolean t = infodao.addkongzhi(infoid, userid);
					if (t)
						request.setAttribute("options", options);
					request.getRequestDispatcher("toupiaojieguo.jsp").forward(
							request, response);
				}
			} else {
				// 已投过票，不可投票
				request.setAttribute("infoid", infoid);
				request.setAttribute("mark", 0);
				request.getRequestDispatcher("toupiaojieguo.jsp").forward(
						request, response);
			}
		}

		// 新增投票功能
		if ("addinfo".equals(flag)) {
			// 获取投票标题，单选多选，选项
			String infotitle = request.getParameter("infotitle");
			int danshuang = Integer.parseInt(request.getParameter("danshuang"));
			String[] xx_content = request.getParameterValues("options");
			// 新增一个投票，存储标题，单双，选项数
			int infoid = infodao.addinfo(infotitle, danshuang,
					xx_content.length);
			if (infoid > 0) {
				boolean t = false;
				// 将选项添加至该投票中
				for (int i = 0; i < xx_content.length; i++) {
					t = infodao.addxuanxiang(xx_content[i], i, infoid);
				}
				if (t) {
					request.getRequestDispatcher("addjieguo.jsp").forward(
							request, response);
				}
			}
		}

		// 点击“来来维护”进入
		if ("clickweihu".equals(flag)) {
			// 获取投票id
			int infoid = Integer.parseInt(request.getParameter("infoid"));
			// 获取该投票详情
			List<Info> infolist = infodao.clickjoinsearch(infoid);
			request.setAttribute("infolist", infolist);
			request.setAttribute("infoid", infoid);
			request.getRequestDispatcher("saveweihu.jsp").forward(request,
					response);
		}

		// 保存维护功能
		if ("saveweihu".equals(flag)) {
			// 获取清除标记（用于判断是否清空票数），投票id，标题，单双，选项，选项id
			String clear = request.getParameter("clear");
			int infoid = Integer.parseInt(request.getParameter("infoid"));
			String infotitle = request.getParameter("infotitle");
			String danshuang = request.getParameter("danshuang");
			String[] xx_content = request.getParameterValues("options");
			String markid = request.getParameter("markid");
			// 执行清空票数操作
			if ("yes".equals(clear)) {
				// 清空总投票人数
				boolean f = infodao.saveweihuiclear(infoid);
				// 清空选项的票数与人数
				if (f) {
					boolean h = infodao.xuanxiangclear(infoid);
					// 清空已投票人的限制记录
					if (h) {
						infodao.kongzhiclear(infoid);
						request.setAttribute("infoid", infoid);
						// 标记，表示已清空（用于选择维护结果页面显示内容）
						request.setAttribute("mark", 1);
						request.getRequestDispatcher("weihujieguo.jsp")
								.forward(request, response);
					}
				}
			}
			// 执行删除选项操作
			else if ("del".equals(clear)) {
				// 删除选中的选项
				int pnum = infodao.delxx(markid, infoid);
				if (pnum >= 0) {
					// 循环降低删除的选项之后的选项id，保持选项id的顺序不中断
					for (int i = Integer.parseInt(markid) + 1; i <= 20; i++) {
						boolean p = infodao.changemark(i, infoid);
						// 如果没有没有可以降低的id了，跳出循环
						if (!p) {
							break;
						}
					}
					// 为该投票减去相应的总投票人数和选项数
					
						infodao.jianpnum(infoid, pnum);
					request.getRequestDispatcher("InfoServlet?flag=clickweihu")
							.forward(request, response);

				}
			}
			//执行删除投票操作
			else if("delall".equals(clear)){
				//删除所有与该投票相关的数据
				boolean f = infodao.delall(infoid);
				if(f){
					request.setAttribute("mark", 3);
					request.getRequestDispatcher("weihujieguo.jsp")
					.forward(request, response);
				}
			}
			// 执行普通的保存修改操作
			else {
				// 保存该投票的标题，单双，选项数量
				boolean f = infodao.saveweihuinfo(infoid, danshuang, infotitle,
						xx_content.length, clear);
				if (f) {
					boolean t = false;
					// 更新选项内容
					for (int i = 0; i < xx_content.length; i++) {
						t = infodao.saveweihuxx(i, xx_content[i], infoid);
					}
					if (t) {
						request.setAttribute("infoid", infoid);
						// 标记，表示已保存（用于选择维护结果页面显示内容）
						request.setAttribute("mark", 2);
						request.getRequestDispatcher("weihujieguo.jsp")
								.forward(request, response);
					}
				}
			}
		}

	}

}
