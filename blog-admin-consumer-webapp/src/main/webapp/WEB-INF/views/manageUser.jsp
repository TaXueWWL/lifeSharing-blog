<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String service_path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	//直接跳过登录则重定向到登录页
	if (session.getAttribute("user") == null) {
		response.sendRedirect(service_path + "/login.html");
	}
%>
<!-- 包含密码修改页面 -->
<jsp:include page="/common-pages/modifyPassword.jsp" />
<!-- 包含session检测的页面 -->
<jsp:include page="/common-pages/sessionCheck.jsp" />
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



.table-bordered tbody:first-child tr:first-child td {
	border-top: 0;
	text-align: center;
}

.table-bordered th, .table-bordered td {
	border-left: 1px solid #dddddd;
	text-align: center;
}


.pagination {
	text-align: center;
}

.well {
	min-height: 20px;
	padding: 19px;
	margin-bottom: -15px;
	border: 1px solid #e3e3e3;
	border-radius: 4px;
}

.table {
	width: 100%;
	margin-bottom: -10px;
}

.user_mobile {
	width: 140px;
	overflow: hidden;
}

.user_email {
	width: 160px;
	overflow: hidden;
}

.user_id_nickname {
	width: 100px;
	overflow: hidden;
}

.user_gender {
	width: 30px;
}

