<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><#if page?exists>${page.name}</#if></title>
	<#include "/layout/head.ftl">
</head>
<body>
	<!-- header ---->	
	<#include "/layout/front_nav.ftl">
	<!-- container ---->
	<div id="container">
		<div class="show">
		<#if page?exists>
			${page.pageContent}
		</#if>
		</div>
	</div>
	<!-- container end---->	
	<!-- 	mainRight end -->
	<div style="width:100%;clear:both"></div>
	<#include "/layout/footer.ftl">
</body>
</html>
