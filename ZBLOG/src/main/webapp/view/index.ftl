<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Ziv小威博客</title>
	<#include "/layout/head.ftl">
</head>
<body>
	<!-- header ---->	
	<#include "/layout/header.ftl">
	<!-- container ---->
	<div id="container">
		<#if articles?exists>
		<#list articles as article>
		<div id="article">
			<h2 align="left">
				<a style="color:#333333" target="_blank" href="${rc.contextPath}/article/read.htm?id=${article.id}">
					${article.title}
				</a>
			</h2>
			<div class="content">
				${article.content}
			</div>
			<div class="detail"><a target="_blank" href="${rc.contextPath}/article/read.htm?id=${article.id}">》》阅读全文</a></div>			
			<div class="arInfo">			
				<ul>
					<li>发布时间：${article.createTime?datetime}</li>
					<li>浏览次数：${article.readCount}</li>
					<li><a href="#">评论()</a></li>
				</ul>
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
    			<input type="hidden" name="pageSize" id="pageSize" value="10"></input>
    		</form>
    		</#if>
    		<!-- 分页 -->
    		<#include "/layout/pagination.ftl">
        </div>   
        <script type="text/javascript">		
			$(function(){		
				//分页URL初始化
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
			});
        </script> 
	</div>
	<!-- container ---->	
	<#include "/layout/footer.ftl">
</body>
</html>
