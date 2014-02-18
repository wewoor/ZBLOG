package com.zblog.service;

import java.util.List;

import com.zblog.dmo.Article;
import com.zblog.dto.Page;

public interface ArticleService {
    
    /**
     * 查询文章
     * @param article
     * @param page
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<Article> getArticles(Article article, Page page) throws Exception;
    
    /**
     * 
     * 添加文章
     * @param article
     * @return
     * @see [类、类#方法、类#成员]
     */
    public boolean addArticle(Article article) throws Exception;
    
    /**
     * 
     * 更新文章
     * @param article
     * @return
     * @see [类、类#方法、类#成员]
     */
    public boolean updateArticle(Article article) throws Exception;
}
