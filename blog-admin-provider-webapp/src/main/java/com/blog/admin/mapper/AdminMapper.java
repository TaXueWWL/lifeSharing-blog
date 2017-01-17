package com.blog.admin.mapper;

import org.springframework.stereotype.Repository;

import com.blog.admin.bean.Admin;
import com.github.abel533.mapper.Mapper;

/**
 * @ClassName: AdminMapper 
 * @Description: 管理员Mapper
 * @作者 snowalker
 * @时间 2016年12月29日 上午11:10:51 
 *
 */
@Repository(value = "adminMapper")
public interface AdminMapper extends Mapper<Admin> {

}
