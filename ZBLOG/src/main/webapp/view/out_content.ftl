<%@ page language="java" import="java.util.*,com.blog.dto.*,com.blog.tool.*" pageEncoding="utf-8"%>

<%	
	
		@SuppressWarnings("unchecked")
		ArrayList<Article> list = (ArrayList<Article>)session.getAttribute("arts");

		if(list!=null){
			
			for(int i = 0; i < list.size(); i++){
				
				Article art = list.get(i);
								
					String content=art.getArticleContent();
					if(content.length()>700)
						content = content.substring(0,700);			
					content=StringToHTML.inHTML(content);
				%>
				<div id="show_article" class="art<%=i%>">
				<h2 align="left"><a style="color:#333333" target="_blank" href="article/getArticleById?article.id=<%=art.getId()%>"><%=art.getArticleTitle()%></a></h2>
				<%=content%>
				</div>			 
				<div class="noteInfor">
				<table><tr>
				 <td><div align="center">发布时间：<%=com.blog.tool.Time.converToString(art.getPublierTime())%></div></td>
                 <td> <div align="center">标签：<%=art.getArticleType().getNoteType()%></div></td>
                 <td> <div align="center">浏览次数：<%=art.getReadCount()%></div></td>
                 <td><div align="center"><a style="display:none" href="#"> 评论</a></div></td>
                 </tr></table>
                 
				</div>	
				<%	
			}			
		}
 %>
