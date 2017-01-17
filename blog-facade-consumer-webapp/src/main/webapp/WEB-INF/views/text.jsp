<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="padding: 10px 10px 10px 10px">
		<form id="content" method="post" action="doRegister.action">
			<table cellpadding="5">
				<tr>
					<td colspan="2">用户注册</td>
				</tr>
				<tr>
					<td>用户名:</td>
					<td><input class="easyui-textbox" type="text" name="userName"
						data-options="required:true" style="width: 280px;"></input></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input class="easyui-textbox" type="password"
						name="userPwd" data-options="required:true" style="width: 280px;"></input></td>
				</tr>
				<tr>
					<td>手机号:</td>
					<td><input class="easyui-textbox" type="text" name="userMobile" 
						style="width: 280px;"></input></td>
				</tr>
				<tr>
					<td>邮箱:</td>
						<td><input class="easyui-numberbox" type="text" name="userEmail"/>
					</td>
				</tr>
				<tr>
					<td>性别:</td>
						<td>
						<select name="userGender">
								<option value="1">男</option>
								<option value="0">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="提交"/>
						<input type="reset" value="重置"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>