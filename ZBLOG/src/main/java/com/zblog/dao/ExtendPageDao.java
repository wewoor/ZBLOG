package com.zblog.dao;

import java.util.List;

import com.zblog.dmo.ExtendPage;

/**
 * 扩展页面Dao
 * @author Ziv
 *
 */
public interface ExtendPageDao {
	
	/**
	 * 选择单个页面
	 * @param page
	 */
	ExtendPage selectPage(ExtendPage page);
	
	/**
	 * 选择所有页面列表
	 * @return
	 */
	List<ExtendPage> selectAllPages();
	
	/**
	 * 更新页面
	 * @param page
	 * @return
	 */
	int updatePageInfo(ExtendPage page);
	
	/**
	 * 插入页面
	 * @param page
	 * @return
	 */
	int insertPage(ExtendPage page);
	
	/**
	 * 删除页面
	 * @param page
	 * @return
	 */
	int deletePage(ExtendPage page);

}
