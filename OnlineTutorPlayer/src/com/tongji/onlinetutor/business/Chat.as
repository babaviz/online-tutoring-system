package com.tongji.onlinetutor.business
{
	import com.tongji.onlinetutor.view.View;

	public class Chat
	{
		public function Chat()
		{
		}
		
		public function getInputText():String{
			return View.input.text;
		}
		
		public function putReceivedMsg(msg:String):void{
			View.output += msg;
			View.input.text = "";
		}
		
		public function Clear():void{
			View.output = "";
		}
	}
}