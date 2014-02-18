<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${rc.contextPath}"></base>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Ziv小威博客</title>
	<link href="${rc.contextPath}/images/head_pic.png" type="image/png" rel="icon"></link>
	<link href="${rc.contextPath}/stylesheet/index.css" rel="stylesheet" type="text/css" />
	<link href="${rc.contextPath}/stylesheet/bootstrap.css" rel="stylesheet" type="text/css" />
	<script language="javascript" type="text/javascript" src="${rc.contextPath}/javascripts/jquery-1.8.0.js"></script>
	<script language="javascript" type="text/javascript" src="${rc.contextPath}/javascripts/bootstrap.js"></script>
	<script language="javascript" type="text/javascript" src="${rc.contextPath}/javascripts/jquery-ui-1.8.23.custom.min.js"></script>
</head>
<body>
	<!-- header ---->	
	<#include "/layout/header.ftl">
	<!-- container ---->
	<div id="container">
		<#list articles as article>
		<div id="article">
			<h2 align="left">
				<a style="color:#333333" target="_blank" href="">
					${article.title}
				</a>
			</h2>
			<p>${article.content}</p>
			<p>			
				<ul>
					<li>发布时间：${article.createTime?datetime}</li>
					<li>浏览次数：${article.readCount}</li>
					<li><a href="#">评论</a></li>
				</ul>
			</p>
		</div>	
		</#list>
		<!--分页 -->
	   <div class="page">
            <#if page??> 
            <form id="form" action="${rc.contextPath}/article/index.htm" method="post">
    			<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"></input>
    			<input type="hidden" name="pageSize" id="pageSize" value="10"></input>
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
	<!-- container ---->	
	<#include "/layout/footer.ftl">
</body>
</html>
