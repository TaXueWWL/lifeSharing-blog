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
		<link rel="stylesheet" type="text/css" href="css/user-register.css" />
		<link rel="shortcut icon" href="img/favicon.ico" />
	</head>

	<body>
		<style type="text/css">
			.input-group-addon {
			    background-color: #eee;
			    font-size: large;
			}
			
			select {
				width: 80px;
				height: 35px;
				box-shadow: #959CA8;
				font-size: 17px;
			}

			select option {
				width: 70px;
				height: 35px;
				box-shadow: #959CA8;
				font-size: 17px;
			}

			.web_login .input-tips2 {
				float: left;
				text-align: right;
				padding-right: 10px;
				width: 75px;
				height: 30px;
				font-size: 13px;
				margin-top: 10px;
				clear: both;
				line-height: 30px;
				font-family: "Hiragino Sans GB", "Microsoft Yahei";
			}

			.web_login.userRegister {
				width: 370px;
				position: relative;
				margin-left: 37px;
				margin-top: 5px;
			}
		</style>
		</head>

		<body>
			<h1>
				LifeSharing用户注册
			</h1>
			<div class="login" style="margin-top: 50px;">
				<div class="header">
					<div class="switch" id="switch">
						<a class="switch_btn_focus" id="switch_login" href="javascript:void(0);" tabindex="1"><strong>快速注册</strong></a>
					</div>
				</div>
				
				<!--注册-->
				<div class="qlogin" id="qlogin" style="display: block;">
					<!--注册返回信息-->
					<center>
						<span class="regis-result">${requestScope.registerMsg }</span>
					</center>
					<div class="web_login userRegister">
						<form action="doRegister.action" method="post">
							<!--用户昵称 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">用户昵称</div>
								<input type="text" class="form-control inputstyle" id="user_regis_id" name="userName" placeholder="请输入用户昵称" maxlength="20"/>
							</div>
							<!--用户密码 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">登录密码</div>
								<input type="password" class="form-control inputstyle" name="userPwd" id="user_regis_pwd" placeholder="请输入密码" maxlength="20"/>
							</div>
							<!--确认密码 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">确认密码</div>
								<input type="password" class="form-control inputstyle" name="reuserpwd" id="reuser_regis_pwd" placeholder="请再次输入密码" maxlength="20"/>
							</div>
							<!--登录邮箱 -->
							<br />
							<div class="input-group">
								<div class="input-group-addon">登录邮箱</div>
								<input type="email" class="form-control inputstyle" name="userEmail" id="user_regis_email" placeholder="请输入登录邮箱" maxlength="20"/>
							</div>
							<!--手机号-->
							<br />
							<div class="input-group">
								<div class="input-group-addon">&nbsp;&nbsp;手机号&nbsp;</div>
								<input type="text" class="form-control inputstyle" name="userMobile" id="user_regis_mobile" placeholder="请输入您的手机号" maxlength="11"/>
							</div>
							<!--性别-->
							<br />
							<div class="input-group">
								<div class="input-group-addon">&nbsp;&nbsp;性别&nbsp;&nbsp;&nbsp;&nbsp;</div>
								<select name="userGender" class="form-control" style="width: 200px">
									<option value="1">男</option>
									<option value="0">女</option>
								</select>
							</div>
							
							<br/><br/>
							<div class="btn-set">
								<input type="submit" id="submitbtn" class="btn btn-primary btn-lg submit" value="提 交"/>
								<input type="reset" class="btn btn-warning btn-lg reset" value="重 置" />
							</div>
						</form>
					</div>
					<a href="${pageContext.request.contextPath}/login.html"><span class="rg_return_index">返回登录</span></a>
				</div>
				<!--注册end-->
			</div>
			<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
			<script src="js/jquery-1.12.3.min.js" type="text/javascript" charset="utf-8"></script>
			<script src="js/login.js" type="text/javascript" charset="utf-8"></script>
			<script src="js/verify.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>
