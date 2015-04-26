<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台管理/账户管理</title>
	<#include "/layout/admin_head.ftl">
	<link href="${rc.contextPath}/stylesheet/back-style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" charset="utf-8" src="${rc.contextPath}/javascripts/back-main.js"></script>
    <script type="text/javascript" charset="utf-8" src="${rc.contextPath}/ckeditor/ckeditor.js"></script>
	<script src="${rc.contextPath}/ckeditor/adapters/jquery.js"></script>
</head>
<body style="background:none">
	<!--wrapper-->
	<div class="wrapper">
	<!--导航栏-->
	<#include "/layout/admin_nav.ftl">
	<!--操作区-->
	<div class="ope-area">
		<!--添加新的文章-->
		<div class="edit-new">
			<form id="formAccount" action="${rc.contextPath}/ucenter/update.htm?redirect=account" method="POST" charset="utf-8">
				<div class="title">
				<ul>
						<li>
							<label>账户名：</label>
							<input type="text" id="account" value="<#if user.name?exists>${user.name?string}</#if>" name="name"/>
						<li>
						<li>
							<label>登录密码：</label>
							<input type="password" id="pwd1" value="<#if user.password?exists>${user.password?string}</#if>" name="password"/>
						</li>
						<li>
							<label>确认密码：</label>
							<input type="password" id="pwd2" value="<#if user.password?exists>${user.password?string}</#if>" name="password1"/>
						</li>
					</ul>
					<input type="hidden" name="id" value="${Session.UserID}"/>	
					<div class="control-group">
					    <div class="controls">
					    	<label style="color:red;font-family:'微软雅黑';" id="message">
					    		<#if message?exists>
					    			<#if (message =="SUCCESS")>
					    				更新账户成功！
					    			<#else>
					    				更新账户失败！
					    			</#if>
					    		</#if>
					    	</label>
					    </div>
					</div>
					<input type="submit" value="确认修改"/>
				</div>
			</form>
		</div>
	</div>
	<!-- ope end -->
	</div>
</body>
</html>
