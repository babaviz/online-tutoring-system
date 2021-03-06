package com.tongji.onlinetutor.business.draw
{
	import mx.core.Container;
	
	//画图的接口程序
	public interface IDraw
	{
		function init(disContainer:Container):void;
		function onDrawDown(clientId:String,_mx:Number,_my:Number):void;
		function onDrawMove(clientId:String,_mx:Number,_my:Number):void;
		function onDrawUp(clientId:String,_mx:Number,_my:Number):void;
		function onDrawKeyUp(clientId:String,text:String):void;
		function onFoucusOut(clientId:String,text:String):void;
		function setLineColor(color:uint):void;
		function setFillColor(color:uint):void;
		function setLineSize(size:Number):void;
	}
}