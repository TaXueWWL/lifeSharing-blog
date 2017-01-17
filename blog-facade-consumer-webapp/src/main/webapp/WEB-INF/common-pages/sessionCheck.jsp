<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String service_path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	//直接跳过登录则重定向到登录页
	if (session.getAttribute("user") == null) {
		response.sendRedirect(service_path + "/login.html");
	}
%>