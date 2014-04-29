		   <!-- 搜索 -->
		   <div class="catTag">

    		</div>
	        <!-- 文章分类列表 -->
    		<div class="catTag">
    			<h5>分类></h5>
    			<ul>
    				<li><a href="${rc.contextPath}/article/list.htm">全部文章(<#if countOfAllArticles?exists>${countOfAllArticles})</#if></a></li>
    				<#if categorys?exists>
					<#list categorys as cate>
						<#if (cate.articleCount > 0)>
    					<li><a href="${rc.contextPath}/article/index.htm?cat=${cate.id}">${cate.name}(${cate.articleCount})</a></li>
						</#if>
					</#list>
					</#if>
    			</ul>
    		</div>
    		<!-- 归档列表 -->
    		<div class="hotArt">
    			<h5>归档></h5>
    			<ul>
    				<#if archives?exists>
					<#list archives as article>
    					<li><a href="${rc.contextPath}/article/search-archives.htm?time=${article.createTime?datetime}">
    						${article.createTime?string("yyyy年MM月")}(${article.count})
    					</a></li>
    				</#list>
 					</#if>
    			</ul>
    		</div>
    		<!-- 热门文章 -->
    		<div class="hotArt">
    			<h5>热门文章></h5>
    			<ul>
    				<#if hotArticles?exists>
					<#list hotArticles as article>
    					<li><a title="${article.title}" target="_blank" href="${rc.contextPath}/article/read.htm?id=${article.id}">${article.title}</a></li>
    				</#list>
 					</#if>
    			</ul>
    		</div>
    		<!-- 分类标签 -->
    		<div class="catTag">
    			<h5>标签列表></h5>
    			<ul>
    				<#if tags?exists>
					<#list tags as tag>
						<#if (tag.count > 0)>
    					<li><a href="${rc.contextPath}/article/list.htm?tagId=${tag.id}">${tag.name}(${tag.count})</a></li>
						</#if>
					</#list>
					</#if>
    			</ul>
    		</div>
    		<!-- 友情链接 -->
    		<div class="friLink">
    			<h5>友情链接></h5>
    			<ul>
    				<#if links?exists>
						<#list links as link>	
    					<li><a target="_blank" href="${link.link}">${link.name}</a></li>
						</#list>
					</#if>
    			</ul>
    		</div>