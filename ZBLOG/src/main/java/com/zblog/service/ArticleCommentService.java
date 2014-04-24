package com.zblog.service;

import com.zblog.dmo.ArticleComment;
import com.zblog.dto.CommentsDto;
import com.zblog.dto.Page;
import com.zblog.dto.PageResult;

/**
 * Article comment Service
 * @author Ziv
 * @version 1.0
 */
public interface ArticleCommentService {
	
	/**
	 * 添加评论
	 * @param comment
	 * @return boolean
	 */
	public boolean addComment(ArticleComment comment);
	
	/**
	 * 删除评论
	 * @param comment
	 * @return boolean
	 */	
	public boolean deleteComment(ArticleComment comment);
    
	/**
	 * 检索文章相应的评论列表
	 * @param articleId
	 * @return PageResultDto
	 */
	public PageResult<CommentsDto> getArticleComment(Integer articleId,
			Page page);

    
    /**
     * 统计某文章的评论数量
     * @param articleId
     * @return int
     */
    public int countOfArticleComments(Integer articleId);
}
