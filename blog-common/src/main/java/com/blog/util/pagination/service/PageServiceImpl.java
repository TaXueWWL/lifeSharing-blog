package com.blog.util.pagination.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.util.pagination.dao.PageDAO;
import com.blog.util.pagination.domain.Page;

/**
 * 分页业务逻辑
 * @author Administrator
 *
 */

public class PageServiceImpl implements PageService {
	
	
	private PageDAO pageDAO;
	
	public PageDAO getPageDAO() {
		return pageDAO;
	}

	public void setPageDAO(PageDAO pageDAO) {
		this.pageDAO = pageDAO;
	}

	public PageServiceImpl(PageDAO pageDAO) {
		this.pageDAO = pageDAO;
	}
	
	public PageServiceImpl() {
		super();
	}

	public Page findPageRecords(String num) {
		int pageNum = 1;
		if (num != null && !num.trim().equals("")) {
			pageNum = Integer.valueOf(num);
		}
		if (pageNum <= 0) {
			pageNum = 1;
		}
		int totalRecords = pageDAO.fetchEntityRowsAccount();
		Page page = new Page(pageNum, totalRecords);
		//获取分页记录
		page.setRecords(pageDAO.findEntityRecords(page.getStartIndex(), page.getPageSize()));
		//当前页大于总页数设置当前页为总页数
		if (pageNum >= page.getEndPage() ) {
			page.setCurrentPageNum(page.getTotalPage());
		}
		return page;
	}
	
}
