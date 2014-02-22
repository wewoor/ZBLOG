<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理/添加新的文章</title>
	<#include "/layout/head.ftl">
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
				按所属分类浏览：
				<select id="artiCat">
					<#if navCates?exists>
					<#list navCates as navCates>
						<option value="${navCates.id}">${navCates.name}</option>
					</#list>
					</#if>
				</select>
			</div>
			<!--编辑位-->
			<div class="edit-con">
				<table class="table">
					<thead><tr><td>ID</td><td>标题</td><td>创建时间</td><td>操作</td></tr></thead>
					<tbody>
						<#if articles?exists>
						<#list articles as article>
						<tr>
							<td>${article.id}</td>
							<td><a href="">${article.title}</a></td>
							<td>${article.createTime?datetime}</td>
							<td>
								<button type="button" class="btn btn-default btn-sm">
 								 	删除
								</button>	
								<button type="button" class="btn btn-default btn-sm">
 								 	编辑
								</button>		
							</td>
						</tr>	
						</#list>
						<#else>
							<p class="error">没有发现相关的文章</p>
						</#if>
					</tbody>
				</table>				
			</div>

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
	</div>
	<!-- ope end -->
	</div>
</body>
</html>
