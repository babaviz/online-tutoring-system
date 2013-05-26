package qflag.ucstar.flex.draw.impl
{
	import com.tongji.onlinetutor.business.WhiteBoard;
	
	import mx.core.Application;
	import mx.core.Container;
	import mx.core.UIComponent;
	
	import qflag.ucstar.flex.draw.IDraw;
	
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
				comp.graphics.lineStyle(WhiteBoard.line_size,WhiteBoard.line_color,1);
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
	}
}