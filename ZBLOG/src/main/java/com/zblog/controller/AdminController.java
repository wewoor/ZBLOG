package com.zblog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zblog.dmo.Article;
import com.zblog.dmo.FriendlyLink;
import com.zblog.dmo.NavigatorCategory;
import com.zblog.dto.Page;
import com.zblog.service.ArticleService;
import com.zblog.service.FriendlyLinkService;
import com.zblog.service.NavigatorCategoryService;

@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {

	//导航分类service
    @Autowired
    private NavigatorCategoryService navigatorCategoryService;
	
    //文章service
    @Autowired
    private ArticleService articleService;
    
    @Autowired
    private FriendlyLinkService friendlyLinkService;
    
	/**
	 * 初始化管理页面首页
	 * @return
	 */
	@RequestMapping("/ucenter")
	public ModelAndView initAdminPage() {
		
		ModelAndView response = new ModelAndView("/admin/index");
		List<NavigatorCategory> navCates = null;
		try {
			navCates = navigatorCategoryService.getAllNavCategorys();		
		} catch (Exception e) {
			LOGGER.error("AdminController.initAdminPage()",e.getMessage());
		}
		response.addObject("navCates", navCates);
		
		return response;
		
	}
	
	/**
	 * 管理所有文章
	 * @return
	 */
	@RequestMapping("/articles")
	public ModelAndView initMageArticles(Page page, Integer cat) {
        
        ModelAndView response = new ModelAndView("/admin/articles");
        List<Article> articles = null;
		List<NavigatorCategory> navCates = null;
        Article article = null;
        
        if (page == null) {
            page = new Page();
            page.setCurrentPage(1);
            page.setTotalRows(10);
        }
        
        if (cat != null) {
            article = new Article();
            article.setCategory(cat);
        }
        
        try {
        	//获取文章
            articles = articleService.getArticles(article, page);
            //获取所有分类
			navCates = navigatorCategoryService.getAllNavCategorys();		

            if (articles != null && navCates != null) {                
                //设置page并重新分页
                page.setTotalRows(articles.size());
                page.repaginate();      
                response.addObject("articles", articles);    
                response.addObject("navCates", navCates);  
            }
        } catch (Exception e) {
           LOGGER.error("AdminController." +
           		"initMageArticles();", e.getMessage());
        }
        
        return response;		
	}
	
	/**
	 * 初始化管理页面首页
	 * @return
	 */
	@RequestMapping("/friendlylink")
	public ModelAndView initFriendlyLinkPage() {
		
		ModelAndView response = new ModelAndView("/admin/friendly_link");
        List<FriendlyLink> links = null;
		try {
            links = friendlyLinkService.getFriendlyLinks();
		} catch (Exception e) {
			LOGGER.error("AdminController.initAdminPage()",e.getMessage());
		}
		response.addObject("links", links);
		
		return response;
		
	}
	
}
