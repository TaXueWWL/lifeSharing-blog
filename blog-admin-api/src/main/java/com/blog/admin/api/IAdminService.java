package com.blog.admin.api;

import com.blog.admin.bean.Admin;
import com.blog.admin.bean.SystemInformation;

/**
 * @ClassName: IUserService 
 * @Description: 管理员服务接口
 * @作者 snowalker
 * @时间 2016年12月29日 上午10:39:25 
 */

public interface IAdminService {
	
	//管理员登录
	public boolean isAdminLogin(Admin admin);
	//修改管理员密码
	public boolean updateAdminPasswd(Admin admin);
	//管理员发布公告
	public boolean sendMessage(SystemInformation systemInformation);
}
