<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>文章分类管理</title>
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
		<!--文章分类管理-->
		<div class="edit-new">
			<div class="edit-con">
				<table class="table">
					<thead>
						<tr>
							<td>ID</td><td>名称</td><td>操作</td>
						</tr>
					</thead>
					<tbody>
					<#if categorys?exists>
					<#assign i = 1/>
					<#list categorys as cate>
						<tr>
							<td>${i}</td>
							<td><a id="c${cate.id}" href="javascript:;">${cate.name}</a></td>
							<td>
								<button data-cate="${cate.id}" data-toggle="modal" 
									data-target="#myCateModal" type="button" 
									class="ca-update btn btn-default btn-sm">
 								 	编辑
								</button>		
							</td>
						</tr>	
						<#assign i=i+1/>
					</#list>
					</#if>
					</tbody>
				</table>				
			</div>
			<div class="edit-footer">
				<button type="button" width="150px;" class="ca-add btn btn-default btn-sm">添加新分类</button>
			</div>
		</div>
	</div>
	<!-- ope end -->
	</div>
	
	<!-- 文章分类标签操作 -->
	<div id="myCateModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h3 id="myModalLabel">编辑标签</h3>
	  </div>
	  <div class="modal-body">
	    <input id="editName" type="text" value=""/>
	  </div>
	  <div class="modal-footer">
	    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
	    <button id="confrimCate" class="btn btn-primary">确认操作</button>
	  </div>
	</div>	
</body>
</html>
