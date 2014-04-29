/*
 MIT

 Creato by Webz Ray
*/
CKEDITOR.dialog.add("wenzgmapDialog",function(b){return{title:"Insert Google Map",minWidth:400,minHeight:75,contents:[{id:"tab-basic",label:"Basic Settings",elements:[{type:"text",id:"addressStr",label:"Please enter your central map address"},{type:"text",id:"mapWidth",label:"Map Width (px)",style:"width:25%;"},{type:"text",id:"mapHeight",label:"Map Height (px)",style:"width:25%;"}]}],onOk:function(){var c=this.getValueOf("tab-basic","addressStr").trim(),d=this.getValueOf("tab-basic","mapWidth").trim(),
e=this.getValueOf("tab-basic","mapHeight").trim(),a=b.document.createElement("iframe");a.setAttribute("width",d);a.setAttribute("height",e);a.setAttribute("src","//maps.google.com/maps?q="+c+"&num=1&t=m&ie=UTF8&z=14&output=embed");a.setAttribute("frameborder","0");a.setAttribute("scrolling","no");b.insertElement(a)}}});