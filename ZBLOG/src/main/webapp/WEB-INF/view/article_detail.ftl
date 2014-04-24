<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
	<#include "/layout/head.ftl">
	<title><#if article?exists>${article.title}</#if></title>
	<link rel="stylesheet" href="${rc.contextPath}/highlight/styles/solarized_dark.css">
	<script language="javascript" charset="utf-8" type="text/javascript" src="${rc.contextPath}/highlight/highlight.pack.js"></script>
	<script language="javascript" charset="utf-8" type="text/javascript" src="${rc.contextPath}/javascripts/filterHtml.js"></script>
	<script language="javascript" charset="utf-8" type="text/javascript" src="${rc.contextPath}/javascripts/front-main.js"></script>
</head>
<!-- header ---->	
<#include "/layout/front_nav.ftl">
<body>
	<div id="container">
		<div id="article">
			<#if article?exists>
			<h2 align="left">
				<a href="javascript:;">
					${article.title}
				</a>
			</h2>
			<div class="detail-content" style="height:auto;">
				${article.content}
			</div>
			<div class="arInfo">	
				<ul>
					<li>写于：${article.createTime?string("yyyy年MM月dd日HH:mm")}</li>
					<li>阅读次数：${article.readCount}</li>
					<li>评论(${article.commentCount})</li>
					<li>分享：</li>
				</ul>
				<div class="share">
					<!-- JiaThis Button BEGIN -->
					<div class="jiathis_style">
						<a class="jiathis_button_qzone"></a>
						<a class="jiathis_button_tsina"></a>
						<a class="jiathis_button_tqq"></a>
						<a class="jiathis_button_weixin"></a>
						<a class="jiathis_button_renren"></a>
						<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
						<a class="jiathis_counter_style"></a>
					</div>
					<script type="text/javascript" defer src="http://v3.jiathis.com/code/jia.js?uid=1393981802117575" charset="utf-8"></script>
					<!-- JiaThis Button END -->
				</div>
				<#if article.tags?exists>
					<span>
						标签：
						<#list article.tags as tag>
							<a href="#">${tag.name}</a>
						</#list>
					</span>		
				</#if>
			</div>
		</div>	
		
		<!-- 留言板 -->
		<div id="comment">
			<form id="formCoom" class="form-horizontal">
				<fieldset>
    			<legend>留言板</legend>
				  <div class="control-group">
				    <label class="control-label" for="inputName">用户名：</label>
				    <div class="controls">
				      <input type="text" id="inputName" name="userName" placeholder="用户名/昵称">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputBlogUrl">博客地址：</label>
				    <div class="controls">
				      <input type="text" id="inputBlogUrl" name="blogUrl" width="300px" placeholder="博客地址">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputEmail">邮箱地址：</label>
				    <div class="controls">
				      <input type="text" id="inputEmail" name="email" width="300px" placeholder="邮箱地址">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputContent">留言内容：</label>
				    <div class="controls">
				      <textarea rows="3" id="inputContent" name="content" width="300px" placeholder="留言内容"></textarea>
				    </div>
				  </div>
				  <div class="control-group">
				    <div class="controls">
				    	<input type="hidden" id="feedbackUser" name="feedback" value=""/>
				    	<input type="hidden" id="fatherId" name="fatherComm" value=""/>
				    	<input type="hidden" id="articleId" name="articleId" value="${article.id}"/>
				    	<button type="button" id="btnComm" class="btn">提交</button>
				    </div>
				  </div>
				</fieldset>
			</form>
		</div>

		<!-- 显示留言 -->
		<div class="show-comm">

		</div>
		<script type="text/javascript">
			var currentPage = 	1,
				pageSize = 8;
			var comment = new Comment();
			//load comment
			comment.loadArtiComment(${article.id}, currentPage, pageSize);
			//the page auto scroll to comment content
			var flag = "<#if flag?exists>${flag}</#if>";
			if (flag == "cmt"){
				window.scrollTo(0,$(".show-comm").offset().top);
			}
			//highlight
			hljs.configure({tabReplace: '    '}); // 4 spaces
			hljs.initHighlightingOnLoad();
		</script>
		<#else>
			<p class="warning-info">您查看的文章已删除或者不存在。</p>
		</#if>
	</div>
	<!-- container end  -->
	<!---footer-->
	<#include "/layout/footer.ftl">
	<#include "/layout/scrollTop.ftl">
</body>
</html>
