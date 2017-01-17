package com.blog.util.pagination.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * 接口PageDAO
 * 实现该接口得到分页总数及每页的列表
 * @author Administrator
 *
 */
public interface PageDAO{
	
	//获取实体总数
	public Integer fetchEntityRowsAccount();
	/**
  	 * 
  	 * @param startIndex开始的索引
  	 * @param pageSize	每页大小
  	 * @return
  	 */
  	@SuppressWarnings("rawtypes")
	public List findEntityRecords(Integer startIndex, Integer pageSize);
  	/**
  	 * 根据条件进行分页
  	 * @param startIndex开始的索引
  	 * @param pageSize	每页大小
  	 * @return
  	 */
  	@SuppressWarnings("rawtypes")
	public List findEntityRecordsWithParams(Integer startIndex, Integer pageSize, Object... args);
	
}
