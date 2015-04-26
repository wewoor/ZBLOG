<div class="header">
	<h1 class="logo"><a href="${rc.contextPath}/article/index.htm">Ziv小威</a></h1>
	<!-- 菜单 -->
	<ul class="nav">
		<li>
			<a class="nav-menu" title="首页" href="${rc.contextPath}/article/index.htm">首页</a>
		</li>
		<li>
			<a class="nav-menu" title="日志列表" href="${rc.contextPath}/article/list.htm">列表</a>
		</li>
		<#if pages?exists>
    		<#list pages as page>
    		<#if page.url?exists && page.url!="">
    	     	<li><a class="nav-menu" title="${page.name}" href="${page.url}">${page.name}</a></li>            		      	
    		<#else>
         	 	<li><a class="nav-menu" title="${page.name}" href="${rc.contextPath}/view/page.htm?id=${page.id}">${page.name}</a></li>            		
    		</#if>
    		</#list>
       </#if>    
	</ul>
</div>

