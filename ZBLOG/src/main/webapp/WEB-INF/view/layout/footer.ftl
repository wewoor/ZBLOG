<!--footer---->
<div id="footer">
	<p>
		Email：wewoor@foxmail.com
		<#if Session.UserID?exists>
			,<a href="${rc.contextPath}/admin/ucenter.htm">${Session.UserName}</a> 已登录
			,<a href="${rc.contextPath}/user/logout.htm">退出</a>
		<#else>
			,<a href="${rc.contextPath}/user/init-login.htm">登录</a>
		</#if>	
	</p>
	<p>
		Copyright © Ziv小威 2013,Design and Code by Ziv,Build in Java language.
	</p>
</div>
<script type="text/javascript" async="" src="http://www.google-analytics.com/ga.js"></script>