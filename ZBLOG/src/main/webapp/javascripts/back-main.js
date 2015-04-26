
//监听文章操作
function listenArticleEve() {
	
	//点击添加按钮
	$("#btnSb,.btn-adele").click(function() {
		//获取当前执行的操作行为
		action = $(this).attr("data-action");
		//默认执行添加操作
		reqUrl = "/admin/article/add.htm";
		var _param = {
			article : {
				title : null,
				category : null,
				content : null,
				id : null,
				deleted : null
			},
			tag : window.tags //tag list
		};
		//更新操作
		if (action !== "" && action === "update") {
			reqUrl = "/admin/article/update.htm";
		}
		//删除操作
		if (action !== "" && action === "delete") {
			_param.article.id = $(this).attr("data-id");
			_param.article.deleted = 1;
			reqUrl = "/admin/article/update.htm";
			//Ajax
			doAjax(_param);
		} else {
			_param.article.title = $.trim(''+$("#arTit").val());
			_param.article.category = parseInt($("#category").val());
			_param.article.content = $('textarea#editor1').val();
			_param.article.id = parseInt($("#arTit").attr("data-id"));
			//空值检测
			if(checkParm(_param)){
				//Ajax
				doAjax(_param);
			}
		}
	});	
	
	//发送Ajax请求
	function doAjax(_param) {
		
		$.ajax({
			url: contextPath + reqUrl,
			type: "POST",
			contentType:"application/json",
			data: JSON.stringify(_param),
			success : function (res) {
				if (res == "SUCCESS") {
					alert(msgSucc);
					window.location.replace(contextPath+"/admin/articles.htm");
				} else {
					alert("操作失败！");	
				} 
			}
		});
	}

	//参数值合法性检测
	function checkParm(_param) {
		console.log(_param.tag.length);
		//空值判断
		if (_param.article.title === "" || _param.article.title === undefined) {
			alert("文章标题不能为空");	
		} else if (_param.article.content === "" || _param.article.content === undefined) {		
			alert("文章内容不能为空");	
		} else if(_param.article.title.length > 200) {
			alert("文章标题不可超过200个字符！");
		} else {
			return true;
		}
		return false;
	}
	
	//初始化更新操作
	$(".btn-aupd").click(function() {
		var aId = parseInt($(this).attr("data-id"));
		window.location.href = contextPath + "/admin/article/init-edit.htm?id="+aId;
	});

	//点击重置按钮
	$("#btnRe").click(function() {
		$( 'textarea#editor1' ).val('');
	});					
}

//监听标签事件
//标签数组
var tags = [];
function listenTagEve() {
	var	_id = null,
		_name = "";
	$(".tag a").click(function(event) {
		_id = parseInt($(this).attr("name"));
		//检测是否有重复的标签值
		var index = tags.indexOf(_id);
		if (index == -1 ) {
			//如果在列表当中并未发现当前标签，则识别为插入
			tags.push(_id);
			$(this).addClass("tag-mark");
		} else {
			//如果列表已存在该标签的时候，当前点击则为移除
			tags.splice(index, 1);
			$(this).removeClass("tag-mark");	
		}
	});
	
	//点击更新
	$(".update").click(function() {
		//更改Url请求地址
		reqUrl = "/tag/update.htm";
		action = "update";
		$("#myModalLabel").html("编辑标签");
		_id = parseInt($(this).attr("tid"));
		_name = $("#t"+_id).html();
		$("#editName").val(_name);
	});
	
	//点击删除
	$(".delete").click(function() {
		_id = parseInt($(this).attr("tid"));
		$.post( contextPath+"/admin/tag/delete.htm",{id:_id}, function(data) {
			if (data == "SUCCESS") {			
				alert(msgSucc);
				window.location.replace(contextPath+"/admin/tags.htm");
			} else {
				alert(msgFail);
			}
		});
	});

	//点击添加
	$(".add").click(function(event) {
		//更改url请求地址
		reqUrl = "/admin/tag/add.htm";
		action = "add";
		$("#myModalLabel").html("添加新标签");
		$("#myTagModal").modal("show");
	});

	//修改文章标签
	$("#confrimTag").click(function () {
		_name = $("#editName").val();
		if (_name !== "") {
			$.post(contextPath + reqUrl, {id:_id,name:_name}, function(data) {
				if (data == "SUCCESS") {
					if (action == "update") {//如果为更新操作
						$("#t"+_id).html(_name);
						$("#myTagModal").modal("hide");
					} else {//否则此操作刷新页面
						window.location.replace(contextPath+"/admin/tags.htm");
					}
				} else {
					$(".alert").html(msgFail);
				}
			});
		} else {
			alert("标签不可为空！");
		}
	});

	//清空表单内容
	$("#myTagModal").on("hidden", function () {
		$("#editName").val("");
	});

}

