//获取上下文路径
var contextPath = window.location.origin+"/"+window.location.pathname.split("/")[1];
// JavaScript Document
function submitArticle() {

	//点击添加按钮
	$("#btnSb").click(function(event) {
		var _param = {
			title : $("#arTit").val(),
			category : $("#category").val(),
			content : getContent()
		};
		if (_param.title == "" || _param.title == undefined) {
			alert("文章标题不能为空");	
		} else if (_param.content == "" || _param.content == undefined) {		
			alert("文章内容不能为空");	
		} else {
			console.log(contextPath);
			$.post(contextPath+"/article/add.htm",_param,function(res){
				if (res != "") {
					if (res == "SUCCESS") {
						alert("添加成功");
					} else if (res == "ERROR") {
						alert("请检查填写内容是否为空");	
					} else if (res == "FAIL") {
						alert("添加失败");	
					}  
				}
			});		
		}
	});	

	//点击重置按钮
	$("#btnRe").click(function(event) {
		UE.getEditor('editor').setContent('', '');
	});					
}

//改变操作页面
function changeOperPage() {
	$(".bg-nav ul li a").click(function(event) {
		
	});
}



//main function
$(document).ready(function() {
	submitArticle();
});
