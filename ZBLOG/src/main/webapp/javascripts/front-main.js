// JavaScript Document
//main function
$(document).ready(function() {
	var comment = new Comment();
	//设置参数
	$("#btnComm").click(function() {
		comment.addArtiComment();
	});

	//login
	$("#form1").submit(function(event) {
		
		var name = $("#inputName").val().trim();
		var password = $("#inputPassword").val().trim();
		if (name == "" || name == null) {
			$("#message").html("账号不可为空！");
			return false;
		} else if (password == "" || password == null) {
			$("#message").html("密码不可为空！");		
			return false;
		}	
		return true;
	});

});


//评论对象
function Comment() {
	
	//参数检测
	this.checkParam = function() {
		var url = $.trim(""+$("#inputBlogUrl").val());
		var con = $.trim(""+$("#inputContent").val());
		var email = $.trim(""+$("#inputEmail").val());

		if (url != "") {
			if (!checkeUrl(url)) {
			 	alert("非法的博客地址！");
			 	return false; 
			}
		}
		if (email != "") {
			if (!checkEmail(email)) {
				alert("无效的邮箱地址！");
			 	return false; 
			}
		}
		if (con == "") {
			alert("评论内容不可为空！");
			return  false;
		} 
		if (con != "") {
			var conHtm = $filterHtml(con, {
					badAttr             : [ /^on/ ] //支持正则 ( .match() )
					, whiteHrefScheme   : ['http', 'https', 'tel'] 
					, whiteSrcScheme    : ['http', 'https', 'tel'] //<form action>依赖  href="&#106;avascrip&#116;&#58;alert(1);" 
					, badStyleName      : [ 'behavior' ]  //position , left , behavior(IE下加载js文件)
					, badStyleVal       : [ 'expression' ] // 只要发现有问题的 值，则把整个 名 清空
					, badTag            : [ 'script', 'link', 'video', 'object' ] //支持 jQueyr 选择器 .className, 'form',
					   // 一定要 禁止 <link> <script>, 因为他们很危险，而且 .html() 不支持 这两个标签
					, isClearCssImport	: true //是否清理 @import "CssStyle.css";
				});
			//过滤内容
			$("#inputContent").val(conHtm);
			if (conHtm == "") {
				return false;
			}
		}
		return true;
	};

	//添加新评论
	this.addArtiComment = function() {
		var comment = new Comment();
		if (comment.checkParam()) {
			$.post(contextPath+"/comment/add.htm",$("#formCoom").serialize(), function(data) {
				if (data == "SUCCESS") {
					alert("评论成功~！");
					var comment = new Comment();
					comment.loadArtiComment($("#articleId").val(),currentPage, pageSize);
				} else if (data == "INVALIDE_URL") {
					alert("无效的博客地址"); 
				} else if (data == "FAIL") {
					alert("评论失败~！"); 
				}
			});		
		}
	};

	//加载文章评论
	this.loadArtiComment = function(id, current, size) {

		$.get(contextPath+"/comment/load.htm",{
			articleId: id,
			currentPage: current,
			pageSize:size
			},
			function(data) {
				if (data != null) {
					$(".show-comm").html(data);
				}
		});
	};
}