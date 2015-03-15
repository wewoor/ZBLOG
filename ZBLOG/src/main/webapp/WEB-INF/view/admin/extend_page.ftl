<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>页面管理</title>
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
		<div class="edit-new">
			<div class="edit-con">
				<table class="table">
					<thead>
						<tr>
							<td>ID</td><td>名称</td><td>操作</td>
						</tr>
					</thead>
					<tbody>
					<#if pages?exists>
					<#assign i = 1/>
					<#list pages as page>
						<tr>
							<td>${i}</td>
							<td><a id="t${page.id}" href="javascript:;">${page.name}</a></td>
							<td>
								<a href="${rc.contextPath}/admin/page/delete.htm?pageId=${page.id}" type="button" class="btn btn-default btn-sm">
 								 	删除
								</a>	
								<a  href="${rc.contextPath}/admin/page/init.htm?pageId=${page.id}&action=update" data-toggle="modal" type="button" 
									class="btn btn-default btn-sm">
 								 	编辑
								</a>		
							</td>
						</tr>	
						<#assign i=i+1/>
					</#list>
					</#if>
					</tbody>
				</table>				
			</div>
			<div class="edit-footer">
				<a href="${rc.contextPath}/admin/page/init.htm?action=add" width="150px;" class="add btn btn-default btn-sm">添加新页面</a>
			</div>
		</div>
	</div>
	<!-- ope end -->
	</div>
</body>
<#if message?exists>
		<script>
		<#if (message!="SUCCESS")>
			alert("操作失败！");
		<#else>		    				
			alert("操作成功！");
		</#if>
		</script>
	</#if>
</html>
