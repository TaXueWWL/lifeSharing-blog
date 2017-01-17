package com.blog.admin.mapper;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowCallbackHandler;
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
		return null;
	}

	/**
	 * @功能 拉黑用户
	 * @time 下午6:26:02
	 * @return int
	 */
	public int makeUserInBlacklist(final Integer u_id) {
		String sql = " update tb_user set is_banned=1 where u_id=? ";
		return jdbcTemplate.update(sql, new PreparedStatementSetter(){

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, u_id);
			}

		});
	}
	
	/**
	 * @功能 解除用户拉黑
	 * @time 下午6:26:26
	 * @return int
	 */
	public int makeUserInWhitelist(final Integer u_id) {
		String sql = " update tb_user set is_banned=0 where u_id=? ";
		return jdbcTemplate.update(sql, new PreparedStatementSetter(){

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, u_id);
			}

		});
	}

	/**
	 * @功能 修改用户信息
	 * @time 下午7:26:08
	 * @return void
	 */
	public int updateUserInfo(User user) {
		final Integer u_id = user.getU_id();
		final String userName = user.getUserName();
		final String userMobile = user.getUserMobile();
		final Date updateTime = new Date(System.currentTimeMillis());
		String sql = " update tb_user set user_mobile=?, user_name=?, updated=? where u_id=? ";
		return jdbcTemplate.update(sql, new PreparedStatementSetter(){

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, userMobile);
				ps.setString(2, userName);
				ps.setDate(3, updateTime);
				ps.setInt(4, u_id);
			}

		});
	}
	
}
