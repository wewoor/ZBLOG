package com.zblog.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zblog.dao.ArticleDao;
import com.zblog.dmo.Article;
import com.zblog.dto.Page;
import com.zblog.service.ArticleService;

@Component
public class ArticleServiceImpl implements ArticleService {
    
    @Autowired
    private ArticleDao articleDao;
    
    /**
     * 获取文章
     * 重载方法
     * @param article
     * @param page
     * @return
     * @throws Exception
     */
    @Override
    public List<Article> getArticles(Article article, Page page)
        throws Exception {
                
        Map<String, Object> param = new HashMap<String, Object>();
        
        //设置文章参数
        if (article != null) {
            param.put("id", article.getId());
            param.put("title", article.getTitle());
            param.put("content", article.getContent());
            param.put("category", article.getCategory());
            param.put("createTime", article.getCreateTime());            
        }
        
        //设置分页参数
        if (page != null) {            
            param.put("pageNo", page.getStartNum()-1);
            param.put("pageSize", page.getPageSize());
        }
        
        return articleDao.getArticles(param);
    }
    
    /**
     * 添加文章
     * 重载方法
     * @param article
     * @return
     * @throws Exception
     */
    @Override
    public boolean addArticle(Article article)
        throws Exception {
        
        int result = articleDao.addArticle(article);
        if (result > 0) { return true; }
        return false;
    }
    
    /**
     * 更新文章
     * 重载方法
     * @param article
     * @return
     * @throws Exception
     */
    @Override
    public boolean updateArticle(Article article)
        throws Exception {
        
        int result = articleDao.updateArticle(article);
        if (result > 0) { return true; }
        return false;
    }
    
}
