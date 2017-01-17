<%@page import="com.blog.facade.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/user-login.css" />
		<link rel="shortcut icon" href="img/favicon.ico" />
	</head>

	<body>
		<h1>
			LifeSharing用户登录
		</h1>
		<div class="login" style="margin-top: 50px;">
			<div class="header">
				<div class="switch" id="switch">
					<a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7"><strong>快速登录</strong></a>
					<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
				</div>
			</div>
			<!--登录开始-->
			<div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">
				<div class="web_login" id="web_login">
					<div class="login-box">
						<div class="login_form">
							<form action="${pageContext.request.contextPath}/doLogin.action" method="post" id="loginform">
								<!--视频名称 -->
								<br />
								<!--登录返回信息-->
								<center>
								<span class="server-result">
									${requestScope.loginMsg}
								</span>
								</center>
								<div class="input-group">
									<div class="input-group-addon">账号</div>
									<input type="email" class="form-control inputstyle" id="user_login_email" name="userEmail" placeholder="请输入注册邮箱" maxlength="20"
											value="<%=request.getAttribute("userEmail") == null ? "" : request.getAttribute("userEmail")%>"/>
									</div>
								<!--视频链接 -->
								<br />
								<div class="input-group">
									<div class="input-group-addon userpwd">密码</div>
									<input type="password" class="form-control inputstyle" name="userPwd" id="user_login_pwd" placeholder="请输入密码" maxlength="20" />
								</div><br/><br/>
								<center>
									<input type="submit" id="submitbtn" class="btn btn-primary btn-lg submit-login" value="提 交" />
								</center>
							</form>
						</div>
					</div>
				</div>
				<a href="${pageContext.request.contextPath}/register.html"><span class="lg_return_index">没有账号？请注册</span></a>
			</div>
			<!--登录结束-->

		</div>
		<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
		<script src="js/jquery-1.12.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/login.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/verify.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>