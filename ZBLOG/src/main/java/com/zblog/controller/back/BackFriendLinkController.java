/**
 * 
 */
package com.zblog.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zblog.controller.BaseController;
import com.zblog.dmo.FriendlyLink;

/**
 * @author Ziv
 *
 */
@Controller
@RequestMapping("/admin/frlink")
public class BackFriendLinkController extends BaseController {

	
	/**
	 * 更新标签
	 * @param tag
	 * @return JSONString
	 */
	@RequestMapping("/update")
	@ResponseBody
	public String updateFlink(FriendlyLink link) {
		
		try {
			if (friendlyLinkService.updateFriendLink(link)) return SUCCESS;
		} catch (Exception e) {
			LOGGER.error("FriendLinkController.updateFlink()",e.getMessage());
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
	public String deleteFlink(FriendlyLink link) {
		
		try {
			if (friendlyLinkService.deleteFriendLink(link)) return SUCCESS;
		} catch (Exception e) {
			LOGGER.error("FriendLinkController.deleteFlink()",e.getMessage());
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
	public String addFlink(FriendlyLink link) {
		
		try {
			if (friendlyLinkService.addFriendlyLink(link)) return SUCCESS;
		} catch (Exception e) {
			LOGGER.error("FriendLinkController.addFlink()",e.getMessage());
		}
		return FAIL;
	}
	
}
