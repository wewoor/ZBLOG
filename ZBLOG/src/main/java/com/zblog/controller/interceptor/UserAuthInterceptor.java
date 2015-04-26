package com.zblog.controller.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.zblog.dmo.User;
import com.zblog.service.UserService;

/**
 * 用户权限拦截
 * @author Ziv
 *
 */
public class UserAuthInterceptor extends HandlerInterceptorAdapter {

	//用户Service
	@Autowired
	protected UserService userService;
	
	@Override
    public boolean preHandle(HttpServletRequest  request,HttpServletResponse  response,
            Object handler)
    		throws Exception{
        
		User user = new User();
		if (request.getSession().getAttribute("UserID") != null) {			
			user.setId(Integer.parseInt(request.getSession().getAttribute("UserID").toString()));
			User temp = userService.getUser(user);
			if (temp != null) {
				return true;
			}
		}
		       
        response.setCharacterEncoding("utf-8");
        response.sendRedirect(request.getContextPath()+"/user/init-login.htm");
        return false;
    }

}
