package com.zblog.dto;

import java.util.List;

import com.zblog.dmo.ArticleComment;

/**
 * 评论数据
 * @author Ziv
 *
 */
public class CommentsDto {
	
	//源评论
	private ArticleComment comment;
	//评论回复
	private List<ArticleComment> feedBack;
	
	public ArticleComment getComment() {
		return comment;
	}
	
	public void setComment(ArticleComment comment) {
		this.comment = comment;
	}
	
	public List<ArticleComment> getFeedBack() {
		return feedBack;
	}
	
	public void setFeedBack(List<ArticleComment> feedBack) {
		this.feedBack = feedBack;
	}

}
