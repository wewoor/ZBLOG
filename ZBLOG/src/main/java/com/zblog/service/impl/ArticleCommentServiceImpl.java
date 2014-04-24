package com.zblog.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zblog.constants.Common;
import com.zblog.dao.ArticleCommentDao;
import com.zblog.dmo.ArticleComment;
import com.zblog.dto.CommentsDto;
import com.zblog.dto.Page;
import com.zblog.dto.PageResult;
import com.zblog.service.ArticleCommentService;

@Component
public class ArticleCommentServiceImpl implements ArticleCommentService {
	
	@Autowired
	private ArticleCommentDao articleCommentDao;
	
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
		if (page == null) {
			page = new Page();
			page.setCurrentPage(0);
			page.setPageSize(5);
		}				
		
		map.put("articleId", articleId);
		map.put("pageNo", page.getStartNum()-1);
		map.put("pageSize", page.getPageSize());
		//参数值为源评论
		map.put("fatherComm", Common.ORIGINAL_COMMENT);
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
		//统计list
		int countOfComment = articleCommentDao.countOfArticleComments(map);
		page.setTotalRows(countOfComment);
		page.repaginate();
		result.setList(comments);
		result.setPage(page);
		
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

}
