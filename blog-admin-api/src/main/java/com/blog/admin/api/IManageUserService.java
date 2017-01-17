package com.blog.admin.api;

import com.blog.admin.bean.User;
import com.blog.util.pagination.domain.Page;
import com.github.pagehelper.PageInfo;

/**
 * @ClassName: IManageUserService 
 * @Description: 用户管理服务接口
 * @作者 snowalker
 * @时间 2016年12月29日 上午10:43:22 
 */

public interface IManageUserService {
	//查询用户分页列表
	public Page getUserList(String pageNo);
	
	//查询分页2.0 使用PageHelper
	public PageInfo<User> queryUserList(Integer page, Integer rows);
	
	//根据id进行用户拉黑
	public boolean makeUserInBlacklist(Integer u_id);
	
	//根据id对用户解除拉黑
	public boolean makeUserInWhitelist(Integer u_id);
	
	//修改用户信息
	public void updateUserInfo(User user);
}
