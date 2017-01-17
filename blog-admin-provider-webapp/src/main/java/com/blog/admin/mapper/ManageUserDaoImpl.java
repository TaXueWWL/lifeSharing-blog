package com.blog.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.blog.admin.bean.User;
import com.blog.util.pagination.dao.PageDAO;

/**
 * @ClassName: ManageUserDaoImpl 
 * @Description: 用户管理分页实现类
 * @作者 snowalker
 * @时间 2016年12月31日 下午1:34:46 
 *
 */
@Repository("manageUserDaoImpl")
public class ManageUserDaoImpl implements PageDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Integer fetchEntityRowsAccount() {
		int count = 0;
		String sql = " select count(u_id) as count from tb_user ";
		count = this.jdbcTemplate.queryForInt(sql);
		return count;
	}

	@Override
	public List findEntityRecords(final Integer startIndex, final Integer pageSize) {
		//每页包含视频信息列表
		final List<User> users = new ArrayList<>();
		// 分页sql
		String sql = " select u_id, user_name, user_mobile, user_email, user_gender from tb_user  limit ?,? ";				 
		this.jdbcTemplate.query(sql, new Object[]{startIndex, pageSize}, new RowCallbackHandler(){

			@Override
			public void processRow(ResultSet rs) throws SQLException {
				User user = User.builder()
						.u_id(rs.getInt("u_id"))
						.userName(rs.getString("user_name"))
						.userMobile(rs.getString("user_mobile"))
						.userEmail(rs.getString("user_email"))
						.userGender(rs.getInt("user_gender"))
						.build();
				users.add(user);
			}
		});
		return users;
	}

	@Override
	public List findEntityRecordsWithParams(Integer startIndex, Integer pageSize, Object... args) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
