package com.zblog.dao;

import java.util.List;

import com.zblog.dmo.Article;
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
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<ArticleComment> getArticleComments(Article article);
}
