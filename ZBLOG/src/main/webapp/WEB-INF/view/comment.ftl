<#if comments?exists> 
<#assign i = 1>
<#list comments as data>
<div class="comm-li">
	<img src="${rc.contextPath}/images/header-icon.png"/>	
	<div class="comcon">
	<#if data.comment?exists>
		<span>
			<a target="_blank" href="${data.comment.blogUrl}">
				${data.comment.userName}
			</a>
			留言时间：${data.comment.createTime?string("yyyy-MM-dd HH:mm")}
			<label>
			<#if Session.UserID?exists>
			<a class="deleteCom" data-fa="${data.comment.id}" href="javascript:void(0);">删除</a>			
			</#if>
			<a class="feedback" data-user="${data.comment.userName}" data-url="${data.comment.blogUrl}" data-fa="${data.comment.id}" href="javascript:;">回复↑</a> ##{i} 
			</label>
		</span>
		<p>${data.comment.content}</p>
	</div>
	<#assign i = i+1>
	<!-- 评论回复 -->
	<#if data.feedBack?exists>
		<#list data.feedBack as com>
			<div class="feedback-content comcon">
				<span>
					<a target="_blank" href="${com.blogUrl}">
						${com.userName}
					</a>
					<#if com.feedback?exists>
					 回复 ${com.feedback}
					</#if>		
					回复时间：${com.createTime?string("yyyy-MM-dd HH:mm")}
					<label>
						 <a class="feedback" data-user="${com.userName}" data-url="${com.blogUrl}" data-fa="${data.comment.id}" href="javascript:;">回复↑</a> ##{i}					 
					</label>
				</span>
				<p>${com.content}</p>
			</div>
			<#assign i = i+1>
		</#list>
	</#if>
	</#if>
</div>

</#list>
<!--分页 -->
<div class="page">
	<!-- 分页 -->
	<#include "/layout/pagination.ftl">
	<script type="text/javascript">	
	
		$(function(){
			<#if page?exists>
				currentPage = parseInt("${page.currentPage}");	
			</#if>	
			pageSize = 8;
			//分页URL初始化
			$(".pagination ul li a").click(function(){
				if ($(this).attr("name")=="last") {
					currentPage = currentPage-1;
				} else if ($(this).attr("name")=="next"){
					currentPage = currentPage+1;					
				} else {
					currentPage = parseInt($(this).html());
				}
				var id = $("#articleId").val();
				var comment = new Comment();
				comment.loadArtiComment(id, currentPage, pageSize);
			});

			//listen feedback
			$(".content label a").click(function() {
				var fId = $(this).attr("data-fa");
				var url = $(this).attr("data-url");
				var user = $(this).attr("data-user");
				$("#fatherId").val(fId);
				var va = "<a target='_blank' href='"+url+"'>"+user+"</a>";
				$("#feedbackUser").val(va);		
				$("#inputName").focus();	
			});

		});


		//留言删除
		$(".deleteCom").click(function(){
			var _id = $(this).attr("data-fa");
			$.get(contextPath+"/comment/delete.htm",{id:_id},function(data){
				if (data == "SUCCESS") {
					alert("删除成功！");
					var comment = new Comment();
					comment.loadArtiComment($("#articleId").val(), currentPage, pageSize);
				} else {
					alert("删除失败！");
				}
			});
		});
	</script> 
</div>   
</#if>
