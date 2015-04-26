<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<title>日志列表</title>
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
				<div class="tab">
					<h3 class="con-title">
						<#if label?exists>${label}<#else>日志列表：</#if>
					</h3>
					<#if articles?exists>
					<table class="table table-hover">
						<thead><tr><td>标题</td><td>编写时间</td><td>访问次数</td></tr></thead>
						<tbody>
						<#list articles as article>
						<tr>
							<td width="500px"><a href="${rc.contextPath}/article/read.htm?id=${article.id}">${article.title}</a></td>
							<td>${article.createTime?string("yyyy-MM-dd")}</td>
							<td class="align-cen">${article.readCount}</td>
						</tr>	
						</#list>
						</tbody>
					</table>
					<#else>
						<p class="error">没有发现相关的文章</p>
					</#if>
				</div>

				<!--分页 -->
			    <div class="page mart">
		            <#if page?exists> 
		            <form id="form" action="${rc.contextPath}${action}" method="post">
		    			<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"></input>
		    			<#if tagId?exists>
		    				<input type="hidden" name="tagId" id="tagId" value="${tagId}"></input>
		    			</#if>
		    			<#if catId?exists>
		    				<input type="hidden" name="cat" id="catId" value="${catId}"></input>
		    			</#if>
		    			<input type="hidden" name="pageSize" id="pageSize" value="15"></input>
		    		</form>
		    		</#if>
		    		<!-- 分页 -->
		    		<#include "/layout/pagination.ftl">
		        </div>   
		        <script type="text/javascript">		
					$(function(){		
						//分页URL初始化
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
	</div>
</body>
</html>