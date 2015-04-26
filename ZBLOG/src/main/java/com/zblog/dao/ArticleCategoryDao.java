package com.zblog.dao;

import java.util.List;

import com.zblog.dmo.ArticleCategory;
import com.zblog.dto.ArticleCategoryDto;

/**
 * 文章分类Dao
 * 
 * @author  Ziv
 * @version  [版本号, 2014-2-12]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public interface ArticleCategoryDao {
    
    /**
     * 
     * 检索分类列表信息
     * @param user
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<ArticleCategory> selectArticleCategorys();
    
    /**
     * 
     * 检索分类列表信息并统计文章数量
     * @param user
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<ArticleCategoryDto> selectArtCatesAndCount();
    
    /**
     * 插入新分类
     * @param category
     * @return int
     */
    public int insertCategory (ArticleCategory category);
    
    /**
     * 删除分类
     * @param category
     * @return int
     */
    public int deleteCategory (ArticleCategory category);
    
    /**
     * 更新分类
     * @param category
     * @return int
     */
    public int updateCategory (ArticleCategory category);
}
