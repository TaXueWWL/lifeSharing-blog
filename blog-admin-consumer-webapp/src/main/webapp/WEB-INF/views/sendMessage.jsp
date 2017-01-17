<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 包含密码修改页面 -->
<jsp:include page="/common-pages/modifyPassword.jsp" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>LifeSharing轻博客后台管理系统</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">

<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

<script src="lib/jquery-1.7.2.min.js" type="text/javascript"></script>

<!-- Demo page code -->

<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
.input-area {
	margin-left: 50px;
	width:300px;
}
</style>

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="images/favicon.ico" />
</head>

<body class="">
		<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">

				<li><a href="#"
					class="hidden-phone visible-tablet visible-desktop" role="button">欢迎您 ${sessionScope.user.adminName}</a>
				</li>
				<li id="fat-menu" class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="icon-user"></i> <i class="icon-caret-down"></i>
				</a>

					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#self-info">个人信息</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" class="visible-phone" href="#">Settings</a>
						</li>
						<li class="divider visible-phone"></li>
						<li><a tabindex="-1"
							href="${pageContext.request.contextPath}/logout.action">注销登录</a></li>
					</ul></li>

			</ul>
			<a class="brand" href="index.html"><span class="first">LifeSharing</span>
				<span class="second">轻博客管理系统</span></a>
		</div>
	</div>

	<div class="sidebar-nav">
		<a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i
			class="icon-dashboard"></i>工作台</a>
		<ul id="dashboard-menu" class="nav nav-list collapse">
			<li><a href="index.html">主页</a></li>
		</ul>

		<a href="#man-management" class="nav-header" data-toggle="collapse"><i
			class="icon-circle-arrow-left"></i>用户管理</a>
		<ul id="man-management" class="nav nav-list collapse ">
			<li><a href="manageUser.html?pageNo=1">用户列表</a></li>
		</ul>

		<a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i
			class="icon-briefcase"></i>工具箱<span class="label label-info">+2</span></a>
		<ul id="accounts-menu" class="nav nav-list collapse in">
			<li><a href="#" data-toggle="modal"
				data-target="#modify-password">重设密码</a></li>
			<li class="active"><a
				href="${pageContext.request.contextPath}/sendMessage.html">公告发布</a></li>
		</ul>

	</div>

	<div class="content">

		<div class="header">
			<div class="stats">
				<p class="stat">
					<span class="number">53</span>tickets
				</p>
				<p class="stat">
					<span class="number">27</span>tasks
				</p>
				<p class="stat">
					<span class="number">15</span>waiting
				</p>
			</div>

			<h1 class="page-title">工作台</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="index.html">主页</a> <span class="divider">/</span></li>
			<li class="active">工作台</li>
		</ul>
		<div class="copyrights">
			Collect from <a href="http://www.cssmoban.com/" title="网站模板">网站模板</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">

				<div class="row-fluid" id="self-info">
					<div align="center" class="student-info">
						<br>
						<form class="form-horizontal" action="sendMessage.action"
							method="post">
							<table border="1" width="600" height="300px" cellspacing="0"
								cellpadding="0" bgcolor="gainsboro">
								<!--
                                    	作者：snowalker
                                    	时间：2016-10-27
                                    	描述：此处value为角色id
                                    -->
								<tr>
									<td height="50px" colspan="2">
										<center>
											<font size="5">公告发布</font> <font color="red"><%=request.getAttribute("send-message-msg") != null ? request.getAttribute("send-message-msg") : ""%></font>
										</center>
									</td>
								</tr>
								<tr>
									<td width="100px" height="80px">
										<center>公告标题</center>
									</td>
									<td><input type="text" class="form-control input-area"
										name="message_title" placeholder="请输入公告标题" maxlength="20">
									</td>
								</tr>
								<tr>
									<td width="100px">
										<center>公告正文</center>
									</td>
									<td><textarea class="form-control input-area" name="message_content"
											placeholder="请输入公告正文" rows="6"></textarea></td>
								</tr>
								<tr>
									<td height="50px" colspan="2">
										<center>
											<input type="submit" value="提交" class="btn btn-primary" /> <input
												type="reset" value="重置" class="btn btn-warning" />
										</center>
									</td>
								</tr>
							</table>
						</form>
					</div>

					<footer>
						<hr>

						<p class="pull-right">
							Copy right &copy; <a href="http://www.cssmoban.com/" title="网页模板"
								target="_blank">2016</a>
						</p>

						<p>
							&copy; <a href="#" target="_blank">LifeSharing轻博客</a>
						</p>
					</footer>
				</div>
			</div>
		</div>

		<script src="lib/bootstrap/js/bootstrap.js"></script>
		<script type="text/javascript">
				$("[rel=tooltip]").tooltip();
				$(function() {
					$('.demo-cancel-click').click(function() {
						return false;
					});
				});
			</script>
</body>
<!-- 包含密码修改页面 -->
<jsp:include page="/common-pages/modifyPassword.jsp" />

</html>