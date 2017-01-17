package com.blog.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.blog.admin.api.IManageUserService;
import com.blog.admin.bean.User;
import com.blog.admin.mapper.ManageUserDaoImpl;
import com.blog.admin.mapper.UserAdminMapper;
import com.blog.util.pagination.domain.Page;
import com.blog.util.pagination.service.PageService;
import com.blog.util.pagination.service.PageServiceImpl;
import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * @ClassName: ManageUserServiceImpl 
 * @Description: 用户管理服务类实现
 * @作者 snowalker
 * @时间 2016年12月31日 上午11:10:10 
 */
@Service("manageUserServiceImpl")
public class ManageUserServiceImpl implements IManageUserService {

	@Autowired
	ManageUserDaoImpl manageUserDaoImpl;
	
	@Autowired
	UserAdminMapper userAdminMapper;
	
	/*
	 * <p>Title: getUserList</p> 
	 * <p>Description: 获取用户分页列表</p> 
	 * @param page
	 * @param rows
	 * @return 
	 * @see com.blog.admin.api.IManageUserService#getUserList(java.lang.Integer, java.lang.Integer)
	 */
	@Override
	public Page getUserList(String pageNo) {
		//注入PageDao实现类StudentDaoImpl
		PageService pageService = new PageServiceImpl(this.manageUserDaoImpl);
		//获取分页数据
		Page page = pageService.findPageRecords(pageNo);
		page.setPageSize(10);
		page.setUrl("manageUser.html?pageNo=");
		//添加数据返回
		return page;
	}
	
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"classpath:dubbo/dubbo-*.xml");
		IManageUserService manageUserServiceImpl = 
				(IManageUserService) applicationContext.getBean("manageUserServiceImpl");
		System.out.println(manageUserServiceImpl.queryUserList(1, 10).getList().size());
	}

	/*
	 * <p>Title: queryUserList</p> 
	 * <p>Description:分页信息获取 </p> 
	 * @param page
	 * @param rows
	 * @return 
	 * @see com.blog.admin.api.IManageUserService#queryUserList(java.lang.Integer, java.lang.Integer)
	 */
	@Override
	public PageInfo<User> queryUserList(Integer page, Integer rows) {
		 //分页参数
        PageHelper.startPage(page, rows);
        //查询User数据,查询所有倒序排列
        Example example = new Example(User.class);      
        //条件：倒序
        example.setOrderByClause(" updated DESC ");
        List<User> users = this.userAdminMapper.selectByExample(example);
        //获取分页后信息
        PageInfo<User> pageInfo = new PageInfo<>(users);
		return pageInfo;
	}

	/*
	 * <p>Title: makeUserInBlacklist</p> 
	 * <p>Description: 用户拉黑</p> 
	 * @param u_id
	 * @return 
	 * @see com.blog.admin.api.IManageUserService#makeUserInBlacklist(java.lang.Integer)
	 */
	@Override
	public boolean makeUserInBlacklist(Integer u_id) {
		return this.manageUserDaoImpl.makeUserInBlacklist(u_id) == 1 ? true : false;
	}

	/*
	 * <p>Title: makeUserInWhitelist</p> 
	 * <p>Description: 用户解除拉黑</p> 
	 * @param u_id
	 * @return 
	 * @see com.blog.admin.api.IManageUserService#makeUserInWhitelist(java.lang.Integer)
	 */
	@Override
	public boolean makeUserInWhitelist(Integer u_id) {
		return this.manageUserDaoImpl.makeUserInWhitelist(u_id) == 1 ? true : false;
	}

	/*
	 * <p>Title: updateUserInfo</p> 
	 * <p>Description: 修改用户信息</p> 
	 * @param user 
	 * @see com.blog.admin.api.IManageUserService#updateUserInfo(com.blog.admin.bean.User)
	 */
	@Override
	public void updateUserInfo(User user) {
		this.manageUserDaoImpl.updateUserInfo(user);
	}
}
