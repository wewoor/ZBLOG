package com.zblog.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zblog.controller.BaseController;
import com.zblog.dmo.ExtendPage;
import com.zblog.dmo.User;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	
	
	/**
	 * 初始化登录页面
	 * @return ModelAndView
	 */
	@RequestMapping("/init-login")
	public ModelAndView initLoginPage() {
        //其他页面
        List<ExtendPage> pages = extendPageService.getAllPages();
		return new ModelAndView("/login").addObject("pages", pages); 
	}
	
	/**
	 * 管理登录
	 * @param user
	 * @return ModelAndView
	 */
    @RequestMapping(method = RequestMethod.POST, value = "/login")
	public ModelAndView login(String name, String password, 
			HttpServletRequest request) {
        
    	ModelAndView res = new ModelAndView("/login");
        try {  
        	User user = new User();
        	user.setName(name);;
        	user.setPassword(password);
        	user = userService.getUser(user);
        	
        	if (user != null) {//登录成功
        		request.getSession().setAttribute("UserID", user.getId());
        		request.getSession().setAttribute("UserName", user.getName());
        		return new ModelAndView("redirect:/admin/ucenter.htm");
        	} else {//登录失败
        		res.addObject("message", INVALID_USER);
        	}
        } catch (Exception e) {
                LOGGER.error("UserController.login();", e.getMessage());
                res.addObject("message", ERROR);
        }
        //返回FAIL
    	return res;
	}
    
	/**
	 * 管理退出
	 * @return ModelAndView
	 */
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		request.getSession().removeAttribute("UserID");
		request.getSession().removeAttribute("UserName");
		return new ModelAndView("redirect:/article/index.htm");
	}
	
}
