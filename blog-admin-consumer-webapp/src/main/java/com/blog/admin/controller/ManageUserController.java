package com.blog.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.admin.api.IManageUserService;
import com.blog.admin.bean.User;
import com.github.pagehelper.PageInfo;

/**
 * @ClassName: ManageUserController 
 * @Description: 用户管理控制器
 * @作者 snowalker
 * @时间 2016年12月31日 上午10:49:12 
 */
@Controller
public class ManageUserController {

	@Autowired
	IManageUserService iManageUserService;

	/**
	 * @功能 获取分页列表
	 * 注意：需要添加Mybatis依赖
	 * 因为在前端要对后端传来的数据进行分页处理
	 * 分页需要依赖Mybatis相关
	 * @time 下午8:30:51
	 * @return String
	 */
	@RequestMapping(value = "manageUser", method = {RequestMethod.GET})
	public String getUserListPagenation(
			HttpServletRequest request, @RequestParam("pageNo") String pageNo) {
		Integer page = Integer.valueOf(pageNo);
		if (pageNo != null) {
			if (page < 0) {
				page = 1;
			}
			//每页十条数据
			Integer rows = 10;	
			PageInfo<User> pageInfo = iManageUserService.queryUserList(page, rows);
			System.out.println("列表大小是" + pageInfo.getList().size());
			//获取分页列表数据
			request.setAttribute("userList", pageInfo.getList());
			//上一页
			request.setAttribute("prePage", pageInfo.getPrePage());
			//下一页
			request.setAttribute("nextPage", pageInfo.getNextPage());
			//最后一页
			request.setAttribute("lastPage", pageInfo.getLastPage());
			//全部页数
			request.setAttribute("pages", pageInfo.getPages());
			//当前页码
			request.setAttribute("pageNum", pageInfo.getPageNum());
			//直接返回分页PageInfo
			request.setAttribute("pageInfo", pageInfo);
		} 
		if (pageNo == null) {
			//每页十条数据
			Integer rows = 10;	
			PageInfo<User> pageInfo = iManageUserService.queryUserList(page, rows);
			System.out.println("列表大小是" + pageInfo.getList().size());
			//获取分页列表数据
			request.setAttribute("userList", pageInfo.getList());
			//上一页
			request.setAttribute("prePage", pageInfo.getPrePage());
			//下一页
			request.setAttribute("nextPage", pageInfo.getNextPage());
			//最后一页
			request.setAttribute("lastPage", pageInfo.getLastPage());
			//全部页数
			request.setAttribute("pages", pageInfo.getPages());
			//当前页码
			request.setAttribute("pageNum", pageInfo.getPageNum());
			//直接返回分页PageInfo
			request.setAttribute("pageInfo", pageInfo);
		}
		return "manageUser";
	}
	
	/**
	 * @功能 拉黑用户
	 * @time 下午5:35:01
	 * @return String
	 */
	@RequestMapping(value = "blacklist", method = RequestMethod.GET)
	public String makeUserInBlacklist(@RequestParam("u_id") Integer u_id, HttpServletRequest request) {
		System.out.println(u_id);
		boolean flag = iManageUserService.makeUserInBlacklist(u_id);
		StringBuffer sb = new StringBuffer();
		if (flag) {
			request.setAttribute("msg_blacklist", sb.append("用户").append(u_id).append("拉黑成功"));
		} else {
			request.setAttribute("msg_blacklist", sb.append("用户").append(u_id).append("拉黑失败"));
		}
		return "redirect:/manageUser.html?pageNo=1";
	}
	
	/**
	 * @功能 用户解除黑名单
	 * @time 下午5:35:01
	 * @return String
	 */
	@RequestMapping(value = "whitelist", method = RequestMethod.GET)
	public String makeUserInWhitelist(@RequestParam("u_id") Integer u_id, HttpServletRequest request) {
		boolean flag =iManageUserService.makeUserInWhitelist(u_id);
		StringBuffer sb = new StringBuffer();
		if (flag) {
			request.setAttribute("msg_blacklist", sb.append("用户").append(u_id).append("解除拉黑成功"));
		} else {
			request.setAttribute("msg_blacklist", sb.append("用户").append(u_id).append("解除拉黑失败"));
		}
		return "redirect:/manageUser.html?pageNo=1";
	}
	
	/**
	 * @功能 修改用户信息
	 * @time 下午7:16:00
	 * @return String
	 */
	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUserInfo(HttpServletRequest request) {
		String u_id = request.getParameter("u_id");
		String userName = request.getParameter("userName");
		String userMobile = request.getParameter("userMobile");
		String userPwd = request.getParameter("userPwd");
		System.out.println(u_id);
		System.out.println(userName);
		System.out.println(userMobile);
		System.out.println(userPwd);
		
		User user = User.builder().u_id(Integer.valueOf(u_id)).userName(userName).userMobile(userMobile)
					.userPwd(userPwd).build();
				
		this.iManageUserService.updateUserInfo(user);
		return "redirect:/manageUser.html?pageNo=1";
	}

}
