package com.zblog.controller.front;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zblog.controller.BaseController;


@Controller
@RequestMapping("/static")
public class StaticPage extends BaseController {
	
	/**
	 * 初始化登陆界面
	 * @return ModelAndView
	 */
	@RequestMapping("/login")
	public ModelAndView initLogin() {
		return new ModelAndView("/admin/login");
	}
}
