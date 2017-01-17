<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
<script src="js/verify.js" type="text/javascript"></script>
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

.dialog form, .row .dialog form, .row-fluid .dialog form, .row-fluid [class*="span"].dialog:first-child form
	{
	margin-bottom: 0px;
	margin-left: 68px;
}

.buttons {
	margin-left: 45px;
	margin-top: 10px;
}

.table-bordered thead:first-child tr:first-child th:first-child,
	.table-bordered tbody:first-child tr:first-child td:first-child {
	-webkit-border-top-left-radius: 4px;
	border-top-left-radius: 4px;
	-moz-border-radius-topleft: 4px;
	width: 106px;
}

.checkcode {
	width: 150px;
	margin-right: 20px;
}

.btn-group {
	margin-left: 50px;
}

.btn-group>.btn+.btn {
	margin-left: 2px;
}

.frame-codes {
	margin-left: 50px;
}
</style>

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

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
<!-- favicon -->	
<link rel="shortcut icon" href="images/favicon.ico" />
</head>

<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">
	<!--<![endif]-->

	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">

			</ul>
			<a class="brand" href="index.html"><span class="first">LifeSharing</span>
				<span class="second">轻博客管理系统</span></a>
		</div>
	</div>

	<div class="row-fluid">
		<div class="dialog">
			<div class="block">
				<p class="block-heading">用户登录</p>
				<div class="block-body">
					<form action="loginVerify.action" method="post">
						<br /> 
						账号：<input type="text" name="admin_name" maxlength="20" value="<%=request.getAttribute("adminName") == null ? "" : request.getAttribute("adminName")%>"/><br />
						密码：<input type="password" name="admin_passwd" maxlength="20" /><br />
						<br>
						<div class="btn-group">
							<input type="submit" value="登录" class="btn btn-lg btn-success" />
							<input type="reset" value="重置" class="btn btn-lg btn-warning" />
						</div>
					</form>
				</div>
			</div>
			<p class="pull-right" style="">
				<a href="#" data-toggle="modal" data-target="#student-register">LifeSharing轻博客后台管理2016-2017</a>
			</p>
			<p>
				<a href="#"> <font color="red"> <%=request.getAttribute("message") == null ? "" : request.getAttribute("message")%>
				</font>
				</a>
			</p>
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


