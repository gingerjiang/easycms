<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<title>管理后台登录页面</title>
<link rel="stylesheet" href="${ctx}/static/login/login.css">
</head>
<body onload="document.getElementsByTagName('input')[0].focus();">
	<div class="login_body">
		<div class="login_form clearfix">
			<form action="login" method="post">
				<p>
					<input type="text" name="username" placeholder="帐号" title="账号" value=""/>
				</p>
				<p>
					<input type="password" name="password" placeholder="密码" title="密码" value=""/>
				</p>
				<p>
					<input type="submit" value="登  录" />
				</p>
			</form>
		</div>
		<p class="login_msg">
			${msg }
		</p>
	</div>
</body>
</html>