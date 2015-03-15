<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理/添加新的文章</title>
	<#include "/layout/admin_head.ftl">
	<link href="${rc.contextPath}/stylesheet/back-style.css" rel="stylesheet" type="text/css" />	
    <script type="text/javascript" charset="utf-8" src="${rc.contextPath}/javascripts/back-main.js"></script>
</head>
<body style="background:none">
	<!--wrapper-->
	<div class="wrapper">
	<!--导航栏-->
	<#include "/layout/admin_nav.ftl">
	<!--操作区-->
	<div class="ope-area">
		<!--添加新的文章-->
		<div class="edit-new">
			<div class="title">
				<form class="form-search" action="${rc.contextPath}/admin/article/search.htm">
				  <input type="text" style="width:250px;" name="key" class="input-medium search-query">
				  <button type="submit" class="btn">Search</button>
				</form>
			</div>
			<!--编辑位-->			
			<div class="edit-con">
				<table class="table">
					<thead><tr><td>ID</td><td>标题</td><td>创建时间</td><td>操作</td></tr></thead>
					<tbody>
						<#if articles?exists>
						<#assign i = 1/>
						<#list articles as article>
						<tr>
							<td>${i}</td>
							<td width="500px"><a class="btn-aupd" data-id="${article.id}" title="${article.title}" href="javascript:;">${article.title}</a></td>
							<td>${article.createTime?string("yyyy年MM月dd日HH:mm")}</td>
							<td>
								<button data-id="${article.id}" data-action="delete" type="button" class="btn-adele btn btn-default btn-sm">
 								 	删除
								</button>	
								<button data-id="${article.id}" type="button" class="btn-aupd btn btn-default btn-sm">
 								 	编辑
								</button>		
							</td>
						</tr>	
						<#assign i=i+1/>	
						</#list>
						<#else>
							<p class="error">没有发现相关的文章</p>
						</#if>
					</tbody>
				</table>				
			</div>

			<!--分页 -->
		   <div class="page">
	            <#if page?exists> 
	            <form id="form" action="${rc.contextPath}/admin/articles.htm" method="post">
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
	</div>
	<!-- ope end -->
	</div>
</body>
</html>
