<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页 | MyBlog</title>

<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->


<%@include file="_head.jsp"%>
<style>


* {
	padding: 0;
	margin: 0;
}

.stroke {
	color: transparent;
	-webkit-text-stroke: 1px black;
	letter-spacing: 0.04em;
	background-color:
}
</style>

<script>
	$('button').click(function() {
		$('button').toggleClass('active');
		$('.title').toggleClass('active');
		$('nav').toggleClass('active');
	});
</script>


</head>
<body>
	<canvas id="c"></canvas>
	<script src="./js/anime.js"></script>


	<div class="head_line"></div>

	<div class="container" id="main">

		<div id="header"></div>

		<div class="row c_center" style="margin-left:auto;margin-right:auto">
			<div class="col-md-4" id="left_content">

				<div id="title">
					<a href="/Blog/index.jsp"><img src="/Blog/img/Blog.png"
						alt="丢失了?"></a>
					<h4 class="text-muted">See what you see.Love what you love.</h4>
					
				</div>

				<div class="c_center" id="person_info"
					style=" margin-top: auto; margin-bottom: auto;"">

					<div class="contact-area">
						<div class="contact">
							<main> <section>
							<div class="content">
								<img src="./img/header.jpg" alt="Profile Image">

								<aside>
								<h1>N-i</h1>
								<h4>Don't be sorry, be better</h4>
								</aside>

								<button class="button button-3d button-primary">
									Contact Me

									<svg width="48" height="48" viewBox="0 0 48 48"> <g
										class="nc-icon-wrapper" fill="#444444"> <path
										d="M14.83 30.83L24 21.66l9.17 9.17L36 28 24 16 12 28z"></path>
									</g> </svg>
								</button>
							</div>

							<div class="title">
								<p>Contact Me</p>
							</div>
							</section> </main>

							<nav> <a href="#" class="gmail">
								<div class="icon">
									<svg viewBox="0 0 16 16"> <path
										d="M16 3v10c0 .567-.433 1-1 1h-1V4.925L8 9.233 2 4.925V14H1c-.567 0-1-.433-1-1V3c0-.283.108-.533.287-.712C.467 2.107.718 2 1 2h.333L8 6.833 14.667 2H15c.283 0 .533.108.713.288.179.179.287.429.287.712z"
										fill-rule="evenodd" /></svg>
								</div>

								<div class="content">
									<h1>Email</h1>
									<span>739388464@qq.com</span>
								</div> <svg class="arrow" width="48" height="48" viewBox="0 0 48 48">
								<g class="nc-icon-wrapper" fill="#444444"> <path
									d="M17.17 32.92l9.17-9.17-9.17-9.17L20 11.75l12 12-12 12z"></path>
								</g> </svg>
							</a> <a href="#" class="facebook">
								<div class="icon">
									<svg viewBox="0 0 16 16" fill-rule="evenodd"
										clip-rule="evenodd" stroke-linejoin="round"
										stroke-miterlimit="1.414"> <path
										d="M15.117 0H.883C.395 0 0 .395 0 .883v14.234c0 .488.395.883.883.883h7.663V9.804H6.46V7.39h2.086V5.607c0-2.066 1.262-3.19 3.106-3.19.883 0 1.642.064 1.863.094v2.16h-1.28c-1 0-1.195.48-1.195 1.18v1.54h2.39l-.31 2.42h-2.08V16h4.077c.488 0 .883-.395.883-.883V.883C16 .395 15.605 0 15.117 0"
										fill-rule="nonzero" /></svg>
								</div>

								<div class="content">
									<h1>Github</h1>
									<span>github.com/BlackmodeN</span>
								</div> <svg class="arrow" width="48" height="48" viewBox="0 0 48 48">
								<g class="nc-icon-wrapper" fill="#444444"> <path
									d="M17.17 32.92l9.17-9.17-9.17-9.17L20 11.75l12 12-12 12z"></path>
								</g> </svg>
						</div>
					</div>

					<script>
						$('button').click(function() {
							$('button').toggleClass('active');
							$('.title').toggleClass('active');
							$('nav').toggleClass('active');
						});
					</script>


				</div>

				<div class="row">
					<!-- 这里初始化侧边栏的4个标签 -->

					<a
						class="button button-glow button-rounded button-highlight button-small"
						href="/Blog/SortServlet?get=all">(${article_number})日志</a> <a
						class="button button-glow button-rounded button-royal button-small"
						href="/Blog/SortServlet?get=all"><span>(${sort_number})
					</span>分类</a> <a
						class="button button-glow button-rounded button-caution  button-small"
						href="/Blog/TagsServlet?get=all"><span>(${tags_number})</span>标签</a>


				</div>


				<div id="list">
					<div class="container1">
						<div class="box box1">
							<div class="name" onclick="location.href='/Blog/login.html'">

								<h4>使用账号登录</h4>
								<h5>点击登录★</h5>

							</div>
							<p>★</p>
						</div>
						<div class="box box2" onclick="location.href='/Blog/index.jsp'">
							<div class="name">
								<h4>首页</h4>
								<h5>点击跳转到主页♠</h5>

							</div>
							<p>♠</p>
						</div>
						<div class="box box3"
							onclick="location.href='/Blog/SortServlet?get=all'">
							<div class="name">

								<h4>分类</h4>
								<h5>点击查看分类✙</h5>

							</div>
							<p>✙</p>
						</div>
						<div class="box box4" onclick="location.href='/Blog/AxisServlet'">
							<div class="name">

								<h4>时间轴</h4>

								<h5>点击查看时间轴€</h5>

							</div>
							<p>€</p>
						</div>

					</div>
				</div>
				<!-- list -->
				<br />

				<div class="sort">
					<div class="list-group">
						<a
							class="button button-3d button-primary button-rounded button-block"
							href="/Blog/SortServlet?get=all"><span
							class="glyphicon glyphicon-indent-left" aria-hidden="true"></span>&nbsp;&nbsp;分类</a>
						<!-- 这里初始化分类 -->
						<c:forEach var="entity" items="${sort_count_map}">
							<a href="/Blog/SortServlet?get=${entity.key}"
								class="button button-3d button-royal button-rounded button-block">${entity.key}&nbsp;&nbsp;&nbsp;&nbsp;
								(${entity.value})</a>
						</c:forEach>
						<!-- 初始化结束 -->
					</div>
				</div>
				<!-- sort -->


				<div class="visit">
					<div class="list-group">
						<a
							class="button button-3d button-primary button-rounded button-block"
							href="#"><span class="glyphicon glyphicon-tasks"
							aria-hidden="true"></span>&nbsp;&nbsp;阅读排行</span> <!-- 这里初始化阅读排行 --> <c:forEach
								var="a" items="${visit_rank}">
								<a href="/Blog/ArticleServlet?id=${a.id}"
									class="button button-3d button-royal button-rounded button-block">${a.title}&nbsp;&nbsp;
									<span class="c_right">(${a.visit})</span>
								</a>
							</c:forEach> <!-- 初始化结束 -->
					</div>
				</div>
				<!-- visit-->





				<div id="tag">
					<div class="list-group">
						<a class="button button-block button-rounded button-large"
							href="/Blog/TagsServlet?get=all"><span
							class="glyphicon glyphicon-leaf" aria-hidden="true"></span>&nbsp;&nbsp;标签</a>
						<br />

						<!-- 这里初始化标签 -->
						<c:forEach var="t" varStatus="status" items="${tag_list}">
							<c:choose>
								<c:when test="${status.count%2==1}">
									<span class="label label-info"><a
										href="/Blog/TagsServlet?get=${t.tag}">
											&nbsp;${t.tag}&nbsp;</a></span>
								</c:when>
								<c:otherwise>
									<span class="label label-success"><a
										href="/Blog/TagsServlet?get=${t.tag}">
											&nbsp;${t.tag}&nbsp;</a></span>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<!-- 初始化标签完成 -->
					</div>
				</div>
				<!-- tag -->


				<!-- admin here -->
				<c:if test="${sessionScope.power==1}">
					<a href="/Blog/AddServlet"> <span
						class="glyphicon glyphicon-plus">&nbsp;&nbsp;写新文章&nbsp;&nbsp;</span>
					</a>
					<a href="/Blog/AdminServlet"> <span
						class="glyphicon glyphicon glyphicon-user">&nbsp;&nbsp;管理更多&nbsp;&nbsp;</span>
					</a>
				</c:if>
				<!--  -->

			</div>
			<div class="col-md-2" id="center_content"></div>


			<div class="col-md-7 " id="right_Content" style="margin-left: 74px">

				<br /> <br />
				<div class="list-group">
					<a href="#"
						class="button button-primary button-block button-rounded button-large"style ="background-color:rgb(195,230,203)"><font color="red">文		章		列		表</font></a>
					<!-- 这里初始化文章列表 -->
					<c:forEach var="article" items="${article_Pagelist}">
						<div class="list-group-item list-group-item-info"style ="background-color:rgb(190,229,235)">
							<h4>
								<h2>
									<a class="stroke" href="/Blog/ArticleServlet?id=${article.id}">${article.title}
									</a>
								</h2>
							</h4>
							<br /> <span
								class="button button-small  button-round button-primary">${article.time}</span>
							<a class="button button-small  button-round button-primary"
								" href="/Blog/SortServlet?get=${article.sort}">${article.sort}</a>
							<span class="button button-small button-round button-primary"">阅读次数:
								${article.visit}</span> <br /> <br /> <div>${article.content}</div>
							<br /> <br /> <br /> <a
								href="/Blog/ArticleServlet?id=${article.id}">阅读全文</a> <br />
						</div>
					</c:forEach>
					<!-- 初始化文章列表完成 -->
				</div>
			</div>
		</div>
		<div class="text-center">
		<nav>
				<ul class="pagination">
					<li><a href="<c:url value="/PageServlet?page=1"/>"  class="button button-raised button-royal">首页</a></li>
					<li><a
						href="<c:url value="/PageServlet?page=${page-1>1?page-1:1}"/>" class="button button-raised button-caution">&laquo;</a></li>

					<c:forEach begin="1" end="${totalPages}" varStatus="loop">
						<c:set var="active" value="${loop.index==page?'active':''}" />
						<li class="${active}"><a  class="button button-raised button-action ${active} "
							href="<c:url value="/PageServlet?page=${loop.index}"/>">${loop.index}</a>
						</li>
					</c:forEach>
					<li><a
						href="<c:url value="/PageServlet?page=${page+1<totalPages?page+1:totalPages}"/>" class="button button-raised button-caution">&raquo;</a>
					</li>
					<li><a href="<c:url value="/PageServlet?page=${totalPages}"/>"  class="button button-raised button-primary">尾页</a></li>
				</ul>
				</nav>
				</div>
		<div class="foot_line">

		
	</div>
	<!-- container -->
	<div id="footer">
		<div>
			<a href="https://github.com/BlackmodeN"><img
				src="/Blog/img/github.png" width="20px" height="20px"
				class="img-circle">&nbsp;&nbsp;GitHub</a> &nbsp;| <a href="#">&nbsp;&nbsp;MyBlog</a>
			<br /> &copy; 2018 备案号:<a href="http://www.miitbeian.gov.cn">皖ICP备18003221号</a>
		</div>

		<div class="r_div">
			<a href="#top"><input class="btn btn-default" value="返回顶部"
				style="width:50%;" /></a>
			<h6>被访问了 ${visited } 次</h6>
			<h6>你是第 ${member}个访问者</h6>
		</div>

	</div>
	<!-- footer -->
</body>
</html>