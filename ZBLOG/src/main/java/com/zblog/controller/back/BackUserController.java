package com.zblog.controller.back;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zblog.controller.BaseController;
import com.zblog.dmo.User;

@Controller
@RequestMapping("/ucenter")
public class BackUserController extends BaseController {
  	

	/**
	 * 用户信息
	 * @return
	 */
	@RequestMapping("/userInfo")
	public ModelAndView initUserInfoPage(HttpServletRequest request) {
		
		ModelAndView response = new ModelAndView("/admin/userInfo");
		//文章标签
		User user = new User();
		user.setId(Integer.parseInt(request.getSession().getAttribute("UserID").toString()));
		try {
			user = userService.getUser(user);
		} catch (Exception e) {
			LOGGER.error("BackUserController.initArticleTagsPage()",e.getMessage());
		}
		response.addObject("user", user);	
		return response;	
	}
	
    /**
     * 
     * 更新用户资料
     * @return
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping("/update")
    public ModelAndView updateUserInfo(User user) {
        
    	ModelAndView response = new ModelAndView("/admin/userInfo");
        try {  
            //参数正常
            if (user != null) {
                //如果更新成功,返回SUCCESS
                if (userService.updateUser(user)) { 
                	response.addObject("message", SUCCESS);
                }   
            }        
        } catch (Exception e) {
                LOGGER.error("BackUserController.updateUserInfo()",e.getMessage());
        }
        //返回FAIL
    	response.addObject("user", user);	
     	response.addObject("message", FAIL);
    	return response; 
    }

}
