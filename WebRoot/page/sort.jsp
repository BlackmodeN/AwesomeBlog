
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
<meta name="keywords" content="个人博客模板,博客模板,响应式" />
<meta name="description" content="如影随形主题的个人博客模板，神秘、俏皮。" />
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
		<h2>你看，世人多奇怪。喜欢的人得不到，得到了不珍惜，在一起时怀疑，失去了怀念，怀念的想相见，相见的又恨晚。终其一生，满是遗憾。</h2>
		<div class="logo">
			<a href="/"></a>
		</div>
		<nav id="topnav">
		<a href="index.jsp">首页</a>
		<a href="about.html">关于我</a>
		<a href="newlist.html">慢生活</a>
		<a href="share.html">模板分享</a>
		<a href="new.html">模板主题</a></nav> </header>
		<article>
		<div class="banner">
			<ul class="texts">
				<p>The best life is use of willing attitude, a happy-go-lucky
					life.</p>
				<p>最好的生活是用心甘情愿的态度，过随遇而安的生活。</p>
			</ul>
		</div>
		<div class="bloglist">
			<h2>
				<p>
					<span>分</span>类
				</p>
			</h2>
			<c:forEach var="map" items="${sort_article_map}">

				<div class="sort_name">
					<!-- 分类名字 -->
					<p style="font-size:18px">&nbsp;&nbsp; 类别:&nbsp;
					&nbsp;${map.key}</p>
				</div>
				<div>
					<!-- 分类信息 -->
					<ul class="list-group">

						<c:forEach var="list" items="${map.value}">
							<div class="blogs">
								<p class="autor">
									<span>主题：<a href="/Blog/ArticleServlet?id=${list.id}">${list.title}</a></span>
									<span>浏览次数:${list.visit}</span>
								</p>
								<div class="dateview">${list.time}</div>
							</div>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
		</div>
		</article>

		<aside>
		<div class="avatar">
			<a href="about.html"><span>关于杨青</span></a>
		</div>
		<div class="topspaceinfo">
			<h1>执子之手，与子偕老</h1>
			<p>于千万人之中，我遇见了我所遇见的人....</p>
		</div>
		<div class="about_c">
			<p>网名：DanceSmile | 即步非烟</p>
			<p>职业：Web前端设计师、网页设计</p>
			<p>籍贯：四川省―成都市</p>
			<p>电话：13662012345</p>
			<p>邮箱：dancesmiling@qq.com</p>
		</div>
		<div class="bdsharebuttonbox">
			<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a
				href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a
				href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a
				href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a
				href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a
				href="#" class="bds_more" data-cmd="more"></a>
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
				<li><a href="/">杨青个人博客</a></li>
				<li><a href="/">3DST技术社区</a></li>
			</ul>
		</div>
		<div class="copyright">
			<ul>
				<p>
					Design by <a href="/">DanceSmile</a>
				</p>
				<p>蜀ICP备11002373号-1</p>
				</p>
			</ul>
		</div>
		</aside>
		<script src="js/silder.js"></script>
		<div class="clear"></div>
		<!-- 清除浮动 -->
	</div>
</body>
</html>

