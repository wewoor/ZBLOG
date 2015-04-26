package com.zblog.dto;
// default package

import java.util.Date;
import java.util.List;

import com.zblog.dmo.ArticleTag;

/**
 * 
 * Article DTO
 * 
 * @author  Ziv
 * @version  [版本号, 2014-2-12]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public class ArticleDto {

    //ID
	private Integer id;
	
	//文章内容
	private String content;
	
	//文章标题
	private String title;
	
	//文章分类
	private Integer category;
	
	//创建时间
	private Date createTime;
	
	//是否已删除
	private Integer deleted;
	
	//阅读数量
	private Integer readCount;
	
	//评论数量
	private Integer commentCount;
	
	//文章标签
	private List<ArticleTag> tags = null;
	
	//统计字段
	private Integer count;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public Integer getReadCount() {
        return readCount;
    }

    public void setReadCount(Integer readCount) {
        this.readCount = readCount;
    }

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public List<ArticleTag> getTags() {
		return tags;
	}

	public void setTags(List<ArticleTag> tags) {
		this.tags = tags;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}