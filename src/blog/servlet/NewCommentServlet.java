package blog.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.model.Comment;
import blog.service.CommentService;
import blog.utils.DateUtils;
import blog.utils.FailException;
import blog.utils.Form2Bean;

/**
 * Servlet implementation class NewCommentServlet
 */
@WebServlet("/NewCommentServlet")
public class NewCommentServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cookie_name = "comment_cookie"+request.getParameter("id");
		
		//判断是否恶意提交
	
		
		//返回的信息		
		String info;		
			
		Comment cm ;
		//获取对象
		try {
			cm = Form2Bean.commentForm2Bean(request);
			CommentService cs = CommentService.getInstance();
			boolean result = cs.addComment(cm);
			if(!result){
				info="comment failed!";
			}else{
				info="comment success!";
			}
		} catch (FailException e) {	
			e.printStackTrace();
			info="comment failed!";			
		}
		
				
		
		request.setAttribute("info", info);
		request.getRequestDispatcher("/ArticleServlet").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