.updateUser {
	margin-left: 100px;
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
					class="hidden-phone visible-tablet visible-desktop" role="button">欢迎您
						${sessionScope.user.adminName}</a></li>
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
		<ul id="man-management" class="nav nav-list collapse in">
			<li class="active"><a href="manageUser.html?pageNo=1">用户列表</a></li>
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

			<h1 class="page-title">用户管理</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="${requestScope.path}/student/index.html">用户管理</a> <span
				class="divider">/</span></li>
			<li class="active">用户列表</li>
			<li class="active"><%=request.getAttribute("msg_blacklist") != null ? request.getAttribute("msg_blacklist") : ""%></li>
		</ul>
		<div class="copyrights">
			Collect from <a href="http://www.cssmoban.com/" title="网站模板">网站模板</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<br />
				<div class="well">
					<table style="font-size: 20px;"
						class="table table-striped table-bordered">
						<tr>
							<td class="user_id_nickname"><h4>用户id</h4></td>
							<td class="user_id_nickname"><h4>用户昵称</h4></td>
							<td class="user_mobile"><h4>用户手机</h4></td>
							<td class="user_email"><h4>用户邮箱</h4></td>
							<td class="user_gender"><h4>性别</h4></td>
							<td class="user_gender"><h4>是否拉黑</h4></td>
							<td><h4>操作</h4></td>
						</tr>
						<c:forEach items="${requestScope.userList}" var="userItem">
							<tr>
								<td>
									<div class="messageOverflow">${userItem.u_id}</div>
								</td>
								<td>
									<div class="messageOverflow">${userItem.userName}</div>
								</td>
								<td>
									<div class="messageOverflow">${userItem.userMobile}</div>
								</td>
								<td>
									<div class="messageOverflow">${userItem.userEmail}</div>
								</td>
								<td><c:if test="${userItem.userGender == 1}">
										<div class="messageOverflow">男</div>
									</c:if> <c:if test="${userItem.userGender == 0}">
										<div class="messageOverflow">女</div>
									</c:if></td>
								<td><c:if test="${userItem.isBanned == 1}">
										<div class="messageOverflow">是</div>
									</c:if> <c:if test="${userItem.isBanned == 0}">
										<div class="messageOverflow">否</div>
									</c:if></td>
								<td width="180px"><a
									href="${pageContext.request.contextPath}/blacklist.action?u_id=${userItem.u_id}"
									onclick="confirm('确认拉黑?')"><button
											class="btn btn-danger btn-lg">拉黑</button></a> <a
									href="${pageContext.request.contextPath}/whitelist.action?u_id=${userItem.u_id}"
									onclick="confirm('确认添加白名单?')"><button
											class="btn btn-primary btn-lg">白名单</button></a>
									<button class="btn btn-warning btn-lg" data-toggle="modal"
										data-target="#myModal${userItem.u_id}">编辑</button></td>
							</tr>

						</c:forEach>
					</table>


				</div>

				
				<div class="pagination">
					<ul>
						<!--分页部分开始 -->
						<c:if test="${not empty requestScope.userList}">
							<br />
							<li><button type="button" class="btn btn-primary"
									onclick="window.location.href='${pageContext.request.contextPath}/manageUser.html?pageNo=1'">
									<span class="glyphicon glyphicon-home">首页</span></a>
								</button></li>
							<c:if test="${requestScope.prePage > 0}">
								<li><button type="button" class="btn btn-default"
										onclick="window.location.href='${pageContext.request.contextPath}/manageUser.html?pageNo=${requestScope.prePage}'">
										<span class="glyphicon glyphicon-circle-arrow-left">上一页</span>
									</button></li>
							</c:if>
							<c:choose>
								<c:when test="${requestScope.nextPage == 0}">
									<li><button type="button" class="btn btn-default"
											onclick="window.location.href='${pageContext.request.contextPath}/manageUser.html?pageNo=${requestScope.pages}'">
											<span class="glyphicon glyphicon-circle-arrow-right">下一页</span>
										</button></li>
								</c:when>
								<c:otherwise>
									<li><button type="button" class="btn btn-default"
											onclick="window.location.href='${pageContext.request.contextPath}/manageUser.html?pageNo=${requestScope.nextPage}'">
											<span class="glyphicon glyphicon-circle-arrow-right">下一页</span>
										</button></li>
								</c:otherwise>
							</c:choose>
							<li><button type="button" class="btn btn-primary"
									style="margin-right: 10px;"
									onclick="window.location.href='${pageContext.request.contextPath}/manageUser.html?pageNo=${requestScope.lastPage}'">
									<span class="glyphicon glyphicon-play">尾页</span>
								</button></li>

							<li>当前${requestScope.pageNum}页</li>
							<li>共&nbsp;${requestScope.pages}页</li>
						</c:if>
					</ul>
				</div>
				<!--分页部分结束 -->
				
				
				
			</div>
		</div>
		
		
		<!-- 弹出模态框 -->

				<c:forEach items="${requestScope.userList}" var="userItem">
					<!-- 通过模态框获取对应的条目 -->
					<!-- 这里用DIV把dialog包一下就解决了样式套用问题！ -->
					<div>
						<div class="modal fade" id="myModal${userItem.u_id}" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="false">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span><span class="sr-only"></span>
									</button>
										<h2 class="modal-title" id="myModalLabel">
											<center>用户信息详情</center>
										</h2>
									</div>
									<div class="modal-body">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h3 class="panel-title">${message.mTitle}</h3>
											</div>
											<div class="panel-body updateUser">
												<form action="updateUser.action" method="post">
													<!-- id -->
													<input type="hidden" name="u_id" value="${userItem.u_id}">
													<!--用户昵称 -->
													<br />
													<div class="input-group">
														<div class="input-group-addon">用户昵称</div>
														<input type="text" class="form-control" name="userName"
															id="videoName" value="${userItem.userName}">
													</div>
													<!--用户邮箱 -->
													<br />
													<div class="input-group">
														<div class="input-group-addon">用户邮箱</div>
														<input type="text" class="form-control" name="userEmail"
															id="userEmail" disabled="disabled"
															value="${userItem.userEmail}">
													</div>
													<!--用户手机 -->
													<br />
													<div class="input-group">
														<div class="input-group-addon">用户手机</div>
														<input type="text" class="form-control" name="userMobile"
															id="userMobile" value="${userItem.userMobile}">
													</div>
													<!--用户密码 -->
													<br />
													<div class="input-group">
														<div class="input-group-addon">用户密码</div>
														<input type="text" class="form-control" name="userPwd"
															id="userPwd" disabled="disabled"
															value="${userItem.userPwd}">
													</div>
													<br />
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">关闭</button>
														<button type="submit" class="btn btn-primary"
															onclick="confirm('确认提交更改?')">提交</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</c:forEach>
		
		
		<footer>
			<hr>

			<p class="pull-right">
				Copy right &copy; <a href="#">2016</a>
			</p>

			<p>
				&copy; <a href="#">LifeSharing轻博客</a>
			</p>
		</footer>

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
