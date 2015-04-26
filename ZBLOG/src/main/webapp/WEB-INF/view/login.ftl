<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<title>登录</title>
	<#include "/layout/head.ftl">
	<script language="javascript" charset="utf-8" type="text/javascript" src="${rc.contextPath}/javascripts/front-main.js"></script>
</head>
<body>
	
	<div class="warpper">
		<!--header---->
		<#include "/layout/front_nav.ftl">
		<!-- 页面主体 -->
		<div class="main">
			<div class="form-wrapper">
				<fieldset>
				<legend>登录</legend>
				<form id="form1" class="form-horizontal" method="post" action="${rc.contextPath}/user/login.htm">
				  <div class="control-group">
				    <label class="control-label" for="inputName">UserName:</label>
				    <div class="controls">
				      <input type="text" id="inputName" value="" name="name">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputPassword">Password:</label>
				    <div class="controls">
				      <input type="password" id="inputPassword" value="" name="password" >
				    </div>
				  </div>
				  <div class="control-group">
				    <div class="controls">
				      <button type="submit" class="btn btmar">Sign in</button>
				    </div>			
				  </div>
				  <div class="control-group">
				    <div class="controls">
				    	<label style="color:#eba3a9;" id="message">
				    		<#if message?exists>
				    			<#if (message=="INVALID_USER")>
				    				无效的用户登录信息，请检查你的账户和密码信息。
				    			<#else>
				    				系统内部错误。
				    			</#if>
				    		</#if>
				    	</label>
				    </div>
				  </div>
				</form>
				</fieldset>
			</div>
		</div>
		<!-- 底部 -->
		<#include "/layout/footer.ftl">
	</div>
</body>
</html>