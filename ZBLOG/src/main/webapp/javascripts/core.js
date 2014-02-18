// JavaScript Document
function getPosition(obj){ 

    var topValue= 0,leftValue= 0;

    while(obj){  

	 leftValue+= obj.offsetLeft;
	
	  topValue+= obj.offsetTop; 
	
	  obj= obj.offsetParent;   

    }   

   finalvalue = leftValue + "," + topValue;  

   return finalvalue; 

}