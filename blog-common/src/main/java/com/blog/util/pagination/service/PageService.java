package com.blog.util.pagination.service;

import com.blog.util.pagination.domain.Page;

/**
 * 分页服务获取Page实体
 * @author Administrator
 * 实现该接口即可获取Page实体
 *
 */
public interface PageService {
	//获取分页bean，全表分页
	Page findPageRecords(String num);
}
