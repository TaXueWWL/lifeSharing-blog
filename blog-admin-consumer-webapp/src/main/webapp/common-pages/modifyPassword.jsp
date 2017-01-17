<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#modify-password {
		margin-top:-300px;
	}
</style>
</head>
<body>
<!-- 修改密码 -->
		<div class="modal fade" id="modify-password" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h2 class="modal-title" id="myModalLabel">
						<center>密码修改</center>
					</h2><center><font color="red"><%=request.getAttribute("msg-passwd") != null ? request.getAttribute("msg-passwd") : ""%></font></center>
				</div>
				<form action="${pageContext.request.contextPath}/modifyPasswd.action" method="post" id="regisform">
					<div class="modal-body">
						<table class="table table-bordered table-striped table-hover">
							<tr>
								<td class="infoname"><strong>密码</strong></td>
								<td><input type="password" name="newPasswd"
									id="stu_password" class="form-control" maxlength="20" /></td>
								<td>
									<input type="hidden" name="username" value="${sessionScope.user.adminName }"/>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<center>
						<input type="submit" class="btn btn-lg btn-success" value="提交" />
							<button type="button" class="btn btn-warning" data-dismiss="modal">关闭</button>
						</center>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		</div>
		<!-- /.modal -->
		<script type="text/javascript">
		$(document).ready(function() {
			var return_login_flag = new Array();
			var return_regis_flag = new Array();
			//注册表单验证——用户密码验证
			$("#stu_password").focusout(function() {
				var word_reg = /^[a-zA-Z]+$/; //不能全是字母
				var flag_reg = /^[_#@]+$/; //不能全是符号
				var num_reg = /.{6,12}/; //长度为6到12位
				if(!num_reg.test($(this).val())) {
					$(this).val("");
					$(this).attr("placeholder", "密码长度为6到12位");
					$(this).addClass("invalid");
					return_regis_flag[1] = 0;
				} else if(flag_reg.test($(this).val())) {
					$(this).val("");
					$(this).attr("placeholder", "不能全是特殊字符");
					$(this).addClass("invalid");
					return_regis_flag[1] = 0;
				} else if(word_reg.test($(this).val())) {
					$(this).val("");
					$(this).attr("placeholder", "不能全是字母");
					$(this).addClass("invalid");
					return_regis_flag[1] = 0;
				} else if(!isNaN($(this).val())) {
					$(this).val("");
					$(this).attr("placeholder", "不能全是数字");
					$(this).addClass("invalid");
					return_regis_flag[1] = 0;
				} else {
					$(this).removeClass("invalid");
					return_regis_flag[1] = 1;
				}
			});
			//表单合法性验证函数
			function submits(arr) {
				//此处只可以使用arr.length，不可以使用arr.size
				//foreach中，i代表下标
				if(arr.length != 2 && arr.length != 5) {
					return false;
				} else {
					for(var i in arr) {
						if(arr[i] == 0) {
							return false;
						}
					}
					return true;
				}
			}
			//通过登录表单和注册表单触发验证事件
			$("#loginform").submit(function() {
				//submits(return_login_flag);
				return (submits(return_login_flag));
			})
			$("#regisform").submit(function() {
				//submits(return_regis_flag);
				return (submits(return_regis_flag));
			})
		})
		</script>
</body>
</html>