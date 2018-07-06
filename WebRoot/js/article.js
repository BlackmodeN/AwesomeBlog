
/* 
* 获取ajax处理对象		
 * @returns {xmlhttp}
 */
function getXHR(){	
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;	
}
/**
 * 点赞这个ariticle
 * @param article_id
 */
function love_article(component,article_id){
	var url = "/Blog/AriStarServlet?id="+article_id ;		
	// 获取ajax
	var xmlhttp = getXHR();	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// 处理服务器收到的请求响应
			var res = xmlhttp.responseText;			
			// 解析json对象
			var res = eval('(' + res + ')');			
			if (res.msg == "success") {
				//返回 ”success“
				component.innerHTML= "♥"+res.new_star;				
			}else{
				alert("你已经赞赏过啦!Σ(ﾟдﾟ；)");
			}
		}
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.send();		
}


/*
 *删除评论
 */
function deletecm(component,comm_id){
	var container = component.parentNode.parentNode;
	//alert(container);
	var url = "/Blog/CMDeleServlet?id="+comm_id ;		
	// 获取ajax
	var xmlhttp = getXHR();	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// 处理服务器收到的请求响应
			var res = xmlhttp.responseText;			
			// 解析json对象
			var res = eval('(' + res + ')');			
			//alert( res.msg );
			if(res.msg == "success"){
				//删除评论的视图
				var p = container.parentNode;
				p.removeChild(container);
			}			
		}	
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.send();	
}

/**
 * 点击了star
 */
function star(component , comm_id) {
	
	var url = "/Blog/CMStarServlet?id="+comm_id ;		
	// 获取ajax
	var xmlhttp = getXHR();	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// 处理服务器收到的请求响应
			var res = xmlhttp.responseText;			
			// 解析json对象
			var res = eval('(' + res + ')');			
			if (res.msg == "success") {
				//返回 ”success“
				component.innerHTML = res.new_star;				
			}else{
				alert("你已经赞过啦!Σ(ﾟдﾟ；)");
			}
		}
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.send();	
}

/**
 * 点击了diss
 */
function diss(component , comm_id) {
	
	var url = "/Blog/CMDissServlet?id="+comm_id ;		
	// 获取ajax
	var xmlhttp = getXHR();	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// 处理服务器收到的请求响应
			var res = xmlhttp.responseText;			
			// 解析json对象
			var res = eval('(' + res + ')');			
			if (res.msg == "success") {
				//返回 ”success“
				component.innerHTML = res.new_diss;				
			}else{
				alert("你已经踩过啦!Σ(ﾟдﾟ；)");
			}
		}
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.send();	
}
