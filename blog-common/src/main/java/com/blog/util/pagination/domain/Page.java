package com.blog.util.pagination.domain;

import java.util.List;

/**
 * 分页bean
 * @author Administrator
 *
 */
public class Page {
	//分页记录Dao查出
	@SuppressWarnings("rawtypes")
	private List Records;
	//当前页码
	private int currentPageNum;
	//总记录数
	private int totalRecords;
	//页大小
	public int pageSize = 8;
	//总的页数
	private int totalPage;
	//每一页开始记录
	private int startIndex;
	//开始页码
	private int startPage;
	//结束页码
	private int endPage;
	//查询分页请求url
	private String url;
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Page(int currentPageNum, int totalRecords ) {
		this.currentPageNum = currentPageNum;
		this.totalRecords = totalRecords;
		//计算总页数
		totalPage = (totalRecords % pageSize == 0) ? 
							totalRecords/pageSize : (totalRecords / pageSize + 1);
		//开始索引
		startIndex = (currentPageNum - 1) * pageSize;
		
		//计算开始和结束页码
		if(totalPage<=5){//不足9页
			startPage = 1;
			endPage = totalPage;
		}else{
			startPage = currentPageNum-4;
			endPage = currentPageNum+4;
			if(startPage<1){
				startPage = 1;
				endPage = startPage+8;
			}
			if(endPage>totalPage){
				endPage = totalPage;
				startPage = endPage-8;
			}
		}
	}
	
	@SuppressWarnings("rawtypes")
	public List getRecords() {
		return Records;
	}
	@SuppressWarnings("rawtypes")
	public void setRecords(List records) {
		Records = records;
	}
	public int getCurrentPageNum() {
		return currentPageNum;
	}
	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	
	
	
}
