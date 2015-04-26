package com.zblog.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.zblog.dao.ArticleCategoryDao;
import com.zblog.dao.ArticleCommentDao;
import com.zblog.dao.ArticleDao;
import com.zblog.dao.ArticleTagDao;
import com.zblog.dao.ExtendPageDao;
import com.zblog.dao.FriendlyLinkDao;
import com.zblog.dao.UserDao;

/**
 * 
 * 基础的Service
 * @author Ziv
 */
public class BaseService {
	
	@Autowired
	protected ArticleCategoryDao categoryDao;
	
	@Autowired
	protected ArticleCommentDao articleCommentDao;
	
    @Autowired
    protected ArticleDao articleDao;
    
	@Autowired
	protected ArticleTagDao articleTagDao;
	
	@Autowired
	protected ExtendPageDao extendPageDao;
	
	@Autowired
	protected FriendlyLinkDao friendlyLinkDao;
	
	@Autowired
	protected UserDao userDao;

}
