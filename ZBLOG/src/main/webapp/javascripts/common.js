//保存公共方法与变量
	
var contextPath = window.location.origin+'/'+window.location.pathname.split('/')[1],//获取上下文路径 
	msgSucc = '操作成功!',//操作成功提示信息 
	msgFail = '操作失败!',//操作失败提示信息
	reqUrl = '',//请求地址
	action = '';//请求操作

//检测URL
function checkeUrl(url){
	return new RegExp("^(https|http|ftp|rtsp|mms)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]", 'g').test(url);
};

//检测email
function checkEmail(str){
       var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
       return reg.test(str);
}

//控制台打印
window.console = window.console || {
	log : function(){}
}; 

//数组工具
var ArrayUtils = {
	//判断数组array是否已经存在value
	exist : function(array,value) {
		for (var i = 0 ; i < array.length ; i++) {
			if (new Number(array[i]) === new Number(value)) {
				return true;
			}
		}
		return false;
	}
};

//页面字符数量限制
(function($){
	$.fn.wordLimit = function(num){	
		this.each(function(){	
			if(!num){
				var copyThis = $(this.cloneNode(true)).hide().css({
					'position': 'absolute',
					'width': 'auto',
					'overflow': 'visible'
				});	
				$(this).after(copyThis);
				if(copyThis.width()>$(this).width()){
					$(this).text($(this).text().substring(0,$(this).text().length-4));
					$(this).html($(this).html()+'...');
					copyThis.remove();
					$(this).wordLimit();
				}else{
					copyThis.remove(); //清除复制
					return;
				}	
			}else{
				var maxwidth=num;
				if($(this).text().length>maxwidth){
					$(this).text($(this).text().substring(0,maxwidth));
					$(this).html($(this).html()+'...');
				}
			}					 
		});
	};		  
})(jQuery);

