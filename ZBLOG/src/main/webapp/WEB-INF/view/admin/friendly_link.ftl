<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理/友情链接管理</title>
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
			<div class="edit-con">
				<table class="table">
					<thead><tr><td>ID</td><td>名称</td><td>链接地址</td><td>操作</td></tr></thead>
					<tbody>
					<#if links?exists>
					<#list links as link>
						<tr>
							<td>${link.id}</td>
							<td><a href="">${link.name}</a></td>
							<td><input type="text" value="${link.link}"/></td>
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
					</#if>
					</tbody>
				</table>				
				</table>				
			</div>
		</div>
	</div>
	<!-- ope end -->
	</div>
</body>
</html>
