package com.zblog.dto;

import java.util.List;

/**
 * 分页数据DTO
 * 对象分页结果
 * @author Ziv
 * @param <E>
 */
public class PageResult<E> {
	
	//分页 对象
	private Page page;
	
	//分页数据
	private List<E> list;

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}
}
