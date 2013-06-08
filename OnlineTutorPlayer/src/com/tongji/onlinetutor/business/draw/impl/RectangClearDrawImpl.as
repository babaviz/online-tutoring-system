package com.tongji.onlinetutor.business.draw.impl
{
	import flash.geom.Rectangle;
	
	import mx.core.Application;
	import mx.core.Container;
	import mx.core.UIComponent;
	
	import com.tongji.onlinetutor.business.draw.IDraw;
	
	/**
	 * 画矩形
	 **/
	public class RectangClearDrawImpl implements IDraw
	{
		/**
		 * 画图属性的初始化
		 **/
		private var oX:Number;
		private var oY:Number;
		private var IsDown:Boolean=false;
		
		private var oX2:Number;
		private var oY2:Number;
		
		private var backgroundColor:uint=0xffffff;
		
		private var disp:Container;
		
		protected var line_color:uint;
		protected var fill_color:uint;
		protected var line_size:uint;
		
		//动态选择区域
		private var comp:UIComponent = new UIComponent();
		
		public function RectangClearDrawImpl()
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
			this.oX2=_mx;
			this.oY2=_my;
			disp.addChild(comp);
		}
		
		public function onDrawMove(clientId:String,_mx:Number, _my:Number):void
		{
			if (IsDown)
			{
				
				var x:Number=this.oX;
				var y:Number=this.oY;
				
//				if(clientId == Application.application.SELF_CLIENTID) { //如果是自己才需要显示轨迹
					comp.width = _mx-x;
					comp.height = _my-y;
					
					//清理之前画的框图
					
					{
						//                                      comp.graphics.lineStyle(3, 0xffffff, 1);
						//                                      comp.graphics.beginFill(backgroundColor,1);
						//                                      comp.graphics.drawRect(x,y,(oX2-x),(oY2-y));
						//                                      comp.graphics.endFill();
						comp.graphics.clear();
					}
					comp.graphics.lineStyle(2, backgroundColor, 1);
					comp.graphics.beginFill(backgroundColor,0.5);
					comp.graphics.drawRect(x,y,(_mx-x),(_my-y));
					comp.graphics.endFill();
//				}
				this.oX2=_mx;
				this.oY2=_my;
			}
		}
		
		public function onDrawUp(clientId:String,_mx:Number, _my:Number):void
		{
			IsDown = false;
			var x:Number=this.oX;
			var y:Number=this.oY;
			
			var logMsg:String = "";
			var childs:Array = disp.getChildren();
			for(var i:int = 0; i<childs.length; i++) {
				var child:UIComponent = childs[i];
				var theRect:Rectangle = child.getRect(disp);
				//logMsg += ""+child.className+":"+theRect.x+","+theRect.y+"|"+theRect.width+","+theRect.height+"|"+this.oX+","+this.oY+"|"+_mx+","+_my;
				
				if(theRect.x > this.oX && theRect.y > this.oY && _mx > (theRect.x+theRect.width) && _my > (theRect.y+theRect.height)) {
					disp.removeChild(child);
				}
			}
			
			this.oX=_mx;
			this.oY=_my;
			if(disp.contains(comp)) {
				disp.removeChild(comp);
				comp = null;
				comp = new UIComponent();
			}
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
		
		public function setBakcgroundColor(color:uint):void{
			this.backgroundColor = color;
		}
	}
}
