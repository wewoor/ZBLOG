<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>Ziv小威 - Java程序员</title>
<#include "/layout/head.ftl">	
</head>
<body>
	<div class="warpper">
		<!--header---->
		<#include "/layout/front_nav.ftl">
		<!-- 页面主体 -->
		<div class="main">
			<!-- 主体内容 -->
			<div class="content">
				<#if articles?exists>
				<#list articles as article>			
				<div class="article">
					<div class="con">
						<h2 class="con-title">
							<a target="_blank" href="${rc.contextPath}/article/read.htm?id=${article.id}">
								${article.title}
							</a>
						</h2>
						<div class="con-txt">
							 ${article.content?string}
						</div>
						<script type="text/javascript">$(".con-txt").wordLimit(450);</script>
					</div>
					<div class="info">
						<a class="date" href="#">${article.createTime?string("yyyy-MM-dd")}</a>
						<a class="date" href="javascript:;">浏览:${article.readCount}</a>
						<a class="date"  href="${rc.contextPath}/article/read.htm?id=${article.id}&flag=cmt">评论(${article.commentCount})</a>
						<#if article.tags?exists && (article.tags?size>0)>
						<span>
							<#list article.tags as tag>
								<a href="${rc.contextPath}/article/list.htm?tagId=${tag.id}">${tag.name}</a>
							</#list>
						</span>		
						</#if>
					</div>
				</div>
				</#list>
				<#else>
					<p class="error">没有发现相关的文章</p>
				</#if>
				<!--分页 -->
			   <div class="page">
		            <#if page?exists> 
		            <form id="form" action="${rc.contextPath}/article/index.htm" method="post">
		    			<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"></input>
		    			<input type="hidden" name="pageSize" id="pageSize" value="5"></input>
		    		</form>
		    		</#if>
		    		<!-- 分页 -->
		    		<#include "/layout/pagination.ftl">
		        </div>   
		        <script type="text/javascript">		
					$(function(){		
						//分页提交脚本
						$(".pagination ul li a").click(function(){
							if($(this).attr("name")=="last"){
								$("#currentPage").val(parseInt($("#currentPage").val())-1);
							}else if($(this).attr("name")=="next"){
								$("#currentPage").val(parseInt($("#currentPage").val())+1);
							}else{
								$("#currentPage").val($(this).html());
							}
							$("#form").submit();
						});
					});
		        </script> 
			</div>
			<!-- 菜单内容 -->
			<div class="menu">
				<#include "/content_nav.ftl">
			</div>
		</div>
	
		<!-- 底部 -->
		<#include "/layout/footer.ftl">
		<#include "/layout/scrollTop.ftl">
	</div>
</body>
</html>