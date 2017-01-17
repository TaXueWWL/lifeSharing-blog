package com.blog.facade.mapper;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.blog.facade.bean.Blog;
import com.blog.facade.bean.User;

/**
 * @ClassName: UserDaoImpl 
 * @Description: 用户数据操作实现类
 * @作者 snowalker
 * @时间 2017年1月10日 下午9:20:24 
 */
@Repository("userDaoImpl")
public class UserDaoImpl implements IUserDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	/*
	 * <p>Title: doRegister</p> 
	 * <p>Description: </p> 
	 * @param user 为了在内部类中使用user必须声明为final
	 * @return 
	 * @see com.blog.facade.mapper.IUserDao#doRegister(com.blog.facade.bean.User)
	 */
	public boolean doRegister(final User user) {
		String sql = " insert into tb_user(user_name, user_pwd, user_mobile, user_email, user_gender, created, updated) "
				+ "VALUES(?, ?, ?, ?, ?, ?, ?); ";
		int count = jdbcTemplate.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, user.getUserName());
				ps.setString(2, DigestUtils.md5Hex(user.getUserPwd()));
				ps.setString(3, user.getUserMobile());
				ps.setString(4, user.getUserEmail());
				ps.setInt(5, user.getUserGender());
				ps.setDate(6, new Date(System.currentTimeMillis()));	//创建时间
				ps.setDate(7, new Date(System.currentTimeMillis()));	//修改时间
			}
		});
		//注册成功返回成功
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	//判断用户登录
	@SuppressWarnings("deprecation")
	public boolean isUserLogin(User user) {
		String sql = "SELECT COUNT(u_id) from tb_user where user_email=? and user_pwd=?";
		int count = jdbcTemplate.queryForInt(sql, new Object[]{
				user.getUserEmail(),
				DigestUtils.md5Hex(user.getUserPwd())	//MD5编码
		});
		if (count == 1) {
			return true;
		}
		return false;
	}

	//根据用户邮箱查找用户全部信息
	@Override
	public User queryUserByUseremail(final String useremail) {
		String sql = " select * from tb_user where user_email = ? ";
		final User user = new User();
		jdbcTemplate.query(sql, new Object[]{useremail}, new RowCallbackHandler() {
			
			@Override
			public void processRow(ResultSet rs) throws SQLException {

				user.setU_id(rs.getInt("u_id")); 
				user.setIsBanned(rs.getInt("is_banned"));
				user.setUserEmail(rs.getString("user_email"));
				user.setUserGender(rs.getInt("user_gender"));
				user.setUserName(rs.getString("user_name"));
				user.setUserMobile(rs.getString("user_mobile"));
				user.setUserSelfIntro(rs.getString("user_self_intro"));
			}
		});
		return user;
	}

	//保存博客内容及图片地址
	@Override
	public void saveBlogAndPicPath(final Blog blog) {
		String sql = " insert into tb_blog(blog_content, blog_title, blog_datetime, img_url, u_id) "
				+ "VALUES(?, ?, ?, ?, ?); ";
		if (blog.getBlogContent() == "" || blog.getBlogContent() == null) {
			blog.setBlogContent("此轻博客为纯图片博客，请您欣赏");
			jdbcTemplate.update(sql, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, blog.getBlogContent());
					ps.setString(2, blog.getBlogTitle());
					ps.setDate(3, new Date(System.currentTimeMillis()));
					ps.setString(4, blog.getImgUrl());
					ps.setInt(5, blog.getUId());
				}
			});
			
		} else {
			jdbcTemplate.update(sql, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, blog.getBlogContent());
					ps.setString(2, blog.getBlogTitle());
					ps.setDate(3, new Date(System.currentTimeMillis()));
					ps.setString(4, blog.getImgUrl());
					ps.setInt(5, blog.getUId());
				}
			});
		}
	}
	
}
