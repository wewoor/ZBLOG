<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理/用户资料管理</title>
	<#include "/layout/head.ftl">
	<link href="${rc.contextPath}/stylesheet/back-style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" charset="utf-8" src="${rc.contextPath}/javascripts/back-main.js"></script>
    <script type="text/javascript" charset="utf-8" src="${rc.contextPath}/ckeditor/ckeditor.js"></script>
	<script src="${rc.contextPath}/ckeditor/adapters/jquery.js"></script>
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
			<form id="formUser" action="${rc.contextPath}/ucenter/update.htm" method="POST" charset="utf-8">
				<div class="title">
				<ul>
						<li>
							<label>显示名称：</label>
							<input type="text" value="<#if user.showName?exists>${user.showName?string}</#if>" name="showName"/>
						<li>
						<li>
							<label>邮箱：</label>
							<input type="text" value="<#if user.email?exists>${user.email?string}</#if>" name="email"/>
						</li>
						<li>
							<label>头像URL：</label>
							<input type="text" value="<#if user.image?exists>${user.image?string}</#if>" name="image"/>
						</li>
					</ul>
				</div>
				<div class="edit-con">
					<label>描述信息：</label>
					<textarea name="description" id="editor1" rows="50" cols="150">
						<#if user.description?exists>${user.description?html}</#if>
					</textarea>
            		<script type="text/javascript" charset="utf-8">
			               	$( document ).ready( function() {
								$( 'textarea#editor1' ).ckeditor();
							} );
            		</script>
					<p class="tag">
	    				<#if tags?exists>
	    				标签：
						<#list tags as tag>
	    					<a href="javascript:;" name="${tag.id}">${tag.name}</a>
						</#list>
						</#if>	
					</p>	
					<p>
						<input data-action="add" type="reset" value="重置"/>	.
						<input type="hidden" name="id" value="${Session.UserID}"/>		
						<input type="submit" value="确认发布"/>		
					</p>					
				</div>
				<div class="control-group">
				    <div class="controls">
				    	<label style="color:red;font-family:'微软雅黑';" id="message">
				    		<#if message?exists>
				    			<#if (message!="SUCCESS")>
				    				更新用户信息失败！
				    			</#if>
				    		</#if>
				    	</label>
				    </div>
				</div>
			</form>
		</div>
	</div>
	<!-- ope end -->
	</div>
</body>
</html>
