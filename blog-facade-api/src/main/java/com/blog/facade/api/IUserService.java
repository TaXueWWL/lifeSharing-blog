package com.blog.facade.api;

import com.blog.facade.bean.Blog;
import com.blog.facade.bean.User;

/**
 * @ClassName: IUserService 
 * @Description: 用户服务接口
 * @作者 snowalker
 * @时间 2017年1月10日 下午9:13:21 
 */

public interface IUserService {
	
	//用户注册
	public boolean doRegister(User user);
	//用户登录
	public boolean isUserLogin(User user);
	//根据用户邮箱查找用户全部信息
	public User queryUserByUseremail(String useremail);
	//保存博客及图片地址
	public void saveBlogAndPicPath(Blog blog);
}
