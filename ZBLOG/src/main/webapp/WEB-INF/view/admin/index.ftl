<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理/添加新的文章</title> 
	<#include "/layout/head.ftl">
	<link href="${rc.contextPath}/stylesheet/back-style.css" rel="stylesheet" type="text/css" />	
    <script type="text/javascript" charset="utf-8" src="${rc.contextPath}/javascripts/back-main.js"></script>
    <script type="text/javascript" charset="utf-8" src="${rc.contextPath}/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" charset="utf-8" src="${rc.contextPath}/ckeditor/adapters/jquery.js"></script>
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
			<form id="new-ar">
				<div class="title">
				<ul>
						<li>
							<label>选择文章分类：</label>
							<select id="category" name="category">
								<#if artCates?exists>
								<#list artCates as cate>
									<option value="${cate.id}">${cate.name}</option>
								</#list>
								</#if>
							</select>
						<li>
						<li>
							<label>请输入标题：</label>
							<input type="text" id="arTit" name="title"/>
						</li>
					</ul>
				</div>
				<div class="edit-con">
					<textarea name="editor1" id="editor1" rows="50" cols="150">
					</textarea>
            		<script type="text/javascript" charset="utf-8">
			               	$( document ).ready( function() {
								$( 'textarea#editor1' ).ckeditor();
								$( '#editable' ).ckeditor();
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
						<input id="btnRe" data-action="add" type="reset" value="重置"/>	
						<input id="btnSb" type="button" value="确认发布"/>		
					</p>					
				</div>
			</form>
		</div>
	</div>
	<!-- ope end -->
	</div>
</body>
</html>
