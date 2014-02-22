<!--footer---->
<div id="bottom">
	<span>© Ziv小威 2012|Design by Ziv|Email:wewoor@foxmail.com</span><br />
	<#if links?exists>
	<p id="friendLink">
		<span>友情链接:</span>
		<#list links as link>
		<a target="_blank" href="${link.link}">${link.name}|</a>
		</#list>
	</p>
	</#if>
</div>
<div id="share">
<div id="jiathis_style_32x32">
	<a class="jiathis_button_qzone"></a>
	<a class="jiathis_button_tsina"></a>
	<a class="jiathis_button_tqq"></a>
	<a class="jiathis_button_renren"></a>
	<a class="jiathis_button_kaixin001"></a>

	<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
	<a class="jiathis_counter_style"></a>
</div>
<script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script>
</div>