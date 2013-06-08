package com.tongji.onlinetutor.business.draw.impl
{
	import com.tongji.onlinetutor.business.WhiteBoard;
	
	import mx.core.Application;
	import mx.core.Container;
	import mx.core.UIComponent;
	
	import com.tongji.onlinetutor.business.draw.IDraw;
	
	public class LineDrawImpl implements IDraw
	{
		/**
		 * 画图属性的初始化
		 **/
		private var oX:Number;
		private var oY:Number;
		private var IsDown:Boolean=false;
		
		private var disp:Container;
		
		private var comp:UIComponent
		
		protected var line_color:uint;
		protected var fill_color:uint;
		protected var line_size:uint;
		
		public function LineDrawImpl()
		{
		}
		
		public function init(disContainer:Container):void
		{
			disp = disContainer;
		}
		
		public function onDrawDown(clientId:String,_mx:Number, _my:Number):void
		{
			IsDown=true;
			this.oX=_mx;
			this.oY=_my;
			
		}
		
		public function onDrawMove(clientId:String,_mx:Number, _my:Number):void
		{
			if (IsDown)
			{
				if(comp == null) {
					comp = new UIComponent();
					disp.addChild(comp);
					//disp.setChildIndex(comp, 0);
				}
				var x:Number=this.oX;
				var y:Number=this.oY;
//				comp.graphics.lineStyle(Application.application._lineSize, Application.application._lineColor, 1);
				comp.graphics.lineStyle(line_size,line_color,1);
				comp.graphics.moveTo(x, y);
				comp.graphics.lineTo(_mx, _my);
				this.oX=_mx;
				this.oY=_my;
			}
		}
		
		public function onDrawUp(clientId:String,_mx:Number, _my:Number):void
		{
			IsDown = false;
			comp = null;
		}
		public function onDrawKeyUp(clientId:String,text:String):void {
			
		}
		
		public function onFoucusOut(clientId:String,text:String):void {
			
		}
		
		public function setLineColor(color:uint):void{
			this.line_color = color;
		}
		
		public function setFillColor(color:uint):void{
			this.fill_color = color;
		}
		
		public function setLineSize(size:Number):void{
			this.line_size = size;
		}
	}
}