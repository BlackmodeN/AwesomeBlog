package blog.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.dao.ArticleDao;
import blog.db.VisitorDB;
import blog.service.ArticleService;
import blog.service.TagService;

@WebServlet("/PageServlet")

public class PageableListServlet extends HttpServlet {
	private ArticleService as = ArticleService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String p = req.getParameter("page");
		int page;
		try {
			// 当前页数
			page = Integer.valueOf(p);
		} catch (NumberFormatException e) {
			page = 1;
		}
		// 用户总数
		int totalUsers = as.getCount(ArticleDao.SEARCH_ARTICLE);
		// 每页用户数
		int usersPerPage = 5;
		// 总页数
		int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
		// 本页起始用户序号
		int beginIndex = (page - 1) * usersPerPage;
		req.setAttribute("article_Pagelist", as.getPageArticle(beginIndex, usersPerPage));
		req.setAttribute("page", page);
		req.setAttribute("totalPages", totalPages);

	
		// 初始化获取标签
		TagService ts1 = TagService.getInstance();
		req.setAttribute("tag_list", ts1.getAllTag());

		// 初始化侧边栏 日志、分类、标签的个数
		req.setAttribute("article_number", as.getCount(ArticleDao.SEARCH_ARTICLE));
		req.setAttribute("sort_number", as.getCount(ArticleDao.SEARCH_SORT));
		req.setAttribute("tags_number", ts1.getTagCount());
		req.setAttribute("sort_count_map", as.getSortAndCount());

		// 阅读排行
		req.setAttribute("visit_rank", as.getVisitRank());

		// 传网站的统计数据
		req.setAttribute("visited", VisitorDB.totalVisit());
		req.setAttribute("member", VisitorDB.totalMember());
		req.getRequestDispatcher("/Newindex.jsp").forward(req, resp);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}