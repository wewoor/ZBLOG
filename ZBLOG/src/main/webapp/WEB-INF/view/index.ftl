<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Ziv小威</title>
	<#include "/layout/head.ftl">	
</head>
<body>
	<#include "/layout/front_nav.ftl">
	<!-- container ---->
	<div id="container">
		<div class="main-left">
			<#if articles?exists>
			<#list articles as article>
			<div id="article">
				<h2 align="left">
					<a target="_blank" href="${rc.contextPath}/article/read.htm?id=${article.id}">
						${article.title}
					</a>
				</h2>
				<div class="content">
					  ${article.content?string}
				</div>
				<p>
				      <a style="font-size:12px" href="${rc.contextPath}/article/read.htm?id=${article.id}">继续阅读→</a>			
				</p>
				<div class="arInfo">	
					<ul>
						<li>写于：${article.createTime?string("yyyy年MM月dd日HH:mm")}</li>
						<li>阅读次数：${article.readCount}</li>
						<li><a href="${rc.contextPath}/article/read.htm?id=${article.id}&flag=cmt">评论(${article.commentCount})</a></li>
					</ul>
					<#if article.tags?exists && (article.tags?size>0)>
					<span>
						标签：
						<#list article.tags as tag>
							<a href="${rc.contextPath}/article/list.htm?tagId=${tag.id}">${tag.name}</a>
						</#list>
					</span>		
					</#if>
				</div>
			</div>
			</#list>
			<#else>
				<p class="error">没有发现相关的文章</p>
			</#if>
						
			<!--分页 -->
		   <div class="page">
	            <#if page??> 
	            <form id="form" action="${rc.contextPath}/article/index.htm" method="post">
	    			<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"></input>
	    			<input type="hidden" name="pageSize" id="pageSize" value="5"></input>
	    		</form>
	    		</#if>
	    		<!-- 分页 -->
	    		<#include "/layout/pagination.ftl">
	        </div>   
	        <script type="text/javascript">		
				$(function(){		
					//分页提交脚本
					$(".pagination ul li a").click(function(){
						if($(this).attr("name")=="last"){
							$("#currentPage").val(parseInt($("#currentPage").val())-1);
						}else if($(this).attr("name")=="next"){
							$("#currentPage").val(parseInt($("#currentPage").val())+1);
						}else{
							$("#currentPage").val($(this).html());
						}
						$("#form").submit();
					});
					
					$(".content").wordLimit(450);
				});
	        </script> 
    	</div>
    	<!-- 	mainLeft end -->
    	<div class="main-right">
    		<#include "/content_nav.ftl">
    	</div>
	 	<!-- 	mainRight end -->
	 	<div style="width:100%;clear:both"></div>
	</div>
	<!-- container end---->	
	<#include "/layout/footer.ftl">
	<#include "/layout/scrollTop.ftl">
</body>
</html>
