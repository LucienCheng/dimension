<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>登录</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<!-- Bootstrap -->
<link href="/dimension/source/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="/dimension/source/js/jquery-3.2.1.js"></script>
<script src="/dimension/source/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body id="login">
	<div class="container">
		<form class="form-signin" action="/achievement/back/login"
			method="post">
			<h2 class="form-signin-heading">登录</h2>
			<input type="text" class="input-block-level" placeholder="工号"
				name="userWorkNum"> <input type="password"
				class="input-block-level" placeholder="密码" name="userPassword">
			<label class="checkbox"> <input type="checkbox"
				value="remember-me"> 记住密码
			</label>
			<button class="btn btn-large btn-primary" type="submit">登录</button>
		</form>

	</div>
	<!-- /container -->

</body>
</html>
