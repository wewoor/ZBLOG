<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
	<title>Ziv小威博客/${article.title}</title>
	<#include "/layout/head.ftl">
</head>
<!-- header ---->	
<#include "/layout/header.ftl">
<body>
	<div id="container">
		<div id="article">
			<h2 align="left">
				<a style="color:#333333" target="_blank" href="">
					${article.title}
				</a>
			</h2>
			<div>
				${article.content}
			</div>
			<div class="arInfo">			
				<ul>
					<li>发布时间：${article.createTime?datetime}</li>
					<li>浏览次数：${article.readCount}</li>
					<li><a href="#">评论()</a></li>
				</ul>
			</div>
		</div>	
		<div id="comment"></div>
	</div>

	<!---footer-->
	<#include "/layout/footer.ftl">
</body>
</html>
