<!--footer---->
<div id="footer">
	<p>
		您是第
		<!-- GoStats JavaScript Based Code -->
		<script type="text/javascript" src="http://gostats.cn/js/counter.js"></script>
		<script type="text/javascript">_gos='monster.gostats.cn';_goa=471995;
		_got=7;_goi=3;_goz=0;_god='hosts';_gol='计数器代码';_GoStatsRun();</script>
		<noscript><a target="_blank" title="计数器代码" 
		href="http://gostats.cn"><img alt="计数器代码" 
		src="http://monster.gostats.cn/bin/count/a_471995/t_7/i_3/z_0/show_hosts/counter.png" 
		style="border-width:0" /></a></noscript>
		<!-- End GoStats JavaScript Based Code -->
		位访客,
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
<script>

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-50390715-1', 'imziv.com');
  ga('send', 'pageview');
  
  var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
  document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fcf2b4d2934c4b6724aa0caafcc7f2d51' type='text/javascript'%3E%3C/script%3E"));

</script>