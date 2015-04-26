package com.zblog.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.zblog.dmo.ArticleCategory;
import com.zblog.dto.ArticleCategoryDto;
import com.zblog.service.ArticleCategoryService;
import com.zblog.service.BaseService;
@Component
public class ArticleCategoryServiceImpl extends BaseService 
	implements ArticleCategoryService {

	/**
	 * 获取所有的文章分类
	 */
	@Override
	public List<ArticleCategory> getAllArtiCategorys() {		
		return categoryDao.selectArticleCategorys();
	}
	
	/**
	 * 带文章统计的分类列表
	 */
	@Override
	public List<ArticleCategoryDto> getArtCatesAndCount() {
		return categoryDao.selectArtCatesAndCount();
	}
	
	/**
	 * 添加分类
	 */
	@Override
	public boolean addCategory(ArticleCategory category) {
		int result = categoryDao.insertCategory(category);
		return result>0;
	}

	/**
	 * 删除分类
	 */
	@Override
	public boolean deleteCategory(ArticleCategory category) {
		int result = categoryDao.deleteCategory(category);
		return result>0;
	}

	/**
	 * 更新分类
	 */
	@Override
	public boolean updateCategory(ArticleCategory category) {
		int result = categoryDao.updateCategory(category);
		return result>0;
	}
}
