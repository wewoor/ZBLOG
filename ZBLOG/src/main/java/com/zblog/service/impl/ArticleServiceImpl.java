package com.zblog.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.zblog.dao.ArticleDao;
import com.zblog.dao.ArticleTagDao;
import com.zblog.dmo.Article;
import com.zblog.dmo.ArticleTag;
import com.zblog.dto.ArticleDto;
import com.zblog.dto.Page;
import com.zblog.dto.PageResult;
import com.zblog.service.ArticleService;

@Component
public class ArticleServiceImpl implements ArticleService {
    
    @Autowired
    private ArticleDao articleDao;
    
	@Autowired
	private ArticleTagDao articleTagDao;
    
    /**
     * 获取文章
     * 重载方法
     * @param article
     * @param page
     * @return
     * @throws Exception
     */
    @Override
    public PageResult<ArticleDto> getArticles(Article article, Page page) 
    		throws Exception {
        
    	PageResult<ArticleDto> result = new PageResult<ArticleDto>();
        Map<String, Object> param = new HashMap<String, Object>();

        //设置文章参数
        if (article != null) {
            param.put("id", article.getId());
            param.put("title", article.getTitle());
            param.put("content", article.getContent());
            param.put("category", article.getCategory());
            param.put("createTime", article.getCreateTime());            
        }
               
        int totalRows = articleDao.countOfArticles(param);
        
        if (totalRows > 0) {
        
        	page.setTotalRows(totalRows);
        	page.repaginate();       	
        	//设置分页参数
        	param.put("pageNo", page.getStartNum()-1);
        	param.put("pageSize", page.getPageSize());
 
        	List<ArticleDto> articles = articleDao.selectArticles(param);     
        	//获取文章标签
        	if (articles != null) {
        		for (ArticleDto art : articles) {
        			param.put("articleId", art.getId());
        			List<ArticleTag> tags = articleTagDao.queryArticleTags(param);
        			if (tags != null) {
        				art.setTags(tags);
        			}
        		}
        	}
        	page.repaginate();
        	result.setPage(page);
        	result.setList(articles);
        }
        
        return result;
    }
    
    /**
     * 添加文章
     * 重载方法
     * @param article
     * @return
     * @throws Exception
     */
    @Override
	@Transactional
    public boolean addArticle(Article article)
        throws Exception {
    	//添加文章
        int result = articleDao.addArticle(article);       
        return (result > 0) ;
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
        return (result > 0);
    }
    
    /**
     * 
     * 重载方法
     * @param article
     * @return
     * @throws Exception
     */
    @Override
    public ArticleDto getArticle(Article article)
        throws Exception {   
    	
    	ArticleDto art = articleDao.selectArticle(article);
        Map<String, Object> param = new HashMap<String, Object>();
		param.put("articleId", art.getId());
		List<ArticleTag> tags = articleTagDao.queryArticleTags(param);
		if (tags != null) {
			art.setTags(tags);
		}
    	
        return art;
    }
    
    /**
     * 获取热门文章列表
     */
	@Override
	public List<ArticleDto> getHotArticles() throws Exception {
		return articleDao.selectHotArticles();
	}
	
	/**
	 * 获取归档列表
	 */
	@Override
	public List<ArticleDto> getArchiveByTime() throws Exception {
		return articleDao.selectArchiveByTime();
	}
	
	/**
	 * 根据时间段获取文章
	 */
	@Override
	public List<ArticleDto> getArticlesByTime(String dateTime, String timeType)
			throws Exception {
		
        Map<String, Object> param = new HashMap<String, Object>();
		param.put("time", dateTime);
		param.put("type", timeType);
		return articleDao.selectArticlesByTime(param);
	}
	
	/**
	 * 通过标签检索文章
	 */
	@Override
	public PageResult<ArticleDto> getArticlesByTag(Page page, Integer tagId)
			throws Exception {
		
    	PageResult<ArticleDto> result = new PageResult<ArticleDto>();
        Map<String, Object> param = new HashMap<String, Object>();
        List<ArticleDto> data = null;
        param.put("tagId", tagId);
        int totalRows = articleDao.countOfArticleByTag(param);
        
        if (totalRows > 0) {
        
        	page.setTotalRows(totalRows);
        	page.repaginate();
        	
        	//设置分页参数
        	param.put("pageNo", page.getStartNum()-1);
        	param.put("pageSize", page.getPageSize());
        	data = articleDao.selectArticlesByTag(param);
        	result.setPage(page);
        	result.setList(data);
        }
		return result;
	}

	@Override
	public int getCountOfAllArticles() throws Exception {
		return articleDao.countOfArticles(null);
	}
	
	/**
	 * 用key去匹配名称和ID
	 */
	@Override
	public List<ArticleDto> searchArticle(String key) throws Exception {
		
        Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", key);
		param.put("name", "%"+key+"%");
		return articleDao.searchArticle(param);
	}
    
}
