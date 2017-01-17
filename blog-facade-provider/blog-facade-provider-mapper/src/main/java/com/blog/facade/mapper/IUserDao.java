package com.blog.facade.mapper;

import com.blog.facade.bean.Blog;
import com.blog.facade.bean.User;

/**
 * @ClassName: IUserDao 
 * @Description: 用户接口实现类
 * @作者 snowalker
 * @时间 2017年1月10日 下午9:24:42 
 */

public interface IUserDao {
	//用户注册
	public boolean doRegister(User user);
	//用户登录
	public boolean isUserLogin(User user);
	//根据用户邮箱查找用户全部信息
	public User queryUserByUseremail(String useremail);
	//保存博客及图片地址
	public void saveBlogAndPicPath(Blog blog);
}
