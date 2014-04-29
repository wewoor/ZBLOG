<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理/添加新的文章</title>
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
			<!-- 编辑文章 -->
			<form id="formPage" action="${rc.contextPath}<#if action?exists>${action}</#if>" method="POST" charset="utf-8">
				<div class="title">
				<ul>
						<li>
							<label>页面名称：</label>
							<input type="text" value="<#if page.name?exists>${page.name?string}</#if>" name="name"/>
						<li>
						<li>
							<label>页面链接：</label>
							<input type="text" value="<#if page.url?exists>${page.url?string}</#if>" name="url"/>
						</li>
						<li>
							<label>是否显示
							<#if page.display?exists>
								<#if page.display!=1>
									<input type="checkbox" checked value="0" name="display"/>
								<#else>
									<input type="checkbox" value="0" name="display"/>
								</#if>
							</#if>
							</label>
						</li>
					</ul>
				</div>
				<div class="edit-con">
					<label>该页内容：</label>
					<textarea name="pageContent" id="editor1" rows="50" cols="150">
						<#if page.pageContent?exists>${page.pageContent?html}</#if>
					</textarea>
            		<script type="text/javascript" charset="utf-8">
			               	$( document ).ready( function() {
								$( 'textarea#editor1' ).ckeditor();
							} );
            		</script>
					<p>
						<#if message?exists>
							<label style="color:red;font-size:16px;">
							<#if (message!="SUCCESS")>
								操作失败！
							<#else>		    				
								操作成功！
							</#if>
							</label>
						</#if>
						<input type="reset" value="重置"/>
						<input type="submit" value="确认"/>		
						<#if page.id?exists>
							<input type="hidden" name="id" value="${page.id}"/>
						</#if>
					</p>					
				</div>
			</form>
		</div>
	</div>
	<!-- ope end -->
	</div>
</body>
</html>
