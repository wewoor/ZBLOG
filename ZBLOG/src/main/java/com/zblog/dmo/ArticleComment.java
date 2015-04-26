package com.zblog.dmo;

import java.util.Date;


/**
 * 
 * 文章评论
 * 
 * @author  姓名
 * @version  [版本号, 2014-2-12]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public class ArticleComment {
    
    //ID
    private Integer id;
    
    //article id
    private Integer articleId;
    
    //用户名
    private String userName;
    
    //评论内容
    private String content;
    
    //博客地址
    private String blogUrl;
    
    //创建时间
    private Date createTime;
    
    //邮箱地址
    private String email;
    
    //父级评论
    private Integer fatherComm;
    
    //回复人信息
    private String feedback;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getBlogUrl() {
        return blogUrl;
    }

    public void setBlogUrl(String blogUrl) {
        this.blogUrl = blogUrl;
    }

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getFatherComm() {
		return fatherComm;
	}

	public void setFatherComm(Integer fatherComm) {
		this.fatherComm = fatherComm;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

}
