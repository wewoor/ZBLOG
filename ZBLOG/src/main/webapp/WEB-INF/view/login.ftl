<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>管理登陆</title>
	<#include "/layout/head.ftl">
	<script language="javascript" charset="utf-8" type="text/javascript" src="${rc.contextPath}/javascripts/front-main.js"></script>
</head>
	<body>
		<#include "/layout/front_nav.ftl">
		<!-- container ---->
		<div id="container">
			<div class="form-wrapper">
				<fieldset>
				<legend>后台登录</legend>
				<form id="form1" class="form-horizontal" method="post" action="${rc.contextPath}/user/login.htm">
				  <div class="control-group">
				    <label class="control-label" for="inputName">UserName:</label>
				    <div class="controls">
				      <input type="text" id="inputName" value="" name="name" placeholder="Name">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputPassword">Password:</label>
				    <div class="controls">
				      <input type="password" id="inputPassword" value="" name="password" placeholder="Password">
				    </div>
				  </div>
				  <div class="control-group">
				    <div class="controls">
				      <button type="submit" class="btn">Sign in</button>
				    </div>			
				  </div>
				  <div class="control-group">
				    <div class="controls">
				    	<label style="color:red;font-family:'微软雅黑';" id="message">
				    		<#if message?exists>
				    			<#if (message=="INVALID_USER")>
				    				无效的用户登录信息，请检查你的账户和密码信息。
				    			<#else>
				    				系统内部错误。
				    			</#if>
				    		</#if>
				    	</label>
				    </div>
				</form>
				</fieldset>
			</div>
		</div>
	</body>
</html>