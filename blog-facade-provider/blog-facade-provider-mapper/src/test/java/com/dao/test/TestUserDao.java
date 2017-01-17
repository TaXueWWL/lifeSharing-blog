package com.dao.test;
import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.blog.facade.bean.Blog;
import com.blog.facade.bean.User;
import com.blog.facade.mapper.UserDaoImpl;


public class TestUserDao {
	
	private UserDaoImpl userDaoImpl;

	@SuppressWarnings("resource")
	@Before
	public void setUp() throws Exception {
		// 完成UserService的初始化
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"classpath:spring/applicationContext.xml");
		this.userDaoImpl = (UserDaoImpl) applicationContext.getBean("userDaoImpl");
	}

	@Test
	public void test() {
		User user = User.builder().userName("武文良").userPwd("qweqwe123123")
					.userMobile("13534444444").userEmail("123123@qq.com")
					.userGender(1).build();
					
		//System.out.println(userDaoImpl.doRegister(user));
		System.out.println(userDaoImpl.isUserLogin(user));
	}
	
	@Test
	public void testGetUserByEmail() {
		User user = userDaoImpl.queryUserByUseremail("123@qq.com");
		System.out.println(user.toString());
	}
	
	@Test
	public void testSavePicAndBlog() {
		Blog blog = Blog.builder().blogTitle("aaaaaaaaa").blogContent("哈哈哈哈哈哈哈哈哈").blogDatetime(new Date()).uId(1).build();
		userDaoImpl.saveBlogAndPicPath(blog);
	}
}	
