package com.zblog.dao;

import java.util.List;

import com.zblog.dmo.Article;
import com.zblog.dmo.ArticleTag;

/**
 * 
 * 文章标签
 * 
 * @author  Ziv
 * @version  [版本号, 2014-2-12]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public interface ArticleTagDao {
    
    /**
     * 根据文章查询标签
     * @param param
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<ArticleTag> getArticleTags(Article article);
}
