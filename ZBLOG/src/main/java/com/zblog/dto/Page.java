package com.zblog.dto;

/**
 * 分页对象
 * 
 */
public class Page {

	public static final int PAGESIZE = 10;
	// 总页数
	public int totalPages;   
	// 当前页
	private int currentPage;
	// 每页显示记录数
	private int pageSize;
	// 总记录条数
	private int totalRows;
	//起始条数
	private int startNum;
	//下一页
	private int nextPage;
	//上一页
	private int previousPage;
	
	private int queryRecordSize;
	//是否有下一页
	private boolean hasNextPage;
	//是否有上一页
	private boolean hasPreviousPage;

	public Page() {
		this(0, 1, 10);
	}

	public Page(int totalRows) {
		this(totalRows, 1, 10);
	}

	public Page(int totalRows, int currentPage) {
		this(totalRows, currentPage, 10);
	}

	public Page(int totalRows, int currentPage, int pageSize) {
		this.totalPages = 0;

		this.currentPage = 1;

		this.pageSize = 0;

		this.totalRows = 0;

		this.startNum = 0;

		this.nextPage = 0;

		this.previousPage = 0;

		this.queryRecordSize = 10;

		this.hasNextPage = false;

		this.hasPreviousPage = false;

		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalRows = totalRows;

		repaginate();
	}

	public void repaginate() {
		if (this.totalRows % this.pageSize == 0) {
			this.totalPages = (this.totalRows / this.pageSize);
		} else {
			this.totalPages = (this.totalRows / this.pageSize + 1);
		}

		if (this.currentPage >= this.totalPages) {
			this.hasNextPage = false;
			this.currentPage = this.totalPages;
		} else {
			this.hasNextPage = true;
		}

		if (this.currentPage <= 1) {
			this.hasPreviousPage = false;
			this.currentPage = 1;
		} else {
			this.hasPreviousPage = true;
		}

		this.startNum = ((this.currentPage - 1) * this.pageSize + 1);

		this.nextPage = (this.currentPage + 1);

		if (this.nextPage >= this.totalPages) {
			this.nextPage = this.totalPages;
		}

		this.previousPage = (this.currentPage - 1);

		if (this.previousPage <= 1) {
			this.previousPage = 1;
		}

		if (this.queryRecordSize == 0) {
			this.queryRecordSize = this.pageSize;
		}
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPreviousPage() {
		return previousPage;
	}

	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}

	public int getQueryRecordSize() {
		return queryRecordSize;
	}

	public void setQueryRecordSize(int queryRecordSize) {
		this.queryRecordSize = queryRecordSize;
	}

	public boolean isHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}
	
	

}
