<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理/添加新的文章</title>
	<#include "/layout/admin_head.ftl">
	<link href="${rc.contextPath}/stylesheet/back-style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" charset="utf-8" src="${rc.contextPath}/javascripts/back-main.js"></script>
    <script type="text/javascript" charset="utf-8" src="${rc.contextPath}/ckeditor/ckeditor.js"></script>
	<script src="${rc.contextPath}/ckeditor/adapters/jquery.js"></script>
</head>
<body>
	<!--wrapper-->
	<div class="wrapper">
	<!--导航栏-->
	<#include "/layout/admin_nav.ftl">
	<!--操作区-->
	<div class="ope-area">
		<!--添加新的文章-->
		<div class="edit-new">
			<!-- 编辑文章 -->
			<form id="new-ar">
				<div class="title">
					<ul>
						<li>
							<label>请选择页面</label>
							<select id="category" name="category">
								<#if artCates?exists>
								<#list artCates as cate>
									<option value="${cate.id}">${cate.name}</option>
								</#list>
								</#if>
							</select>
						<li>
						<li>
							<label>文章分类</label>
							<input type="text" data-id="${article.id}" value="${article.title}" id="arTit" name="title"/>
						</li>
					</ul> 
				</div>
				<div class="edit-con">
					<textarea name="editor1" id="editor1" rows="50" cols="150">
						${article.content?html}
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
							<a href="javascript:;" id="tag${tag.id}" name="${tag.id}">${tag.name}</a>
						</#list>
						</#if>	
					</p>	
					<p>
						<input id="btnRe" type="reset" value="重置"/>	
						<input id="btnSb" data-action="update" type="button" value="确认发布"/>	
					</p>					
				</div>
			</form>
		</div>
	</div>
	<!-- ope end -->
	</div>
</body>
<script type="text/javascript">
	var jsonArr = ${tagJson?string};
	$.each(jsonArr, function(index) {
		//给标签列表赋值
		tags.push(parseInt(jsonArr[index].id));
		//添加样式
		$("#tag"+jsonArr[index].id).addClass("tag-mark");
	});
</script>
</html>