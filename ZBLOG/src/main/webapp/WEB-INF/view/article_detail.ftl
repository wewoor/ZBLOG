<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
	<title>Ziv小威博客/${article.title}</title>
	<#include "/layout/head.ftl">
</head>
<!-- header ---->	
<#include "/layout/front_nav.ftl">
<body>
	<div id="container">
		<div id="article">
			<h2 align="left">
				<a style="color:#333333" target="_blank" href="">
					${article.title}
				</a>
			</h2>
			<div>
				${article.content}
			</div>
			<div class="arInfo">			
				<ul>
					<li>发布时间：${article.createTime?datetime}</li>
					<li>浏览次数：${article.readCount}</li>
					<li><a href="#">评论()</a></li>
				</ul>
			</div>
		</div>	

		<!-- 留言板 -->
		<div id="comment">
			<form class="form-horizontal">
				<fieldset>
    			<legend>留言板</legend>
				  <div class="control-group">
				    <label class="control-label" for="inputName">用户名：</label>
				    <div class="controls">
				      <input type="text" id="inputName" placeholder="用户名/昵称">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputBlogUrl">博客地址：</label>
				    <div class="controls">
				      <input type="password" id="inputBlogUrl" placeholder="博客地址">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputComment">留言内容：</label>
				    <div class="controls">
				      <textarea rows="3" id="inputComment" placeholder="留言内容"></textarea>
				    </div>
				  </div>
				  <div class="control-group">
				    <div class="controls">
				      <button type="submit" class="btn">Sign in</button>
				    </div>
				  </div>
				</fieldset>
			</form>
		</div>

		<!-- 显示留言 -->
		<div class="show-comm">

		</div>
	</div>
	<!-- container end  -->
	<!---footer-->
	<#include "/layout/footer.ftl">
</body>
</html>
