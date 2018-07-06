package blog.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.dao.ArticleDao;
import blog.dao.UserDao;
import blog.daoImpl.UserDaoImpl;
import blog.db.VisitorDB;
import blog.model.User;
import blog.service.ArticleService;
import blog.service.TagService;
import blog.utils.StringUtils;

/**
 * Login->index.jsp->init data
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (StringUtils.isEmpty(username) && StringUtils.isEmpty(password)) {

			LoginServlet.initialzation(request, response);
		} else {
			UserDao dao = UserDaoImpl.getInstance();
			User user = dao.login(username, password);
			if (user == null) {
				
				response.sendRedirect("/Blog/login.html");
				 
			} else {
			
				HttpSession session = request.getSession();
				session.setAttribute("userName", user.getUser_name());
				session.setAttribute("power", user.getUser_power());
				LoginServlet.initialzation(request, response);

			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private static void initialzation(HttpServletRequest request, HttpServletResponse response) {
		
		ArticleService as = ArticleService.getInstance();
//		初始化页码
		int page=1;
		int totalUsers = as.getCount(ArticleDao.SEARCH_ARTICLE);
		int usersPerPage = 4;
		int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
		 int beginIndex = (page - 1) * usersPerPage;
		request.setAttribute("page", page);
		request.setAttribute("totalPages", totalPages);
//		初始化分类
		request.setAttribute("sort_count_map", as.getSortAndCount());
		// 初始化文章列表
		request.setAttribute("article_list", as.getArticle());
		request.setAttribute("article_Pagelist", as.getPageArticle(beginIndex, usersPerPage));
		// 初始化获取标签
		TagService ts = TagService.getInstance();
		request.setAttribute("tag_list", ts.getAllTag());


		// 初始化侧边栏 日志、分类、标签的个数
		request.setAttribute("article_number", as.getCount(ArticleDao.SEARCH_ARTICLE));
		request.setAttribute("sort_number", as.getCount(ArticleDao.SEARCH_SORT));
		request.setAttribute("tags_number", ts.getTagCount());

		// 阅读排行
		request.setAttribute("visit_rank", as.getVisitRank());

		// 传网站的统计数据
		request.setAttribute("visited", VisitorDB.totalVisit());
		request.setAttribute("member", VisitorDB.totalMember());

		// 转发到 博客主页 界面
		try {
			request.getRequestDispatcher("/Newindex.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
