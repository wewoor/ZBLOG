package com.zblog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zblog.dao.NavigatorCategoryDao;
import com.zblog.dmo.NavigatorCategory;
import com.zblog.service.NavigatorCategoryService;
@Component
public class NavigatorCategoryServiceImpl implements NavigatorCategoryService {
	
	@Autowired
	private NavigatorCategoryDao navigatorCategoryDao;
	
	//获取所有的导航分类
	@Override
	public List<NavigatorCategory> getAllNavCategorys() {		
		return navigatorCategoryDao.getNavigatorCategorys();
	}

    
}