//监听友情链接事件
function listenFlinkEve() {

	var _id = 0,//标签ID
		_name = "",//标签名
		_link = "";//标签地址

	//点击添加
	$(".flink-add").click(function() {
		reqUrl = "/admin/frlink/add.htm";
		action = "add";
		$("#myFlinkModal").modal("show");
	});

	//删除
	$(".flink-delete").click(function() {
		_id = $(this).attr("lId");
		$.get(contextPath + "/admin/frlink/delete.htm", {id : _id}, function(res){
			if (res == "SUCCESS") {
				alert(msgSucc);
				window.location.replace(contextPath+"/admin/frlink.htm");
			} else {
				alert(msgFail);
			}
		});
	});

	//编辑
	$(".flink-edit").click(function() {
		action = "update";
		reqUrl = "/admin/frlink/update.htm";
		_id = $(this).attr("lId");
		_name = $("#l"+_id).html();
		_link = $("#l"+_id).attr("href");
		//初始化编辑界面
		$("#flinkName").val(_name);
		$("#flinkAddr").val(_link);
	});

	//send request
	$("#confrimFrlink").click(function() {

		_name = $("#flinkName").val();
		_link = $("#flinkAddr").val();
		
		if (_name === "") {
			alert("链接名称不可为空！");
		} else if (_link === "") {
			alert("链接地址不可为空！");
		} else if (!checkeUrl(_link)) {
			alert("链接格式有误！");
		} else {

			var temp = {id : _id, name : _name,link : _link};

			$.post(contextPath+reqUrl,temp, function(data) {
				if (data == "SUCCESS") {
					if (action == "add") {
						window.location.replace(contextPath+"/admin/frlink.htm");
					} else if (action == "update") {
						$("#l"+_id).html(_name);
						$("#l"+_id).attr("href",_link);
						$("#a"+_id).html(_link);
						$("#myFlinkModal").modal("hide");
					}
				} else {
					alert(msgFail);
				}
			});
		}
	});

	//清空表单内容
	$("#myFlinkModal").on("hidden", function() {
		$("#flinkName").val("");
		$("#flinkAddr").val("");
	});
}


//监听分类事件
function listenCategory() {

	var _id = 0,//分类ID
	_name = "";//分类名
	//点击添加
	$(".ca-add").click(function(event) {
		//更改url请求地址
		reqUrl = "/admin/category/add.htm";
		action = "add";
		$("#myModalLabel").html("添加新分类");
		$("#myCateModal").modal("show");
	});

	//编辑
	$(".ca-update").click(function() {
		//更改Url请求地址
		reqUrl = "/admin/category/update.htm";
		action = "update";
		$("#myModalLabel").html("编辑分类");
		_id = parseInt($(this).attr("data-cate"));
		_name = $("#c"+_id).html();
		$("#editName").val(_name);
	});

	//执行确认操作
	$("#confrimCate").click(function () {
		_name = $("#editName").val();
		if (_name !== "") {
			$.post(contextPath + reqUrl, {id:_id,name:_name}, function(data) {
				if (data == "SUCCESS") {
					if (action == "update") {//如果为更新操作
						$("#c"+_id).html(_name);
						$("#myCateModal").modal("hide");
					} else {//否则此操作刷新页面
						window.location.replace(contextPath+"/admin/categorys.htm");
					}
				} else {
					$(".alert").html(msgFail);
				}
			});
		} else {
			alert("分类名称不可为空！");
		}
	});
}

/**
 * 监听账户管理功能
 */
function listenAccount() {
	$("#formAccount").submit(function(){
		
		// 取得表单参数，进行合法性验证
		var account = $.trim($("#account").val()),
			pwd1 = $.trim($("#pwd1").val()),
			pwd2 = $.trim($("#pwd2").val());
		
		if (account === ""){
			alert("账户名不可为空！");
			return false;
		} else if (pwd1 === "") {
			alert("密码不可为空！");
			return false;
		} else if (pwd1 !== pwd2) {
			alert("2次输入的密码不一致！");
			return false;
		} else 
			return true;
		
	});
}
// main function
$(document).ready(function() {
	// 监听文章
	listenArticleEve();
	// 监听标签事件
	listenTagEve();
	// 监听友联
	listenFlinkEve();
	// 监听分类
	listenCategory();
	// 监听账户密码管理
	listenAccount();
});
