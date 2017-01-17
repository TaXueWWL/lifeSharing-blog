package com.blog.facade.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.facade.api.IUserService;
import com.blog.facade.bean.Blog;
import com.blog.facade.bean.User;
import com.blog.facade.mapper.IUserDao;
import com.blog.facade.mapper.UserDaoImpl;
import com.blog.util.callback.ICallback;

/**
 * @ClassName: UserServiceImpl 
 * @Description: 用户服务实现类
 * @作者 snowalker
 * @时间 2017年1月10日 下午9:18:04 
 */
@Service("userServiceImpl")
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private UserDaoImpl userDaoImpl;
	/**
	 * @功能 回调方法
	 * @param ICallback
	 * @time 下午12:31:09
	 * @return T
	 */
	private <T> T execute(ICallback<T, UserDaoImpl> fun) {
		//UserDaoImpl userDaoImpl = new UserDaoImpl();
		return fun.doCallback(userDaoImpl);
	}

	//用户注册
	@Override
	public boolean doRegister(final User user) {
		System.out.println("*******************");
		System.out.println(user.toString());
		System.out.println("*******************");
		return this.execute(new ICallback<Boolean, UserDaoImpl>() {

			@Override
			public Boolean doCallback(UserDaoImpl e) {
				return e.doRegister(user);
			}
		});
	}

	//用户登录
	@Override
	public boolean isUserLogin(final User user) {
		return this.execute(new ICallback<Boolean, UserDaoImpl>() {

			@Override
			public Boolean doCallback(UserDaoImpl e) {
				return e.isUserLogin(user);
			}
		});
	}

	@Override
	public User queryUserByUseremail(String useremail) {
		return this.userDaoImpl.queryUserByUseremail(useremail);
	}

	@Override
	public void saveBlogAndPicPath(Blog blog) {
		this.userDaoImpl.saveBlogAndPicPath(blog);
	}
	
	
}
