/**
 * 
 */
package com.zblog.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zblog.controller.BaseController;
import com.zblog.dmo.ArticleComment;
import com.zblog.dto.CommentsDto;
import com.zblog.dto.Page;
import com.zblog.dto.PageResult;
import com.zblog.util.RegexpCheckUtils;


/**
 * @author Ziv
 *
 */
@Controller
@RequestMapping("/comment")
public class ArticleCommentController extends BaseController {
	
	/**
	 * 添加新的文章评论
	 * 暂时未添加邮件回复提醒
	 * @param comment
	 * @return String
	 */
	@RequestMapping("/add")
	@ResponseBody
	public String addArticleComment(ArticleComment comment, 
			HttpServletRequest request) {
		
		try {
			//如果博客地址不为空
			if(!comment.getBlogUrl().isEmpty()) {				
				if (!RegexpCheckUtils.checkWebSite(comment.getBlogUrl())) {
					return "INVALIDE_URL";
				}
			}
			//如果用户名为空，则默认为匿名
			if (comment.getUserName().isEmpty()) comment.setUserName("匿名");
			//去除内容里面的html标签元素
			comment.setContent(RegexpCheckUtils.htmlRemoveTag(comment.getContent()));
			//如果成功添加文章，则返回true
			if (articleCommentService.addComment(comment)) { 
				// 发送评论邮件
				String readUrl = request.getScheme()+"://"+
						request.getServerName()+":"+request.getServerPort()+
						request.getContextPath()+"/article/read.htm?id="+
						comment.getArticleId();
				new Email(comment, readUrl).start();				
				return "SUCCESS"; 
			}						
		} catch (Exception e) { 
            LOGGER.error("ArticleController.addArticleComment();", e.getMessage());
		}	
		return "FAIL";
	}
	
    /**
     * 
     * 获取所以的文章列表，按照时间降序排列
     * @return
     * @see [类、类#方法、类#成员]
     */
    @RequestMapping("/load")
    public ModelAndView getArticleComments(Integer articleId, Page page) {
        
        ModelAndView response = new ModelAndView("/comment");
        PageResult<CommentsDto> comments = null;
        try {  
            comments = articleCommentService.getArticleComment(articleId, page);
        } catch (Exception e) {
            LOGGER.error("ArticleController.getArticleComments();", e.getMessage());
        } 
        
        response.addObject("comments", comments.getList());   
        response.addObject("page", comments.getPage());  
        return response;
    }
    
	/**
	 * 
	 * @param tag
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteTag(ArticleComment comment) {
		
		try {
			if (articleCommentService.deleteComment(comment)) {
				return SUCCESS;
			}
		} catch (Exception e) {
			LOGGER.error("ArticleTagController.deleteTag()",e.getMessage());
		}
		return FAIL;
	}
	
	/**
	 * 发送邮件服务
	 * @author Ziv
	 */
	private class Email extends Thread {	
		
		private ArticleComment comment;
		private String readUrl;
	
		public Email(ArticleComment comment, String readUrl) {
			super();
			this.comment = comment;
			this.readUrl = readUrl;
		}

		@Override
		public void run() {
			try {
				articleCommentService.notifyByEmail(comment, readUrl);
			} catch (Exception e) {
				LOGGER.error("ArticleController.Email.send();", e.getMessage());
			}
		}		
	}
}
