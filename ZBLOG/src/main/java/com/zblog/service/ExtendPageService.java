package com.zblog.service;

import java.util.List;

import com.zblog.dmo.ExtendPage;

/**
 * 扩展页面Service
 * @author Ziv
 *
 */
public interface ExtendPageService {
	
	/**
	 * 选择单个页面
	 * @param pageId
	 */
	ExtendPage getPage(Integer pageId);
	
	/**
	 * 选择所有页面列表
	 * @return
	 */
	List<ExtendPage> getAllPages();
	
	/**
	 * 更新页面
	 * @param page
	 * @return
	 */
	boolean updatePageInfo(ExtendPage page);
	
	/**
	 * 插入页面
	 * @param page
	 * @return
	 */
	boolean addPage(ExtendPage page);
	
	/**
	 * 删除页面
	 * @param page
	 * @return
	 */
	boolean deletePage(Integer pageId);
}
