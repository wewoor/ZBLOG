<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<title><#if page?exists>${page.name}</#if></title>
	<#include "/layout/head.ftl">
</head>
<body>
	
	<div class="warpper">
		<!-- header ---->	
		<#include "/layout/front_nav.ftl">
		<!-- 页面主体 -->
		<div class="main">
			<div class="context">
				<#if page?exists>
					${page.pageContent}
				</#if>
			</div>
		</div>
		<!-- 底部 -->
		<#include "/layout/footer.ftl">
	</div>
</body>
</html>