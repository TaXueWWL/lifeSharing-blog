<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
           时间：2017-01-14
           描述：个人信息
-->
<div class="deploy-microblog">
	<div class="modal fade" id="self-information" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only"></span>
					</button>
					<h2 class="modal-title" id="myModalLabel">
						<center>个人信息</center>
					</h2>
				</div>
				<div class="modal-body">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title"></h3>
						</div>
						<div class="panel-body">
							<table
								class="table table-bordered table-striped table-hover gaunzhu-list ">
								<tr>
									<td width="45%">用户id</td>
									<td>${sessionScope.user.u_id }</td>
								</tr>

								<tr>
									<td>用户昵称</td>
									<td>${sessionScope.user.userName }</td>
								</tr>

								<tr>
									<td>用户邮箱</td>
									<td>${sessionScope.user.userEmail }</td>
								</tr>

								<tr>
									<td>用户手机</td>
									<td>${sessionScope.user.userMobile }</td>
								</tr>

								<tr>
									<td>个人说明</td>
									<td>
										${sessionScope.user.userSelfIntro }
									</td>
								</tr>

								<tr>
									<td>是否黑名单</td>
									<td>
									<c:if test="${sessionScope.user.isBanned == 1} ">
										是
									</c:if>
									<c:if test="${sessionScope.user.isBanned == 0}">
										否
									</c:if>
									</td>
								</tr>
								
								<tr>
									<td colspan="2">
										<button type="button" class="btn btn-default btn-primary" onclick="window.location.href='#'">
									  	<i class="glyphicon glyphicon-plus"></i><br>
									  		详细了解...
								  		</button>
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