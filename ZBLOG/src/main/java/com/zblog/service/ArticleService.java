package com.zblog.service;

import java.util.List;

import com.zblog.dmo.Article;
import com.zblog.dto.ArticleDto;
import com.zblog.dto.Page;
import com.zblog.dto.PageResult;

public interface ArticleService {
    
    /**
     * 查询文章
     * @param article
     * @param page
     * @return
     * @see [类、类#方法、类#成员]
     */
    public PageResult<ArticleDto> getArticles(Article article, Page page)
    		throws Exception;
   
    /**
     * 获取所有文章的数量
     * @return
     * @throws Exception
     */
    public int getCountOfAllArticles() throws Exception;
    
    /**
     * 文章搜索
     * @param key
     * @return List<Article>
     * @throws Exception
     */
    public List<ArticleDto> searchArticle(String key)
    		throws Exception;
  
    /**
     * 获取热门文章列表
     * @return
     * @throws Exception
     */
    public List<ArticleDto> getHotArticles() throws Exception;
    
    /**
     * 获取归档文章列表，该归档文章按年月份归档
     * @return
     * @throws Exception
     */
    public List<ArticleDto> getArchiveByTime() throws Exception;
    
    /**
     * 按文章标签分类检索文章列表
     * @param page 分页对象
     * @param tagId 标签ID
     * @return PageResult<ArticleDto>
     * @throws Exception
     */
    public PageResult<ArticleDto> getArticlesByTag(Page page,Integer tagId)
    		throws Exception;
    
    /**
     * 检索检索当月文章列表
     * @param dateTime
     * @param timeType 根据时间类型，例如year则按年，mouth,day等
     * @return
     * @throws Exception
     */
    public List<ArticleDto> getArticlesByTime(String dateTime, String timeType) 
    		throws Exception;
    
    /**
     * 
     * 获取某一篇文章
     * @param article
     * @return
     * @throws Exception
     * @see [类、类#方法、类#成员]
     */
    public ArticleDto getArticle(Article article) throws Exception;
    
    /**
     * 
     * 添加文章
     * @param ArticleDto
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
