<div class="head-pic">
	<form id="fsearch" action="${rc.contextPath}/article/search.htm" method="get">
		<input type="text" name="q" class="txt" value="搜索" onfocus="if(this.value=='搜索'){this.value='';}" onblur="if(this.value==''){this.value='搜索';}">
	</form>
</div>
<div class="list">
	<h5>分类</h5>
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

<div class="list">
	<h5>归档</h5>
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

<div class="list">
	<h5>热门文章</h5>
	<ul>
		<#if hotArticles?exists>
		<#list hotArticles as article>
			<li><a title="${article.title}" target="_blank" href="${rc.contextPath}/article/read.htm?id=${article.id}">${article.title}</a></li>
		</#list>
		</#if>
	</ul>
</div>

<div class="list">
	<h5>标签列表</h5>
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

<div class="list">
	<h5>友情链接</h5>
	<ul>
		<#if links?exists>
			<#list links as link>	
			<li><a target="_blank" href="${link.link}">${link.name}</a></li>
			</#list>
		</#if>
	</ul>
</div>						