package qflag.ucstar.flex.draw.impl
{
	import mx.core.Application;
	import mx.core.Container;
	import mx.core.UIComponent;
	
	import qflag.ucstar.flex.draw.IDraw;
	
	public class EclipseDrawImpl implements IDraw
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
		
		//动态选择区域
		private var comp:UIComponent = new UIComponent();
		
		public function EclipseDrawImpl()
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
				
				if(clientId == Application.application.SELF_CLIENTID) { //如果是自己才需要显示轨迹
					comp.width = _mx-x;
					comp.height = _my-y;
					
					//清理之前画的框图
					{
						comp.graphics.clear();
					}
					comp.graphics.lineStyle(2, 0xcccccc, 1);
					comp.graphics.beginFill(backgroundColor,0.5);
					comp.graphics.drawEllipse(x,y,(_mx-x),(_my-y));
					comp.graphics.endFill();
				}
				this.oX2=_mx;
				this.oY2=_my;
			}
		}
		
		public function onDrawUp(clientId:String,_mx:Number, _my:Number):void
		{
			IsDown = false;
			var x:Number=this.oX;
			var y:Number=this.oY;
			//创建新的UIComponent
			var newComp:UIComponent = new UIComponent();
			newComp.graphics.lineStyle(Application.application._lineSize, Application.application._lineColor, 1);
			newComp.graphics.beginFill(Application.application._lineColorFill,Application.application._fillAlpha);
			newComp.graphics.drawEllipse(x,y,(_mx-x),(_my-y));
			newComp.graphics.endFill();
			
			disp.addChild(newComp);
			
			
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
		
	}
}
