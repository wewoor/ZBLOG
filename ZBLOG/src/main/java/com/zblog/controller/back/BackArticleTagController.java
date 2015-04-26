/**
 * 
 */
package com.zblog.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zblog.controller.BaseController;
import com.zblog.dmo.ArticleTag;

/**
 * @author Ziv
 *
 */
@Controller
@RequestMapping("/admin/tag")
public class BackArticleTagController extends BaseController {
		
	/**
	 * 更新标签
	 * @param tag
	 * @return JSONString
	 */
	@RequestMapping("/update")
	@ResponseBody
	public String updateTag(ArticleTag tag) {
		
		try {
			if (articleTagService.updateArticleTag(tag)) {
				return SUCCESS;
			}
		} catch (Exception e) {
			LOGGER.error("ArticleTagController.updateTag()",e.getMessage());
		}
		return FAIL;
	}
	
	/**
	 * 删除标签
	 * @param tag
	 * @return JSONString
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteTag(ArticleTag tag) {
		
		try {
			if (articleTagService.deleteTag(tag)) {
				return SUCCESS;
			}
		} catch (Exception e) {
			LOGGER.error("ArticleTagController.deleteTag()",e.getMessage());
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
	public String addTag(ArticleTag tag) {
		
		try {
			if (articleTagService.saveArticleTag(tag)) {
				return SUCCESS;
			}
		} catch (Exception e) {
			LOGGER.error("ArticleTagController.addTag()",e.getMessage());
		}
		return FAIL;
	}
}
