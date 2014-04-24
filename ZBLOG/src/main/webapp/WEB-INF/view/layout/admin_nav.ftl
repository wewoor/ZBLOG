<!--导航栏-->
<div class="bg-nav">
	<ul class="nav nav-pills nav-stacked">                   
      <li class="">
	  	<a href="${rc.contextPath}/admin/ucenter.htm">添加新文章</a>
	  <li>
	  <li class="">
	  	<a href="${rc.contextPath}/admin/articles.htm">查看文章</a>
	  <li>  
	  <li class="">
	  	<a href="${rc.contextPath}/admin/categorys.htm">分类管理</a>
	  <li>
	  <li class="">
	  	<a href="${rc.contextPath}/admin/tags.htm">标签管理</a>
	  <li>
	  <li class="">
	  	<a href="${rc.contextPath}/admin/frlink.htm">友情链接管理</a>
	  <li>
	  <li class="">
	  	<a href="${rc.contextPath}/admin/page/list.htm">页面管理</a>
	  <li> 
	  <li class="">
	  	<a href="${rc.contextPath}/ucenter/userInfo.htm">账户管理</a>
	  <li>  
	  <li class="">
	  	<a href="${rc.contextPath}/article/index.htm">返回首页</a>
	  <li>                    
    </ul>
    <p>		
    	<#if Session.UserID?exists>
			<a href="javascript:;">${Session.UserName}</a> 已登录,
			<a href="${rc.contextPath}/user/logout.htm">退出</a>
		</#if>
	</p>
	<p>©Ziv小威 2012.Design By <a href="${rc.contextPath}/article/nav.htm">Ziv</a></p>		
</div>