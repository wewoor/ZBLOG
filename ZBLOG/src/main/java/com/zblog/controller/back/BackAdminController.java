package com.zblog.controller.back;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zblog.controller.BaseController;
import com.zblog.dmo.Article;
import com.zblog.dmo.ArticleTag;
import com.zblog.dmo.FriendlyLink;
import com.zblog.dmo.ArticleCategory;
import com.zblog.dto.ArticleDto;
import com.zblog.dto.Page;
import com.zblog.dto.PageResult;

@Controller
@RequestMapping("/admin")
public class BackAdminController extends BaseController {
    
	/**
	 * 初始化管理页面首页
	 * @return
	 */
	@RequestMapping("/ucenter")
	public ModelAndView initAdminPage() {
		
		ModelAndView response = new ModelAndView("/admin/index");
		List<ArticleCategory> artCates = null;
        //标签列表
        List<ArticleTag> tags = null;
		try {
			tags = articleTagService.getAllTags();
			artCates = articleCategoryService.getAllArtiCategorys();	
		} catch (Exception e) {
			LOGGER.error("AdminController.initAdminPage()",e.getMessage());
		}
		response.addObject("artCates", artCates);
		response.addObject("tags", tags); 
		
		return response;		
	}
	
	/**
	 * 管理所有文章
	 * @return
	 */
	@RequestMapping("/articles")
	public ModelAndView initMageArticles(Page page, Integer cat) {
        
        ModelAndView response = new ModelAndView("/admin/articles");
        PageResult<ArticleDto> data = null;
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
        	data = articleService.getArticles(article, page);	
            if (data != null) {                
                response.addObject("articles", data.getList()); 
                response.addObject("page", data.getPage());
            }
        } catch (Exception e) {
           LOGGER.error("AdminController." +
           		"initMageArticles();", e.getMessage());
        }
        
        return response;		
	}
	
	/**
	 * 初始化管理页面首页
	 * @return ModelAndView
	 */
	@RequestMapping("/frlink")
	public ModelAndView initFriendlyLinkPage() {
		
		ModelAndView response = new ModelAndView("/admin/friendly_link");
        List<FriendlyLink> links = null;
		try {
            links = friendlyLinkService.getFriendlyLinks();
		} catch (Exception e) {
			LOGGER.error("AdminController.initFriendlyLinkPage()",e.getMessage());
		}
		response.addObject("links", links);	
		return response;	
	}
	
	/**
	 * 文章标签管理页面初始化
	 * @return
	 */
	@RequestMapping("/tags")
	public ModelAndView initArticleTagsPage() {
		
		ModelAndView response = new ModelAndView("/admin/article_tags");
		//文章标签
	    List<ArticleTag> tags = null;
		try {
			tags = articleTagService.getAllTags();
		} catch (Exception e) {
			LOGGER.error("AdminController.initArticleTagsPage()",e.getMessage());
		}
		response.addObject("tags", tags);	
		return response;	
	}
	
	/**
	 * 文章分类管理页面初始化
	 * @return
	 */
	@RequestMapping("/categorys")
	public ModelAndView initArticleCatesPage() {
		
		ModelAndView response = new ModelAndView("/admin/article_categorys");
		//文章标签
	    List<ArticleCategory> categorys = null;
		try {
			categorys = articleCateService.getAllArtiCategorys();
		} catch (Exception e) {
			LOGGER.error("AdminController.initArticleTagsPage()",e.getMessage());
		}
		response.addObject("categorys", categorys);	
		return response;	
	}

}
