package com.zblog.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.zblog.constants.Common;
import com.zblog.dmo.Article;
import com.zblog.dmo.ArticleComment;
import com.zblog.dto.ArticleDto;
import com.zblog.dto.CommentsDto;
import com.zblog.dto.Page;
import com.zblog.dto.PageResult;
import com.zblog.service.ArticleCommentService;
import com.zblog.service.BaseService;
import com.zblog.service.EmailService;
import com.zblog.util.Configer;

@Component
public class ArticleCommentServiceImpl extends BaseService 
	implements ArticleCommentService {
	
	@Override
	public boolean addComment(ArticleComment comment) {
		//默认为0
		if (comment.getFatherComm() == null) {
			comment.setFatherComm(0);
		}
		int result = articleCommentDao.insertArticleCommment(comment);
		return (result>0);
	}

	@Override
	public boolean deleteComment(ArticleComment comment) {
		int result = articleCommentDao.deletArticleComment(comment);
		return (result>0);
	}

	/**
	 * 获取文章评论数量
	 */
	@Override
	public PageResult<CommentsDto> getArticleComment(Integer articleId,
			Page page) {
		
		PageResult<CommentsDto> result = new PageResult<CommentsDto>();
		Map<String, Object> map = new HashMap<String, Object>();
		List<CommentsDto> comments = new ArrayList<CommentsDto>();	
		
		// 设置文章ID
		map.put("articleId", articleId);
		//参数值为源评论
		map.put("fatherComm", Common.ORIGINAL_COMMENT);
		int countOfComment = articleCommentDao.countOfArticleComments(map);
		
		if (countOfComment > 0) {
		        
	        	page.setTotalRows(countOfComment);
	        	page.repaginate();
	        	
	        	map.put("pageNo", page.getStartNum()-1);
	        	map.put("pageSize", page.getPageSize());
	        	
	        	//先检索原始评论
	        	List<ArticleComment> list = articleCommentDao.getArticleComments(map);
	        	//在检索回复评论
	        	for (ArticleComment comm : list) {
	        		CommentsDto dto = new CommentsDto();
	        		//先添加当前的评论
	        		dto.setComment(comm);
	        		//如果此评论为非恢复性内容
	        		Map<String, Object> param = new HashMap<String, Object>(); 
	        		//根据fatherID获取评论列表
	        		param.put("fatherComm", comm.getId());
	        		List<ArticleComment> tempComm = articleCommentDao.getArticleComments(param);
	        		//如果数据不为空，则添加
	        		if (!tempComm.isEmpty()) dto.setFeedBack(tempComm);
	        		
	        		//添加进结果List
	        		comments.add(dto);
	        	}	      	
	        	result.setList(comments);
	        	result.setPage(page);
		 }		
		return result;
	}
	
	/**
	 * 统计文章评论
	 */
	@Override
	public int countOfArticleComments(Integer articleId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articleId", articleId);
		return articleCommentDao.countOfArticleComments(map);
	}
	
	/**
	 * 通过邮件通知给评论者
	 * @param comment
	 * @throws Exception 
	 */
	@Override
	public void notifyByEmail(ArticleComment comment, String readUrl) 
			throws Exception {
		
		ArticleDto article = articleDao.selectArticle(
				new Article(comment.getArticleId()));
		String title = "<a href=\""+readUrl+"\">"+article.getTitle()+"</a>";
		StringBuffer contentFir  = new StringBuffer(""),
					 contentSec = new StringBuffer("");
		String userName = "";
		if (comment.getUserName().isEmpty()) {
			userName = "匿名用户在你的文章";
		} else {
			if (!comment.getBlogUrl().isEmpty()) {
				userName = "<a href=\""+comment.getBlogUrl()+"\">用户:@"
						+comment.getUserName()+"</a>";
			} else {
				userName = "用户:@"+comment.getUserName();
			}
		}
		contentFir.append(userName);
		contentFir.append("在您的文章");
		contentFir.append(title);
		contentFir.append("中留下了评论！<br>内容：");
		contentFir.append(comment.getContent());
		String account = Configer.getInstance().getProperty("default_receiver");
		// 先给站长发送email通知	
		EmailService.send("博客评论", contentFir.toString(), account);
		
		// 如果是回复评论，则给原品论这发送email信息
		if (comment.getFatherComm() != null) {
			ArticleComment fathCom = articleCommentDao.getCommentById(
					comment.getFatherComm());
			contentSec.append("您在文章");
			contentSec.append(title);
			contentSec.append("中的评论有了");
			contentSec.append(userName);
			contentSec.append("的回复！<br>内容：");
			contentSec.append(comment.getContent());
			if (!fathCom.getEmail().isEmpty()) {
				EmailService.send("博客评论回复", contentSec.toString(),
						fathCom.getEmail());
			}
		}
	
	}

}
