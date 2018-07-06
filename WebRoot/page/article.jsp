<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${article.title}</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="./css/buttons.css" />

<!-- 引入本页面的特殊样式 -->
<link type="text/css" rel="stylesheet" href="./css/article.css" />
<link type="text/css" rel="stylesheet" href="./css/comment.css" />
<link type="text/css" rel="stylesheet" href="./css/editormd.min.css" />

<script src="./js/article.js"></script>




</head>
<body
	style=" background-color:#d1c7b7;
	background-image: url(../Blog/images/bg1.png), url(../Blog/images/back3.png);
	background-position: left top ,right bottom;
	background-repeat: no-repeat,no-repeat; " >

	<div class="head_line">
	</div>
	<div class="container" id="main">

		<div class="head">
			
				<h1>
					<a href="/Blog/index.jsp">首页</a>
				</h1>

		</div>

		<div id="article">

			<div id="a_head ">
				<h2 style="color:#f58220">${article.title}</h3>
					<br />
					<div style="color:#ef5b9c">
						<h3>
							<span>时间:&nbsp;${article.time}&nbsp;标签:</span> <a
								href="/Blog/SortServlet?get=${article.sort}">${article.sort}</a>
							By&nbsp;${article.author}
						</h3>
					</div>
					<br>
					<div class="r_div" style="color:#f69c9f">
						<h3>
							<span class="glyphicon glyphicon-eye-open">&nbsp;${article.visit}&nbsp;</span>
							<span class="glyphicon glyphicon-heart" id="love">&nbsp;${article.star}&nbsp;</span>
							<span class="glyphicon glyphicon-comment">&nbsp;${article.comment}&nbsp;
							</span>
						</h3>
					</div>
					<div id="tag">
						<c:forEach var="t" items="${article_tags}">
							<a href="/Blog/TagsServlet?get=${t.tag}">${t.tag}&nbsp;</a>
						</c:forEach>
					</div>
			</div>
		</div>
	



		<div id="a_content">
			<!-- 引入 show.jsp 显示文章内容 ${article.content}-->
			<jsp:include page="/page/show.jsp" />
		</div>


		<div>
			<div class="f_div">
				<span class="glyphicon glyphicon-chevron-left"></span>


				<c:choose>
					<c:when test="${article_pre!=null}">
						<a
							class="button button-glow button-rounded  button-small"
							href="/Blog/ArticleServlet?id=${article_pre.id}">&nbsp;上一篇:${article_pre.title}</a>
					</c:when>
					<c:otherwise>
							&nbsp;没有更早的文章了
						</c:otherwise>
				</c:choose>

			</div>
			<div class="r_div">

				<c:choose>
					<c:when test="${article_next!=null}">
						<a
							class="button button-glow button-rounded  button-small"
							href="/Blog/ArticleServlet?id=${article_next.id}">下一篇:&nbsp;${article_next.title}</a>
					</c:when>
					<c:otherwise>
							&nbsp;没有更多的文章了
						</c:otherwise>
				</c:choose>

				<span class="glyphicon glyphicon-chevron-right"></span>
			</div>

			<div>

				<button id="love"
					class="buttonl button-3d button-box button-jumbo"
					onclick="love_article(this,${article.id})">
					<i class="fa fa-thumbs-up">(${article.star})</i>
				</button>
			</div>
			<br />
		</div>

	

		<!-- 评论 -->
		<div class="comment">

			<div class="r_div">
				<a href="#comment"
					class="button button-glow button-rounded button button-small"><h4>
						<span class="glyphicon glyphicon-pencil"></span>&nbsp;写评论....
					</h4></a>
			</div>

			<!-- 加载文章评论 -->
			<c:if test="${comment!=null}">
				<c:forEach var="comm" varStatus="status" items="${comment}">

					<div class="row">
						<div class="f_div">
							<img src="/Blog/img/comment.jpg" height="50" width="50"
								class="img-circle" /> &nbsp;&nbsp; <span style="color: #c1a173">${comm.nickname}</span>
							<span style="color: #c1a173">&nbsp;&nbsp;${comm.time}</span>
						</div>
						<div id="c_content" class="c_left">
							<h3>


								<div style="color:#896a45">${comm.content }</div>


							</h3>
						</div>
						<div class="r_div">
							<a><span class="glyphicon glyphicon-thumbs-up"
								onclick="star(this,${comm.id})">${comm.star}</span></a> &nbsp; <a><span
								class="glyphicon glyphicon-thumbs-down"
								onclick="diss(this,${comm.id})">${comm.diss}</span></a> &nbsp;
							<!-- admin here -->
							<c:if test="${sessionScope.user!=null}">
								<span class="btn btn-default" style="color:red;"
									onclick="deletecm(this,${comm.id})">删除</span>
			&nbsp;		
			</c:if>
						</div>
						<HR style="border:1 dashed #987cb9" width="80%" color=#987cb9
							SIZE=1>
					</div>

				</c:forEach>

			</c:if>
		</div>
		<!-- 这里可以扩展子评论 -->


		<!-- 写评论 -->
		<div id="comment">

			<form action="/Blog/NewCommentServlet?id=${article.id}" method="post">
				<div class="input-group input-group-lg">
					<span class="input-group-addon">IP地址:</span> <input
						style="width:30%" class="form-control" type="text"
						name="w_nickname" disabled="disabled"
						value="<%=request.getRemoteAddr()%>">
				</div>
				<br /> <br />

				<textarea class="form-control"
					style="resize:none; width:100%; height:180px;" name="w_content"></textarea>
				<br /> <br /> <input
					class="button button-glow button-rounded button-royal"
					type="submit" value="评论" onclick="onclick" /> <br />
			</form>
		



		</div>
		<div id="footer">
			<a href="/Blog/index.jsp">MyBlog首页&nbsp;&nbsp;</a>| <a href="#">&nbsp;&nbsp;返回顶部</a>
		</div>
		<!-- footer -->
</body>
</html>