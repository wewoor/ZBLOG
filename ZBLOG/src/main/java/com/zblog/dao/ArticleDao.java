package com.zblog.dao;

import java.util.List;
import java.util.Map;

import com.zblog.dmo.Article;
import com.zblog.dto.ArticleDto;

public interface ArticleDao {
    
    /**
     * 根据文章字段检索文章，带分页
     * @param param 封装了PageSize,PageNum，Article对象
     * @return List<ArticleDto>
     * @see [类、类#方法、类#成员]
     */
    public List<ArticleDto> selectArticles(Map<String,Object> param)
    		throws Exception;
    
    
    /**
     * 文章搜索
     * @param key
     * @return List<Article>
     * @throws Exception
     */
    public List<ArticleDto> searchArticle(Map<String, Object> param)
    		throws Exception;
    
    /**
     * 获取热门文章列表
     * @return
     * @throws Exception
     */
    public List<ArticleDto> selectHotArticles() throws Exception;
    
    /**
     * 按文章标签分类检索文章列表
     * @param param 封装了PageSize,PageNum，tagId属性
     * @return List<ArticleDto>
     * @throws Exception
     */
    public List<ArticleDto> selectArticlesByTag(Map<String,Object> param)
    		throws Exception;

    /**
     * 按时间检索文章
     * @param param 封装了PageSize,PageNum， 时间段time
     * @throws Exception
     */
    public List<ArticleDto> selectArticlesByTime(Map<String,Object> param)
    		throws Exception;
    
    /**
     * 按时间归档文章
     * @return List<ArticleDto>
     * @throws Exception
     */
    public List<ArticleDto> selectArchiveByTime() throws Exception;
    
    
    /**
     * 根据文章字段检索文章
     * @param param
     * @return ArticleDto
     * @see [类、类#方法、类#成员]
     */
    public ArticleDto selectArticle(Article article) throws Exception;
    
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
    
    /**
     * 统计分类文章数量
     * @param param
     * @return int
     * @throws Exception
     */
    public int countOfArticles(Map<String,Object> param)
    		throws Exception;
    
    /**
     * 统计按标签检索文章列表的数量
     * @param param
     * @return int
     * @throws Exception
     */
    public int countOfArticleByTag(Map<String,Object> param)
    		throws Exception;
}
