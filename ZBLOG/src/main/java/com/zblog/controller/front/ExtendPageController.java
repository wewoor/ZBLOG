package com.zblog.controller.front;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zblog.controller.BaseController;
import com.zblog.dmo.ExtendPage;

@Controller
@RequestMapping("/view")
public class ExtendPageController extends BaseController {
	
	/**
	 * 
	 * @param id
	 * @return
	 */
    @RequestMapping("/page")
    public ModelAndView getPage(int id) {
        
        ModelAndView response = new ModelAndView("/extend_page");
        ExtendPage page = null;
        List<ExtendPage> pages = null;
        try {  
        	page = extendPageService.getPage(id);   
        	pages = extendPageService.getAllPages();
        } catch (Exception e) {
            LOGGER.error("ExtendPageController.getPage();", e.getMessage());
        } 
        response.addObject("pages", pages); 
        response.addObject("page", page);    
        return response;
    }
	
}
