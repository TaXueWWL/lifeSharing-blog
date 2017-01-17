<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 包含密码修改页面 -->
<jsp:include page="/common-pages/modifyPassword.jsp" />
<!-- 包含session检测的页面 -->
<jsp:include page="/common-pages/sessionCheck.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<ul id="dashboard-menu" class="nav nav-list collapse in">
			<li class="active"><a href="index.html">主页</a></li>
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
			<li><a
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

			<h1 class="page-title">Dashboard</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="adminindex.html">主页</a> <span class="divider">/</span></li>
			<li class="active">工作台</li>
		</ul>
		<div class="copyrights">
			Collect from <a href="http://www.cssmoban.com/" title="网站模板">网站模板</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">

				<div class="row-fluid">

					<div class="alert alert-info">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>快速提示:</strong> 在工作台由您经常使用的功能，巧妙的利用它们吧！
					</div>

					<div class="block">
						<a href="#page-stats" class="block-heading" data-toggle="collapse">最新统计</a>
						<div id="page-stats" class="block-body collapse in">

							<div class="stat-widget-container">
								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">2,500</p>
										<p class="detail">Accounts</p>
									</div>
								</div>

								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">3,299</p>
										<p class="detail">Subscribers</p>
									</div>
								</div>

								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">$1,500</p>
										<p class="detail">Pending</p>
									</div>
								</div>

								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">$12,675</p>
										<p class="detail">Completed</p>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="row-fluid">
					<div class="block span6">
						<a href="#tablewidget" class="block-heading"
							data-toggle="collapse">系统信息<span class="label label-info">+5</span></a>
						<div id="tablewidget" class="block-body collapse in">
							<table class="table table-striped table-hover">
								<tr>
									<td>操作系统</td>
									<td>Ubuntu14.04 LTS</td>
								</tr>
								<tr>
									<td>数据库信息</td>
									<td>MariaDB10</td>
								</tr>
								<tr>
									<td>服务器信息</td>
									<td>Tomcat 7.0及以上</td>
								</tr>
								<tr>
									<td>Java版本</td>
									<td>1.8.0_60</td>
								</tr>
								<tr>
									<td>版本信息</td>
									<td>V1.0</td>
								</tr>
							</table>
							<p>
								<a href="#">More...</a>
							</p>
						</div>
					</div>
					<div class="block span6">
						<a href="#widget1container" class="block-heading"
							data-toggle="collapse">系统公告<span class="label label-info">+4</span></a>
						<div id="widget1container" class="block-body collapse in">
							<table class="table table-striped table-hover">
								<tr>
									<td>[2016.9.22]Web Service测试工具小汇 - oscarxie - 博客园</td>
								</tr>
								<tr>
									<td>Web Service测试工具小汇 - oscarxie - 博客园</td>
								</tr>
								<tr>
									<td>Web Service测试工具小汇 - oscarxie - 博客园</td>
								</tr>
								<tr>
									<td>Web Service测试工具小汇 - oscarxie - 博客园</td>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<div class="row-fluid" id="self-info">
					<div class="block span6">
						<div class="block-heading">
							<span class="block-icon pull-right"> <a href="#"
								class="demo-cancel-click" rel="tooltip" title="Click to refresh"><i
									class="icon-refresh"></i></a>
							</span> <a href="#widget2container" data-toggle="collapse">个人信息</a>
						</div>
						<div id="widget2container" class="block-body collapse in">
							<table class="table list">
								<tbody>
									<tr>
										<td>
											<p>用户名：</p>
										</td>
										<td>
											<p>${sessionScope.user.adminName }</p>
										</td>
									</tr>
									<tr>
										<td>
											<p>用户组：</p>
										</td>
										<td>
											<p>管理员</p>
										</td>
									</tr>
									<tr>
										<td>
											<p>登陆时间：</p>
										</td>
										<td>
											<p>
												<fmt:formatDate value="<%=new Date(System.currentTimeMillis()) %>" pattern="yyyy年MM月dd日,HH:mm:ss"/>
											</p>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<center>
												<p>
													<button class="btn btn-warning btn-large">修改密码</button>
												</p>
											</center>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					<div class="block span6">
						<p class="block-heading">快捷入口</p>
						<div class="block-body">
							<h2>Built with Less</h2>
							<p>The CSS is built with Less. There is a compiled version
								included if you prefer plain CSS.</p>
							<p>Fava bean jícama seakale beetroot courgette shallot
								amaranth pea garbanzo carrot radicchio peanut leek pea sprouts
								arugula brussels sprout green bean. Spring onion broccoli
								chicory shallot winter purslane pumpkin gumbo cabbage squash
								beet greens lettuce celery. Gram zucchini swiss chard mustard
								burdock radish brussels sprout groundnut. Asparagus horseradish
								beet greens broccoli brussels.</p>
							<p>
								<a class="btn btn-primary btn-large">Learn more &raquo;</a>
							</p>
						</div>
					</div>
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

</html>