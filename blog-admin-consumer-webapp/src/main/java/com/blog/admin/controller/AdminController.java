package com.blog.admin.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.admin.api.IAdminService;
import com.blog.admin.bean.Admin;
import com.blog.admin.bean.SystemInformation;

/**
 * @ClassName: AdminController 
 * @Description: 管理员控制器
 * @作者 snowalker
 * @时间 2016年12月29日 下午12:36:47 
 * 
 *  return "forward:/hello"; 转发
 *  return "redirect:/hello";重定向  
 */
@Controller
public class AdminController {

	@Autowired
	IAdminService adminService;

	/*通过输入字符串进入对应页面*/
	@RequestMapping(value = "{pageName}", method = RequestMethod.GET)
	public String toPage(@PathVariable("pageName") String pageName) {
		return pageName;
	}

	/*会话检测，如果会话信息为null返回登录*/
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String toLogin(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login.html";
		}
		return "index";
	}

	/*登录验证*/
	@RequestMapping(value = "loginVerify", method = RequestMethod.POST)
	public String loginVerify(HttpServletRequest request, 
			@RequestParam(value = "admin_name", required = true) String adminName, 	
			@RequestParam(value = "admin_passwd", required = true) String adminPasswd
			) {
		//组装管理员实体
		Admin admin = Admin
						.builder()
						.adminName(adminName)
						.adminPasswd(DigestUtils.md5Hex(adminPasswd))
						.build();
		//验证管理员账号
		boolean isLogin = adminService.isAdminLogin(admin);
		if (isLogin) {
			request.getSession().setAttribute("user", admin);
			return "redirect:/index.html";
		}
		request.setAttribute("adminName", adminName);
		request.setAttribute("message", "验证失败，请重新登录");
		return "login";
	}

	/*用户注销登陆*/
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String adminLogout(HttpServletRequest request) {
		if (null != request.getSession()) {
			request.getSession().removeAttribute("user");
		}
		return "redirect:/login.html";
	}

	/*修改管理员密码*/
	@RequestMapping(value = "modifyPasswd", method = RequestMethod.POST)
	public String modifyPasswd(
			@RequestParam(value = "username") String userName, 
			@RequestParam(value = "newPasswd") String newPasswd,
			HttpServletRequest request
			) {
		if (null != userName && null != newPasswd) {
			String encodePasswd = DigestUtils.md5Hex(newPasswd);
			Admin admin = Admin.builder().adminName(userName).adminPasswd(encodePasswd).build();
			boolean isUpdated = adminService.updateAdminPasswd(admin);
			if (isUpdated) {
				request.setAttribute("msg-passwd", "密码修改成功!");
				return "index";
			} else {
				request.setAttribute("msg-passwd", "密码修改失败!");
				return "index";
			}
		}
		request.setAttribute("msg-passwd", "请输入非空值!");
		return "index";
	}

	/*管理员发布公告*/
	@RequestMapping(value = "sendMessage", method = RequestMethod.POST)
	public String sendMessage(
			@RequestParam(value = "message_title") String messageTile,
			@RequestParam(value = "message_content") String messageContent,
			HttpServletRequest request
			) {
		SystemInformation systemInformation = 
				SystemInformation.builder()
				.infoTitle(messageTile)
				.infoContent(messageContent)
				.infoDatetime(new Date(System.currentTimeMillis()))
				.infoPublisher("管理员")
				.build();
		boolean flag = adminService.sendMessage(systemInformation);
		if (flag) {
			request.setAttribute("send-message-msg", "公告发布成功");
		} else {
			request.setAttribute("send-message-msg", "公告发布失败，请重新发布");
		}
		return "sendMessage";
	}

}
