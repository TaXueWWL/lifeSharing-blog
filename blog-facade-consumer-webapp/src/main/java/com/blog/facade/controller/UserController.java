package com.blog.facade.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.facade.api.IUserService;
import com.blog.facade.bean.User;
import com.blog.util.string.StringUtil;

/**
 * @ClassName: UserController 
 * @Description: 用户控制器
 * @作者 snowalker
 * @时间 2017年1月10日 下午10:14:24 
 * return "forward:/hello"; 转发
 * return "redirect:/hello";重定向  
 */
@Controller
public class UserController {
	
	@Autowired
	IUserService userService;
	
	/*通过输入字符串进入对应页面*/
	@RequestMapping(value = "{pageName}", method = RequestMethod.GET)
	public String toPage(@PathVariable("pageName") String pageName) {
		return pageName;
	}
	
	/*用户登录*/
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}
	
	/*用户注册*/
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String toRegister() {
		return "register";
	}
	
	/*会话检测，如果会话信息为null返回登录*/
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String toLogin(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login.html";
		}
		return "index";
	}
	
	/*用户注销登陆*/
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String adminLogout(HttpServletRequest request) {
		if (null != request.getSession()) {
			request.getSession().removeAttribute("user");
		}
		return "redirect:/login.html";
	}
	
	/*注册action*/
	@RequestMapping(value = "doRegister", method = RequestMethod.POST)
	public String doRegister(User user, HttpServletRequest request) {
		if ("" != user.getUserName() 
				&& "" != user.getUserEmail() && "" != user.getUserMobile()
				&& "" != user.getUserPwd()) {
			user.setCreated(new Date());
			user.setUpdated(new Date());
			user.setIsBanned(0);
			
			boolean result = this.userService.doRegister(user);
			if (result) {
				request.setAttribute("loginMsg", "注册成功，请登录");
				return "login";
			}
			//数据回显
			request.setAttribute("userPwd", user.getUserPwd());
			request.setAttribute("userMobile", user.getUserMobile());
			request.setAttribute("userName", user.getUserName());
			request.setAttribute("userEmail", user.getUserEmail());
			request.setAttribute("registerMsg", "注册失败");
			return "register";
		}
		//数据回显
		request.setAttribute("registerMsg", "请输入有效的注册数据");
		return "register";
	}
	
	/*登录action*/
	@RequestMapping(value = "doLogin", method = RequestMethod.POST)
	public String doLogin(@RequestParam("userEmail") String userEmail, 
			@RequestParam("userPwd") String userPwd,
			HttpServletRequest request) {
		if (StringUtil.isEmpty(userEmail) || StringUtil.isEmpty(userPwd)) {
			request.setAttribute("userEmail", userEmail);
			request.setAttribute("loginMsg", "请输入正确的用户名及密码");
			return "login";
		} else {
			//组装用户数据验证数据合法性
			User user = User.builder().userEmail(userEmail).userPwd(userPwd).build();
			boolean flag = userService.isUserLogin(user);
			if (flag) {
				//用户所有数据写入session
				User userInfo = this.userService.queryUserByUseremail(userEmail);
				//被拉黑无法登陆
				if (1 == userInfo.getIsBanned()) {
					request.setAttribute("loginMsg", "您已被拉黑无法登陆，请联系管理员解禁");
					return "login";
				}
				request.getSession().setAttribute("user", userInfo);
				return "index";
			} else {
				//数据回显
				request.setAttribute("userEmail", userEmail);
				request.setAttribute("loginMsg", "用户名或密码错误");
				return "login";
			}
		}
		
	}
}
