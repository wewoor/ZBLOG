<!--header---->
<div class="nav-wrapper">
    <div id="top">
        <div class="logo"><a href="${rc.contextPath}/article/index.htm"><img src="${rc.contextPath}/images/z_logo.png"/></a></div>
        <div class="nav">
        	<ul>
            	<li><a rel="tooltip" title="首页" href="${rc.contextPath}/article/index.htm">首页</a></li>    	
            	<li><a rel="tooltip" title="日志列表" href="${rc.contextPath}/article/list.htm">日志列表</a></li>
            	<#if pages?exists>
            		<#list pages as page>
            		<#if page.url?exists && page.url!="">
            	     	<li><a rel="tooltip" title="${page.name}" href="${page.url}">${page.name}</a></li>            		      	
            		<#else>
                 	 	<li><a rel="tooltip" title="${page.name}" href="${rc.contextPath}/view/page.htm?id=${page.id}">${page.name}</a></li>            		
            		</#if>
            		</#list>
            	</#if>         
            </ul>
        </div>
    </div>
</div>
