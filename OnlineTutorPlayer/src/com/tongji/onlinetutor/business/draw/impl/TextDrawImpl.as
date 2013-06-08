package com.tongji.onlinetutor.business.draw.impl
{
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	
	import mx.controls.Text;
	import mx.controls.TextArea;
	import mx.core.Application;
	import mx.core.Container;
	import mx.core.UIComponent;
	
	import com.tongji.onlinetutor.business.draw.IDraw;
	
	public class TextDrawImpl implements IDraw
	{
		/**
		 * 画图属性的初始化
		 **/
		private var oX:Number;
		private var oY:Number;
		private var IsDown:Boolean=false;
		
		private var disp:Container;
		
		private var comp:UIComponent
		
		private var newArea:TextArea;
		
		private var isFocusOut:Boolean = true;
		
		public function TextDrawImpl()
		{
		}
		
		public function init(disContainer:Container):void
		{
			disp = disContainer;
		}
		
		public function onDrawDown(clientId:String,_mx:Number, _my:Number):void
		{
			if(clientId == Application.application.SELF_CLIENTID) {
				if(isFocusOut == false) {
					//onFoucusOut(newArea.text);
					disp.setFocus();
					return;
				}
			}
			IsDown=true;
			this.oX=_mx;
			this.oY=_my;
			
			if(clientId != Application.application.SELF_CLIENTID) {
				return;
			}
			
			
			//Application.application.log2.text = Application.application.log2.text + "click";
			
			newArea = new TextArea();
			newArea.height=80;
			newArea.width=180;
			newArea.wordWrap=false;
			newArea.setStyle("fontSize","12");
			newArea.setStyle("color",Application.application._fontColor);
			newArea.x = _mx;
			newArea.y = _my;
			newArea.addEventListener(KeyboardEvent.KEY_UP,Application.application.onKeyUp);
			newArea.addEventListener(FocusEvent.FOCUS_OUT,Application.application.onFoucusOut);
			Application.application.currentTextArea = newArea;
			disp.addChild(newArea);
			newArea.setFocus();
			isFocusOut = false;
		}
		
		public function onDrawMove(clientId:String,_mx:Number, _my:Number):void
		{
			
		}
		
		public function onFoucusOut(clientId:String,text:String):void {
			//Application.application.log2.text = Application.application.log2.text + text;
			isFocusOut = true;
			if(text != "") {
				var newText:Text = new Text();
				newText.setStyle("fontSize","12");
				newText.setStyle("color",Application.application._fontColor);
				newText.text = text;
				//newText.height = 50;
				newText.x = this.oX;
				newText.y = this.oY;
				disp.addChild(newText);
			}
			if(newArea != null) {
				if(disp.contains(newArea)) {
					disp.removeChild(newArea);
					newArea = null;
				}
			}
		}
		
		public function onDrawUp(clientId:String,_mx:Number, _my:Number):void
		{
			IsDown = false;
			comp = null;
		}
		public function onDrawKeyUp(clientId:String,text:String):void {
			if(newArea.text == '') {
				newArea.text = text;
			}
		}
	}
}

