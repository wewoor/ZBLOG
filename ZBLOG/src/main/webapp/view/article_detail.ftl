<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,com.blog.dto.*,com.blog.tool.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><s:property value="article.articleTitle"/></title>
<link href="img/head_pic.png" type="image/png" rel="icon"></link>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	background-image: url(img/body-bg.jpg);
	background-repeat: repeat-y;
}
-->
</style>
<script language="javascript" type="text/javascript" src="js/jquery-1.8.0.js"></script>
<script type="text/javascript">
function addReadCount(id){
	$.post("article/updateReadCount?article.id="+id);	
}	
</script>
</head>

<body onload="addReadCount('<s:property value="article.id"/>')">
<div id="center_1">
  <%	
		
				Article art = (Article)session.getAttribute("thisArt");
				if(art!=null){
				
				%>
				<div id="readOneArticle">
				<h2 align="left"><%=art.getArticleTitle()%></h2>
					<%=StringToHTML.inHTML(art.getArticleContent())%>						 
				</div>
				<div class="noteInfor" style="padding-right: 30px;">
				<table><tr><td><div align="center">发布时间：<%=com.blog.tool.Time.converToString(art.getPublierTime())%></div></td>
                			<td> <div align="center">标签：<%=art.getArticleType().getNoteType()%></div></td>
                  <td> <div align="center">浏览次数：<%=art.getReadCount()%></div></td>
                  <td> <div align="center"><a href="#">评论</a></div></td>   
                 </tr></table>
  </div>
			<%}%>
</div>
<div id="bottom">
<center>
<span>© Ziv小威 2012|Powered by Ziv|Email:wewoor@foxmail.com</span><br />
<span>连接：<a href="http://42.121.108.233:8080/index.jsp">男男女女</a>|<a href="http://www.cnblogs.com/zivxiaowei/">博客园博客</a>|<a href="http://wewoor.diandian.com/">点点博客</a></span> 
</center>
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
</body>
</html>
