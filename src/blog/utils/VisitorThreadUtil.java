package blog.utils;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.db.VisitorDB;

public class VisitorThreadUtil extends Thread{
	private HttpServletRequest rq;
	private HttpServletResponse rp;
	
	public VisitorThreadUtil(HttpServletRequest rq,HttpServletResponse rp){
		this.rp = rp;
		this.rq=  rq;
	}
	
	
	public void run(){
		
		// 向数据库写入信息
		VisitorDB.visit(rq);

		// 发送新的cookie
		Cookie c = new Cookie("myblog_visitor", DateUtils.getFormatDate(new Date()));
		// cookie生命周60分钟
		c.setMaxAge(60 * 60);
		c.setPath("/Blog");
		rp.addCookie(c);
	}

}
