<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common-pages/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>LifeSharing-分享精彩</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/index-main.css" />
	</head>

	<body>
		<div class="site-header" id="header">
			<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
				        </button>
						<a class="navbar-brand header-brand" href="#">LifeSharing轻博客</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active">
								<a href="#">主页 <span class="sr-only">(current)</span></a>
							</li>
							<li>
								<a href="#" data-toggle="modal" data-target="#send-microblog">写微博</a>
							</li>
							<li>
								<a href="#" data-toggle="modal" data-target="#upload-picture">发图片</a>
							</li>
							<li>
								<a href="#">长文章</a>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<!--
		                        	作者：1210812591@qq.com
		                        	时间：2017-01-13
		                        	描述：搜索框
		                        -->
								<form class="navbar-form navbar-left" role="search">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="输入要搜索的人或内容...">
										<span class="input-group-btn">
								        <button class="btn btn-primary" type="submit">Go!</button>
								      </span>
									</div>
								</form>
							</li>
							<li class="dropdown active">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li>
										<a href="#" data-toggle="modal" data-target="#self-information">个人信息</a>
									</li>
									<li role="separator" class="divider"></li>
									<li>
										<a href="logout.action">注销登录</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>

		<!--
        	作者：1210812591@qq.com
        	时间：2017-01-13
        	描述：页面主体
        -->
		<div class="row site-content">
			<!--
            	作者：1210812591@qq.com
            	时间：2017-01-13
            	描述：博客列表
            -->
			<div class="col-md-9 col-xs-9">
				<div class="main-content-blog-list">
					<!--
	                  	描述：功能按钮列表
	                  -->
					<table border="0.5" cellspacing="0" cellpadding="0" class="main-table-button-list">
						<tr>
							<td>
								<div>
									<img src="img/user-pic.png" width="144px" height="135px" />
								</div>
							</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn-header btn btn-default" data-toggle="modal"
										data-target="#send-microblog">
									  	<i class="glyphicon glyphicon-edit glyphicon-above"></i><br>
									  	文字
								  	</button>
									<button type="button" class="btn-header btn btn-default" data-toggle="modal" 
										data-target="#upload-picture">
								  	<i class="glyphicon glyphicon-picture glyphicon-above"></i><br>
								  	图片
								  </button>
									<button type="button" class="btn-header btn btn-default" onclick="window.location.href = '#'">
								  	<i class="glyphicon glyphicon-list-alt glyphicon-above"></i><br>
								  	长文章
								  </button>
									<button type="button" class="btn-header btn btn-default" data-toggle="modal"
										data-target="#special-gaunzhu">
								  	<i class="glyphicon glyphicon-star glyphicon-above"></i><br>
								  	关注列表
								  </button>
								</div>
							</td>
						</tr>
					</table>
					<!--
	                  	描述：微博列表
	                  -->
					<div class="blog-lists">
						<!--
                        	描述：单条博客
                        -->
						<div class="blog-item">
							<table class="table table-striped table-bordered" border="" cellspacing="" cellpadding="">
								<tr>
									<td width="450px">
										<table>
											<tr>
												<td width="350px">
													<div class="user-info-bloglist">
														踏雪无痕
													</div>
												</td>
												<td>
													<i class="glyphicon-special glyphicon glyphicon-heart">关注</i>
												</td>
											</tr>
										</table>
									</td>
									<td>
										<div class="deploy-datetime-bloglist-span">
											<span class="label label-primary">发布时间</span>
										</div>
									</td>
									<td>
										<div class="deploy-datetime-bloglist">
											2016.12.11
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<div class="media">
											<a class="media-left" href="#">
												<img src="img/user-pic.png" width="200px" height="200px" alt="图片加载失败">
											</a>
											<div class="media-body">
												<h3 class="media-heading">Media heading
										    	<a href="#"><span class="more-content"><b>更多</b></span></a>
										    </h3>

												<div class="blog-content">
													如果你有大量的设置为 inline 属性的标签全部放在一个较窄的容器元素内，在页面上展示这些标签就会出现问题，每个标签就会有自己的一个 inline-block 元素（就像图标一样）。解决的办法是为每个标签都设置为 display: inline-block; 属性。关于这个问题以及实例，请参考 #13219 。 如果你有大量的设置为 inline 属性的标签全部放在一个较窄的容器元素内，在页面上展示这些标签就会出现问题，每个标签就会有自己的一个 inline-block 元素（就像图标一样）。解决的办法是为每个标签都设置为 display: inline-block; 属性。关于这个问题以及实例，请参考 #13219 。 如果你有大量的设置为 inline 属性的标签全部放在一个较窄的容器元素内，在页面上展示这些标签就会出现问题，每个标签就会有自己的一个 inline-block 元素（就像图标一样）。解决的办法是为每个标签都设置为 display: inline-block; 属性。关于这个问题以及实例，请参考 #13219 。
												</div>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
						
						<!--
                        	描述：单条博客
                        -->
						<div class="blog-item">
							<table class="table table-striped table-bordered" border="" cellspacing="" cellpadding="">
								<tr>
									<td width="450px">
										<table>
											<tr>
												<td width="350px">
													<div class="user-info-bloglist">
														踏雪无痕
													</div>
												</td>
												<td>
													<i class="glyphicon-special glyphicon glyphicon-heart">关注</i>
												</td>
											</tr>
										</table>
									</td>
									<td>
										<div class="deploy-datetime-bloglist-span">
											<span class="label label-primary">发布时间</span>
										</div>
									</td>
									<td>
										<div class="deploy-datetime-bloglist">
											2016.12.11
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<div class="media">
											<a class="media-left" href="#">
												<img src="img/timg.jpg" width="200px" height="200px" alt="图片加载失败">
											</a>
											<div class="media-body">
												<h3 class="media-heading">Media heading
										    	<a href="#"><span class="more-content"><b>更多</b></span></a>
										    </h3>

												<div class="blog-content">
													如果你有大量的设置
												</div>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>

				</div>
			</div>
			<!--
	          	作者：1210812591@qq.com
	          	时间：2017-01-13
	          	描述：其他信息及列表菜单
	          -->
			<div class="col-md-3 col-xs-3">
				<div class="list-group">
					<a href="#" class="list-group-item active list-group-menu">
						其他功能
					</a>
					<a href="#" class="list-group-item"><i class="glyphicon glyphicon-home"></i><span class="list-group-item-textcontent">个人主页</span></a>
					<a href="#" class="list-group-item"><i class="glyphicon glyphicon-envelope"></i><span class="list-group-item-textcontent">系统通知</span></a>
					<a href="#" class="list-group-item" data-toggle="modal" data-target="#special-gaunzhu"><i class="glyphicon glyphicon-list"></i><span class="list-group-item-textcontent">关注列表</span></a>
					<a href="#" class="list-group-item"><i class="glyphicon glyphicon-book"></i><span class="list-group-item-textcontent">我的文章</span></a>
				</div>
				<div class="copyright">
					&copy;2017LifeSharing.<br>All Rights Reserved
				</div>
			</div>

			<div class="w-top">
				<a href="#header"><i class="w-top-glyphicon glyphicon glyphicon-chevron-up"></i></a>
			</div>
			
			<!--
            	时间：2017-01-14
            	描述：文字发布模态框
            -->
			<div class="deploy-microblog">
				<div class="modal fade" id="send-microblog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">&times;</span><span class="sr-only"></span>
												</button>
								<h2 class="modal-title" id="myModalLabel">
									<center>发心情</center>
								</h2>
							</div>
							<div class="modal-body">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">正文</h3>
									</div>
									<div class="panel-body updateUser">
										<form action="writeBlogAndPic.action" method="post" enctype="multipart/form-data">
											<!-- 用户id -->
											<input type="hidden" name="userId" value="${sessionScope.user.u_id }" />
											<!-- 标题 -->
											<div class="input-group">
												<div class="input-group-addon">微博标题</div>
												<input type="text" class="form-control" name="blogTitle" id="blogTitle" placeholder="在此输入微博标题" required="required">
											</div>
											<!-- 内容 -->
											<br />
											<div class="input-group">
												<div class="input-group-addon">微博正文</div>
												<textarea class="form-control" name="blogContent" id="blogContent" maxlength="500" placeholder="在此输入微博正文" required="required"></textarea>
											</div>
											<hr>
											<!--图片上传 -->
											<div class="input-group">
												<div class="input-group-addon">选择图片</div>
												<input type="file" class="form-control" name="blogPicture" id="blogPicture" required="required">
											</div>
											<!--用户密码 -->
											<br />
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
												<button type="submit" class="btn btn-primary">提交</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			
			<!--
            	时间：2017-01-14
            	描述：图片上传模态
            -->
			<div class="deploy-microblog">
				<div class="modal fade" id="upload-picture" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">&times;</span><span class="sr-only"></span>
												</button>
								<h2 class="modal-title" id="myModalLabel">
									<center>发图片</center>
								</h2>
							</div>
							<div class="modal-body">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">正文</h3>
									</div>
									<div class="panel-body updateUser">
										<form action="uploadPic.action" method="post" enctype="multipart/form-data">
											<!-- 用户id -->
											<input type="hidden" name="userId" value="${sessionScope.user.u_id }" />
											<!-- 标题 -->
											<div class="input-group">
												<div class="input-group-addon">图片心情</div>
												<input type="text" class="form-control" name="blogTitle" id="blogTitle" placeholder="在此输入心情标题" required="required">
											</div>
											<br />
											<!--图片上传 -->
											<div class="input-group">
												<div class="input-group-addon">选择图片</div>
												<input type="file" class="form-control" name="blogPicture" id="blogPicture" required="required">
											</div>
											<br />
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
												<button type="submit" class="btn btn-primary">提交</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--
            	时间：2017-01-14
            	描述：特别关注列表
            -->
			<div class="deploy-microblog">
				<div class="modal fade" id="special-gaunzhu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">&times;</span><span class="sr-only"></span>
												</button>
								<h2 class="modal-title" id="myModalLabel">
									<center>关注列表</center>
								</h2>
							</div>
							<div class="modal-body">
								<div class="panel panel-primary panel-guanzhu-list">
									<div class="panel-heading">
										<h3 class="panel-title">正文</h3>
									</div>
									<div class="panel-body updateUser">
										<table class="table table-bordered table-striped table-hover gaunzhu-list ">
											<tr>
												<td>id</td>
												<td>关注者昵称</td>
												<td>操作</td>
											</tr>
							
											<tr>
												<td></td>
												<td></td>
												<td>
													<a href="">
														<button class="btn btn-danger btn-lg">查看更多</button>
													</a>
												</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>
													<a href="">
														<button class="btn btn-danger btn-lg">查看更多</button>
													</a>
												</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>
													<a href="">
														<button class="btn btn-danger btn-lg">查看更多</button>
													</a>
												</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>
													<a href="">
														<button class="btn btn-danger btn-lg">查看更多</button>
													</a>
												</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>
													<a href="">
														<button class="btn btn-danger btn-lg">查看更多</button>
													</a>
												</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>
													<a href="">
														<button class="btn btn-danger btn-lg">查看更多</button>
													</a>
												</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td>
													<a href="">
														<button class="btn btn-danger btn-lg">查看更多</button>
													</a>
												</td>
											</tr>
											
											
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 用户信息模态框 -->
			<%@ include file="../common-pages/userInfoPages.jsp" %>
		</div>

		<script src="js/jquery-1.12.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>