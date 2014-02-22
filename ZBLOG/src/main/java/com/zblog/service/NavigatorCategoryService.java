package com.zblog.service;

import java.util.List;

import com.zblog.dmo.NavigatorCategory;

public interface NavigatorCategoryService {
	
	/**
	 * 获取所有的导航分类
	 * 
	 * @return List<NavigatorCategory>
	 */
	List<NavigatorCategory> getAllNavCategorys();
    
}
