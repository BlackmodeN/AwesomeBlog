<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="gb2312">
<title>Blog</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/media.css" rel="stylesheet">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
	<div class="ibody">
		<header>
		<h1>生如夏花</h1>
		<h2>
			你看，世人多奇怪。喜欢的人得不到，得到了不珍惜，在一起时怀疑，失去了怀念，怀念的想相见，相见的又恨晚。<br>终其一生，满是遗憾。
		</h2>
		<div class="logo">
			<a href="#"></a>
		</div>
		<nav id="topnav"> <a href="index.jsp">首页</a> <a
			href="about.html">关于我</a> <a href="#">待办</a> <a href="#">待办</a> <a
			href="#">待办</a></nav> </header>
		<article>
		<div class="banner">
			<ul class="texts">
				<p>I like you.</p>
				<p>我需要傍近你，方不至于难过。</p>
			</ul>
		</div>
		<br>
		<div class="bloglist">
			<h2>
				<p>
					<span>细</span>语
				</p>
			</h2>
			<c:forEach var="article" items="${article_Pagelist}">
				<div class="blogs">
					<h3>
						<a class="stroke" href="/Blog/ArticleServlet?id=${article.id}">${article.title}</a>
					</h3>
					<figure> <img id="1" /></figure>
					<ul>
						<p>${article.content}</p>
						<a href="/Blog/ArticleServlet?id=${article.id}" target="_blank"
							class="readmore">阅读全文&gt;&gt;</a>
					</ul>
					<p class="autor">
						<span>作者：${article.author}</span><span>分类：【<a
							href="/Blog/SortServlet?get=${article.sort}">${article.sort}</a>】
						</span><span>浏览（<a href="/">${article.visit}</a>）
						</span><span>评论（<a href="/">30</a>）
						</span>
					</p>
					<div class="dateview">${article.time}</div>
				</div>
			</c:forEach>
		</div>

		<nav> <a href="<c:url value="/PageServlet?page=1"/>">首页</a> <a
			href="<c:url value="/PageServlet?page=${page-1>1?page-1:1}"/>"
			class="button button-raised button-caution">&laquo;</a> <c:forEach
			begin="1" end="${totalPages}" varStatus="loop">
			<c:set var="active" value="${loop.index==page?'active':''}" />
			<a class="button button-raised button-action ${active} "
				href="<c:url value="/PageServlet?page=${loop.index}"/>">${loop.index}</a>

		</c:forEach> <a
			href="<c:url value="/PageServlet?page=${page+1<totalPages?page+1:totalPages}"/>"
			class="button button-raised button-caution">&raquo;</a> <a
			href="<c:url value="/PageServlet?page=${totalPages}"/>"
			class="button button-raised button-primary">尾页</a> </nav> <!-- admin here -->


		<!--  --> </article>

		<aside>
		<div class="avatar">
			<a href="about.html"><span>关于N</span></a>
		</div>
		<div class="topspaceinfo">
			<h1>春心不死、秋节长生</h1>
			<p>半风半霜伴雨雪，懂事懂人懂舍得。</p>
			<br>
			<c:if test="${sessionScope.power==1}">
				<a href="/Blog/AddServlet"> <span
					class="glyphicon glyphicon-plus">写新文章&nbsp;&nbsp;</span>
				</a>
				<a href="/Blog/AdminServlet"> <span
					class="glyphicon glyphicon glyphicon-user">&nbsp;&nbsp;管理更多&nbsp;&nbsp;</span>
				</a>
			</c:if>
		</div>
		<div class="about_c">
			<p>网名：Nico | BlcakMode</p>
			<p>职业：Web后端开发、java开发</p>
			<p>github：https://github.com/BlackmodeN</p>
			<p>个人主页：https://mykaleidoscope.xin</p>
			<p>邮箱：739388464@qq.com</p>
		</div>
		<div class="tj_news">
			<h2>
				<p class="tj_t1">阅读排行</p>
			</h2>
			<ul>
				<c:forEach var="a" items="${visit_rank}">
					<li><a href="/Blog/ArticleServlet?id=${a.id}"
						class="button button-3d button-royal button-rounded button-block">${a.title}&nbsp;&nbsp;
							<span class="c_right">(${a.visit})</span>
					</a></li>
				</c:forEach>
				<!-- 初始化结束 -->

			</ul>
			<h2>
				<p class="tj_t2">分类</p>
			</h2>
			<ul>
				<li><a href="/Blog/SortServlet?get=all">全部</a></li>
				<c:forEach var="entity" items="${sort_count_map}">
					<li><a href="/Blog/SortServlet?get=${entity.key}"
						class="button button-3d button-royal button-rounded button-block">${entity.key}&nbsp;&nbsp;&nbsp;&nbsp;
							(${entity.value})</a></li>
				</c:forEach>
			</ul>
		</div>

		<div class="links">
			<h2>
				<p>友情链接</p>
			</h2>
			<ul>
				<li><a href="https://mykaleidoscope.xin/iCloud">Nico的云盘</a></li>
				<li><a href="https://github.com/BlackmodeN">Nico的github</a></li>
			</ul>
		</div>
		<div class="copyright">
			<ul>
				<p>
					Design by Nico <a href="/">Nico</a>
				</p>
				<p>© 2018 备案号:皖ICP备18003221号</p>
				</p>
			</ul>
		</div>
		</aside>
		<script src="js/silder.js"></script>
		<div class="clear"></div>
		<!-- 清除浮动 -->
	</div>
	<script>
		function getImageNum(numArray) {
			var index = Math.floor(Math.random() * numArray.length);
				return numArray[index];
		}
		var imgNum = ['1.jpg','10.jpg','100.jpg','101.jpg','102.jpg','103.jpg','104.jpg','105.jpg','106.jpg','107.jpg','108.jpg','109.jpg','110.jpg','111.jpg','112.jpg','113.jpg','114.jpg','115.jpg','116.jpg','117.jpg','118.jpg','119.jpg','12.jpg','120.jpg','121.jpg','122.jpg','123.jpg','124.jpg','125.jpg','126.jpg','127.jpg','128.jpg','129.jpg','13.jpg','130.jpg','131.jpg','132.jpg','133.jpg','134.jpg','135.jpg','136.jpg','137.jpg','138.jpg','139.jpg','14.jpg','140.jpg','141.jpg','142.jpg','143.jpg','144.jpg','145.jpg','147.jpg','148.jpg','149.jpg','15.jpg','150.jpg','151.jpg','152.jpg','153.jpg','154.jpg','155.jpg','156.jpg','157.jpg','158.jpg','159.jpg','16.jpg','17.jpg','18.jpg','19.jpg','2.jpg','20.jpg','21.jpg','22.jpg','23.jpg','24.jpg','25.jpg','26.jpg','27.jpg','28.jpg','29.jpg','3.jpg','30.jpg','32.jpg','33.jpg','34.jpg','35.jpg','36.jpg','37.jpg','38.jpg','39.jpg','4.jpg','40.jpg','41.jpg','42.jpg','43.jpg','44.jpg','45.jpg','46.jpg','47.jpg','5.jpg','50.jpg','51.jpg','52.jpg','53.jpg','54.jpg','55.jpg','56.jpg','57.jpg','58.jpg','6.jpg','63.jpg','65.jpg','67.jpg','68.jpg','69.jpg','7.jpg','70.jpg','75.jpg','76.jpg','78.jpg','79.jpg','8.jpg','80.jpg','81.jpg','82.jpg','83.jpg','84.jpg','85.jpg','86.jpg','87.jpg','88.jpg','89.jpg','9.jpg','91.jpg','92.jpg','93.jpg','95.jpg','96.jpg','97.jpg','98.jpg','99.jpg' ];
		var imgEle = document.getElementsByTagName('img'); //获取需要改变的img标签
		for (var i = 0; i < imgEle.length; i++) {
			var el = imgEle[i];
			var a = getImageNum(imgNum);
			el.setAttribute('src', 'head/' + a);
		}
	</script>
</body>
</html>

