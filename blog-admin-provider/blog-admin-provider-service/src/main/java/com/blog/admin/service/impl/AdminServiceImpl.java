package com.blog.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.blog.admin.api.IAdminService;
import com.blog.admin.bean.Admin;
import com.blog.admin.bean.SystemInformation;
import com.blog.admin.mapper.AdminMapper;
import com.blog.admin.mapper.SystemInfoMapper;

/**
 * @ClassName: AdminServiceImpl 
 * @Description: 管理员服务实现类
 * @作者 snowalker
 * @时间 2016年12月29日 上午11:34:11 
 *
 */
@Service(value = "adminServiceImpl")
public class AdminServiceImpl implements IAdminService {

	@Autowired
	AdminMapper adminMapper;

	@Autowired
	SystemInfoMapper systemInfoMapper;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/*
	 * <p>Title: isAdminLogin</p> 
	 * <p>Description: 判断是否登录成功</p> 
	 * @param user
	 * @return 
	 * @see com.blog.admin.api.IAdminService#isAdminLogin(com.blog.admin.bean.User)
	 */
	@Override
	public boolean isAdminLogin(Admin admin) {
		Admin record = adminMapper.selectOne(admin);
		if (record != null) {
			return true;
		}
		return false;
	}
	/*
	 * <p>Title: updateAdminPasswd</p> 
	 * <p>Description: 修改管理员登录密码</p> 
	 * @param admin
	 * @return 
	 * @see com.blog.admin.api.IAdminService#updateAdminPasswd(com.blog.admin.bean.Admin)
	 */
	@Override
	public boolean updateAdminPasswd(Admin admin) {
		try {
			//对密码进行MD5编码
			String sql = " update tb_admin set admin_passwd=? where admin_name=? ";
			Object[] params = 
					new Object[]{admin.getAdminPasswd(), admin.getAdminName()};
			jdbcTemplate.update(sql, params);
			return true;
		} catch (DataAccessException e) {
			new RuntimeException("密码修改失败");
			e.printStackTrace();
		}
		return false;
	}
	/*
	 * <p>Title: sendMessage</p> 
	 * <p>Description: 管理员发布公告</p> 
	 * @param systemInformation 
	 * @see com.blog.admin.api.IAdminService#sendMessage(com.blog.admin.bean.SystemInformation)
	 */
	@Override
	public boolean sendMessage(SystemInformation systemInformation) {
		return  systemInfoMapper.insert(systemInformation) == 1 ? true : false;
	}

}
