package com.zblog.dao;

import java.util.List;
import java.util.Map;

import com.zblog.dmo.Article;

public interface ArticleDao {
    
    /**
     * 根据文章字段检索文章，带分页
     * @param param
     * @return List<Article>
     * @see [类、类#方法、类#成员]
     */
    public List<Article> getArticles(Map<String,Object> param) throws Exception;
    
    /**
     * 根据文章字段检索文章
     * @param param
     * @return Article
     * @see [类、类#方法、类#成员]
     */
    public Article getArticle(Article article) throws Exception;
    
    /**
     * 
     * 添加文章
     * @param article
     * @return int
     * @see [类、类#方法、类#成员]
     */
    public int addArticle(Article article) throws Exception;
    
    /**
     * 
     * 更新文章
     * @param article
     * @return int
     * @see [类、类#方法、类#成员]
     */
    public int updateArticle(Article article) throws Exception;
}
