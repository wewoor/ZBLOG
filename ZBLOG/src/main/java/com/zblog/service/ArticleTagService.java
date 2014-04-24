package com.zblog.service;

import java.util.List;
import java.util.Map;

import com.zblog.dmo.Article;
import com.zblog.dmo.ArticleTag;
import com.zblog.dmo.RelArticleTag;

public interface ArticleTagService {
	
    /**
     * 获取所有标签
     * @return List<ArticleTag>
     * @see [类、类#方法、类#成员]
     */
    public List<ArticleTag> getAllTags()
    	throws Exception;
    
    /**
     * 获取某文章的
     * @param param
     * @return List<ArticleTag>
     */
    public List<ArticleTag> getArticleTags(Map<String, Object> param)
    		throws Exception;
    
    /**
     * 更新文章标签
     * @param tag
     * @return int
     */
    public boolean updateArticleTag(ArticleTag tag)
    		throws Exception;
    
    
    /**
     * 删除标签
     * @param tag
     * @return boolean
     */
    public boolean deleteTag(ArticleTag tag) 
    		throws Exception;
    
    /**
     * 删除文章标签
     * @param tag
     * @return boolean
     */
    public boolean deleteArticleTag(RelArticleTag tags) 
    		throws Exception;
    
    /**
     * 保存文章标签
     * @param tag
     * @return int
     */
    public boolean saveArticleTag(ArticleTag tag)
    		throws Exception;
    
    /**
     * 根据文章与标签ID列表，保存文章标签
     * @param article
     * @param tags
     * @return int
     */
    public int saveRelArticleTag(Article article, List<Integer> tags)
    	throws Exception;
}
