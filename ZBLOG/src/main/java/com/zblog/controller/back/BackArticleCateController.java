package com.zblog.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zblog.controller.BaseController;
import com.zblog.dmo.ArticleCategory;

/**
 * 后台文章分类管理
 * @author Ziv
 *
 */
@Controller
@RequestMapping("/admin/category")
public class BackArticleCateController extends BaseController {
	
	/**
	 * 更新标签
	 * @param tag
	 * @return JSONString
	 */
	@RequestMapping("/update")
	@ResponseBody
	public String updateCategory(ArticleCategory category) {
		
		try {
			if (articleCateService.updateCategory(category)) {
				return SUCCESS;
			}
		} catch (Exception e) {
			LOGGER.error("BackArticleCateController.updateTag()",e.getMessage());
		}
		return FAIL;
	}
	
	/**
	 * 添加标签
	 * @param tag
	 * @return JSONString
	 */
	@RequestMapping("/add")
	@ResponseBody
	public String addCategory(ArticleCategory category) {
		
		try {
			if (articleCateService.addCategory(category)) {
				return SUCCESS;
			}
		} catch (Exception e) {
			LOGGER.error("BackArticleCateController.addCategory()",e.getMessage());
		}
		return FAIL;
	}
	
}
