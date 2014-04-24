<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Ziv小威博客</title>
	<#include "/layout/head.ftl">
</head>
<body>
	<!-- header ---->	
	<#include "/layout/front_nav.ftl">
	<!-- container ---->
	<div id="container">
		<div class="main-left">

			<div id="article">
				<h3>日志列表：</h3>
				<#if articles?exists>
				<table class="table table-hover">
					<thead><tr><td>ID</td><td>标题</td><td>编写时间</td><td>访问次数</td></tr></thead>
					<tbody>
					<#assign i = 1>
					<#list articles as article>
					<tr>
						<td>${i}</td>
						<td width="550px"><a href="${rc.contextPath}/article/read.htm?id=${article.id}">${article.title}</a></td>
						<td>${article.createTime?string("yyyy年MM月dd日")}</td>
						<td>${article.readCount}</td>
					</tr>	
						<#assign i = i+1>
					</#list>
					</tbody>
				</table>
				<#else>
					<p class="error">没有发现相关的文章</p>
				</#if>
			</div>
			<!--分页 -->
		    <div class="page">
	            <#if page??> 
	            <form id="form" action="${rc.contextPath}${action}" method="post">
	    			<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"></input>
	    			<#if tagId?exists>
	    				<input type="hidden" name="tagId" id="tagId" value="${tagId}"></input>
	    			</#if>
	    			<#if catId?exists>
	    				<input type="hidden" name="cat" id="catId" value="${catId}"></input>
	    			</#if>
	    			<input type="hidden" name="pageSize" id="pageSize" value="15"></input>
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
		<!-- 	mainLeft end -->
    	<div class="main-right">
    		<#include "/content_nav.ftl">
    	</div>
    	<!-- 	mainRight end -->
    	<div style="width:100%;clear:both"></div>
	</div>
	<!-- container end---->	
	<#include "/layout/footer.ftl">
</body>
</html>
