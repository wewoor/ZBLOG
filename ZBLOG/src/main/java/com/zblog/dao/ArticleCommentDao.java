package com.zblog.dao;

import java.util.List;
import java.util.Map;

import com.zblog.dmo.ArticleComment;

/**
 * 
 * 文章评论
 * 
 * @author  Ziv
 * @version  [版本号, 2014-2-12]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public interface ArticleCommentDao {
    
    /**
     * 查询某文章的评论信息
     * @param param
     * @return List<ArticleComment>
     * @see [类、类#方法、类#成员]
     */
    public List<ArticleComment> getArticleComments(Map<String, Object> param);
    
    /**
     * 添加文章评论
     * @param comment
     * @return int
     */
    public int insertArticleCommment(ArticleComment comment);
    
    /**
     * 删除文章评论
     * @param comment
     * @return int
     */
    public int deletArticleComment(ArticleComment comment);
    
    /**
     * 统计某文章的评论数量
     * @param articleId
     * @return int
     */
    public int countOfArticleComments(Map<String, Object> param);
    
}
