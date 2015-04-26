<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理/友情链接管理</title>
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
			<div class="edit-con">
				<table class="table">
					<thead>
						<tr><td>ID</td><td>名称</td><td>链接地址</td><td class="btn-ope">操作</td></tr>
					</thead>
					<tbody>
					<#if links?exists>
					<#assign i = 1/>
					<#list links as link>
						<tr>
							<td>${i}</td>
							<td><a id="l${link.id}" target="_blank" href="${link.link}">${link.name}</a></td>
							<td><a id='a${link.id}' href="javascript:;">${link.link}</a></td>
							<td>
								<button lId="${link.id}" type="button" class="flink-delete btn btn-default btn-sm">
 								 	删除
								</button>	
								<button 
									data-toggle="modal" lId="${link.id}" data-target="#myFlinkModal" 
									type="button" class="flink-edit btn btn-default btn-sm">
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
				<button type="button" width="150px;" class="flink-add btn btn-default btn-sm">添加新链接</button>
			</div>
		</div>
	</div>
	<!-- ope end -->
	</div>

	<!-- 友情链接操作 -->
	<div id="myFlinkModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myFlinkModalLabel" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h3 id="myFlinkModalLabel">编辑友情链接</h3>
	  </div>
	  <div class="modal-body">
	      <div class="control-group">
		    <label class="control-label" for="flinkName">链接名</label>
		    <div class="controls">
		      <input type="text" id="flinkName" placeholder="链接名称">
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="flinkAddr">链接地址</label>
		    <div class="controls">
		      <input type="text" id="flinkAddr" placeholder="链接地址">
		    </div>
		  </div>
	  </div>
	  <div class="modal-footer">
	    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
	    <button id="confrimFrlink" class="btn btn-primary">确认操作</button>
	  </div>
	</div>	
</body>
</html>
