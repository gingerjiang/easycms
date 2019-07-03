<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="easy" uri="/WEB-INF/tlds/custom.tld"%>
<!DOCTYPE html>
<html>
<head>
	<title>Java EasyCMS内容管理系统</title>
	<%@include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${ctxStatic}/css/index.css" type="text/css" rel="stylesheet" />
	<script>
		$(document).ready(function(){
			$(".vertical-nav").verticalnav({
				speed: 400,
				align: "left"
			});
			var width = window.innerWidth;
			var height = window.innerHeight;
			$(".vertical-nav li a").click(function() {
				
				open($(this).text() + "-" + $(this).attr('subjectId'), $(this).attr('href'), width * 0.8,  height * 0.9);
				return false;
			})
			
			open("文件管理", "${ctx}/elFinder/elfinder.legacy.html", width * 0.8,  height * 0.9);
		});
		function open(title,url, w, h) {
			layer.open({
		  	  type: 2, 
		  	  area: [w+'px', h+'px'],
		  	  title: title,
		  	  closeBtn: 1,
		  	  shade: 0,
		  	  moveOut: true,
		  	  maxmin: true,
		  	  offset: ['20px', '210px'],
		  	  //shade: [0.5 , '#000' , false],
		  	  //shadeClose: true,
		  	  content: url
		  	});
		}
	</script>
	
</head>
<div class="kePublic">
<!--效果html开始-->
<div class="content">
	<ul class="vertical-nav dark red">
		<li class="active">
			<a href="#">
			<i class="icon-home"></i>首页</a></li>
		</li>
		<li><a href="#"><i class="icon-cogs"></i>配置
		<span class="submenu-icon"></span></a>
		<ul>
			<li><a href="${ctx }/cms/configure" subjectId="">栏目配置</a></li>
			<li><a href="#">用户管理</a></li>
			<li><a href="${ctx }/elFinder/elfinder.legacy.html" subjectId="">文件管理</a></li>
		</ul>
		<easy:MenuTag />
	</ul>
</div>
<!--效果html结束-->
<div class="clear"></div>
</div>

</body>
</html>