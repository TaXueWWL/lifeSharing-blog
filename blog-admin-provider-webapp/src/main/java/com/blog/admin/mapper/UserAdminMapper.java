package com.blog.admin.mapper;

import org.springframework.stereotype.Repository;

import com.blog.admin.bean.User;
import com.github.abel533.mapper.Mapper;

/**
 * @ClassName: UserAdminMapper 
 * @Description: 用户管理Mapper
 * @作者 snowalker
 * @时间 2016年12月29日 上午11:23:43 
 *
 */

@Repository(value = "userAdminMapper")
public interface UserAdminMapper extends Mapper<User> {

}
