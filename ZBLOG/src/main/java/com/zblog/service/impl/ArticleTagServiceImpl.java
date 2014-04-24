package com.zblog.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.zblog.dao.ArticleTagDao;
import com.zblog.dmo.Article;
import com.zblog.dmo.ArticleTag;
import com.zblog.dmo.RelArticleTag;
import com.zblog.service.ArticleTagService;

@Component
public class ArticleTagServiceImpl implements ArticleTagService {
	
	@Autowired
	private ArticleTagDao articleTagDao;
	
	/**
	 * 获取所有标签
	 */
	@Override
	public List<ArticleTag> getAllTags() {		
		return articleTagDao.queryAllTags();
	}
	
	/**
	 * 获取文章标签
	 */
	@Override
	public List<ArticleTag> getArticleTags(Map<String, Object> param) {
		return articleTagDao.queryArticleTags(param);
	}
	
	/**
	 * 更新文章标签
	 */
	@Override
	public boolean updateArticleTag(ArticleTag tag) {
		
		int result = articleTagDao.updateArticleTag(tag);
		return (result>0);
	}
	
	/**
	 * 保存文章标签
	 */
	@Override
	public boolean saveArticleTag(ArticleTag tag) {
		
		int result = articleTagDao.insertTag(tag);
		return (result>0);
	}

	/**
	 * 添加文章标签
	 */
	@Override
	@Transactional
	public int saveRelArticleTag(Article article, List<Integer> tags) {
		
		int size = 0;
		if (article != null && tags.size() > 0) {
			for (int i = 0; i < tags.size() ; i++) {
				RelArticleTag rel = new RelArticleTag();
				rel.setArticleId(article.getId());
				rel.setTagId(tags.get(i));
				int count = articleTagDao.insertArticleTag(rel);
				size += count;
			}
		}	
		return size;
	}

	@Override
	public boolean deleteTag(ArticleTag tag) throws Exception {
		
		int result = articleTagDao.deleteTag(tag);
		return (result > 0);
	}

	@Override
	public boolean deleteArticleTag(RelArticleTag tags) throws Exception {		
		int result = articleTagDao.deleteArticleTag(tags);
		return (result > 0);
	}
    
    
}
