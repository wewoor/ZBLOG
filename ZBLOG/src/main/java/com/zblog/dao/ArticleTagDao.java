package com.zblog.dao;

import java.util.List;
import java.util.Map;

import com.zblog.dmo.ArticleTag;
import com.zblog.dmo.RelArticleTag;

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
     * 查询所有标签
     * @return List<ArticleTag>
     * @see [类、类#方法、类#成员]
     */
    public List<ArticleTag> queryAllTags();
    
    /**
     * 检索某文章的
     * @param param
     * @return List<ArticleTag>
     */
    public List<ArticleTag> queryArticleTags(Map<String, Object> param);
    
    /**
     * 更新文章标签
     * @param tag
     * @return int
     */
    public int updateArticleTag(ArticleTag tag);
    
    /**
     * 保存文章标签
     * @param tag
     * @return int
     */
    public int insertTag(ArticleTag tag);
    
    /**
     * 删除标签
     * @param tag
     * @return int
     */
    public int deleteTag(ArticleTag tag);
    
    /**
     * 删除文章标签
     * @param tag
     * @return int
     */
    public int deleteArticleTag(RelArticleTag tag);
    
    /**
     * 保存文章标签
     * @param tag
     * @return int
     */
    public int insertArticleTag(RelArticleTag tag);

}
