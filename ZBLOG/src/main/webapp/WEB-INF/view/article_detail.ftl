<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<title><#if article?exists>${article.title}</#if></title>	
	<#include "/layout/head.ftl">	
	<link rel="stylesheet" href="${rc.contextPath}/highlight/styles/solarized_dark.css">
	<script language="javascript" charset="utf-8" type="text/javascript" src="${rc.contextPath}/highlight/highlight.pack.js"></script>
	<script language="javascript" charset="utf-8" type="text/javascript" src="${rc.contextPath}/javascripts/filterHtml.js"></script>
	<script language="javascript" charset="utf-8" type="text/javascript" src="${rc.contextPath}/javascripts/front-main.js"></script>
	<style type="text/css">
		.pagination {
			text-align:center;
		}
	</style>
</head>
<body>
	
	<div class="warpper">
		<!--header---->
		<#include "/layout/front_nav.ftl">
		<!-- 页面主体 -->
		<div class="main">
			<!-- 主体内容 -->
			<div class="content">	
				<#if article?exists>	
				<div class="article">
					<div class="con">
						<h2 class="con-title">
							<a target="_blank" href="javascript:;">${article.title}</a>
						</h2>
						<div class="con-txt">
							 ${article.content}
						</div>
					</div>
					<div class="info">
						<a class="date" href="#">${article.createTime?string("yyyy-MM-dd")}</a>
						<#if article.tags?exists && (article.tags?size>0)>
						<span>
							<#list article.tags as tag>
								<a href="${rc.contextPath}/article/list.htm?tagId=${tag.id}">${tag.name}</a>
							</#list>
						</span>		
						</#if>
					</div>

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
				</div>
				<#else>
					<p class="error">您查看的文章已删除或者不存在。</p>
				</#if>
				<!-- 留言板 -->
				<div id="comment">
					<form id="formCoom" class="form-horizontal">
						<fieldset>
		    			<legend>留言板</legend>
		    			<div class="com-form">
		    				<table>
		    					<tr>
		    						<td>用户名：</td>
		    						<td><input type="text" id="inputName" name="userName" placeholder="用户名/昵称"></td>
		    						<td class="tdmar"> 邮箱：</td>
		    						<td><input type="text" id="inputEmail" name="email" width="250px" placeholder="邮箱地址"></td>
		    					</tr>

		    					<tr>
		    						<td>博客地址：</td>
		    						<td><input type="text" id="inputBlogUrl" name="blogUrl" width="300px" placeholder="博客地址"></td>
		    					</tr>
		    						
		    					<tr>
		    						<td>留言内容：</td>
		    						<td style="padding-top: 8px;" colspan="3">
		    							<textarea rows="3" cols="50" id="inputContent" name="content" placeholder="留言内容"></textarea>
									</td>
		    					</tr>
		    					<tr>
		    						<td></td>
		    						<td style="padding-top: 10px;" >
		    							<input type="hidden" id="feedbackUser" name="feedback" value=""/>
								    	<input type="hidden" id="fatherId" name="fatherComm" value=""/>
								    	<input type="hidden" id="articleId" name="articleId" value="${article.id}"/>
								    	<button type="button" id="btnComm" class="btn">提交</button></p>
		    						</td>
		    					</tr>
		    				</table>
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
			</div>
			<!-- 菜单内容 -->
			<div class="menu">
				<#include "/content_nav.ftl">
			</div>
		</div>
		<!-- 底部 -->
		<#include "/layout/footer.ftl">
	</div>
</body>
</html>