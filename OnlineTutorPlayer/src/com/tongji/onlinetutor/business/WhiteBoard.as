package com.tongji.onlinetutor.business
{
	import flash.display.IDrawCommand;
	import flash.events.MouseEvent;
	import flash.net.NetConnection;
	import flash.ui.Mouse;
	
	import mx.binding.utils.BindingUtils;
	import mx.containers.Canvas;
	import mx.controls.Alert;
	import mx.core.Container;
	import mx.core.FlexGlobals;
	import mx.events.DragEvent;
	import mx.events.ScrollEvent;
	
	import qflag.ucstar.flex.draw.IDraw;
	import qflag.ucstar.flex.draw.impl.LineDrawImpl;
	import qflag.ucstar.flex.draw.impl.RectangClearDrawImpl;
	
	import spark.components.BorderContainer;
	import spark.components.Image;

	public class WhiteBoard
	{
		[Bindable]
		public static var line_size:Number = 1;
		[Bindable]
		public static var line_color:uint;
		[Bindable]
		public static var line_color_fill:uint = 0xff0000;
		[Bindable]
		public static var fill_alpha:Number = 1;
		
		private var netconnection:NetConnection;
		private var currentDraw:IDraw;
		private var panel_draw:Canvas;
		private var current_background_image:Image;
		private static var LOCAL_STREANID:String = "self";
		
		public function WhiteBoard(conn:NetConnection)
		{
			this.netconnection = conn;
		}
		public function setPanel(panel:Canvas):void{
			this.panel_draw = panel;
		}
		public function init():void{
			panel_draw.graphics.beginFill(0x000000);
			panel_draw.graphics.endFill();
			//TODO
			//set background image?? maybe
			panel_draw.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			panel_draw.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			panel_draw.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			panel_draw.addEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
			
			onChangeTool(DrawTools.PEN);
		}
		/**
		 * mouse event
		 * 
		 */
		private function onMouseDown(event:MouseEvent):void{
			onDrawDown(panel_draw.mouseX,panel_draw.mouseY);
			//send to RED5
		}
		private function onMouseUp(event:MouseEvent):void{
			onDrawUp(panel_draw.mouseX,panel_draw.mouseY);
			//send to RED5
		}
		private function onMouseMove(event:MouseEvent):void{
			onDrawMove(panel_draw.mouseX,panel_draw.mouseY);
			//send to RED5
		}
		private function onMouseOut(event:MouseEvent):void{
			
		}
		private function onScrolling(event:ScrollEvent):void{
			
		}
		
		public function onDrawDown(mX:Number, mY:Number):void{
			currentDraw.onDrawDown(LOCAL_STREANID,mX,mY);
		}
		public function onDrawUp(mX:Number, mY:Number):void{
			currentDraw.onDrawUp(LOCAL_STREANID,mX,mY);
		}
		public function onDrawMove(mX:Number, mY:Number):void{
			currentDraw.onDrawMove(LOCAL_STREANID,mX,mY);
		}
		
		/**
		 * clear screen
		 */
		private function ClearScreen():void{
			onClearScreen();
			//send to RED5			
		}
		public function onClearScreen():void{
			panel_draw.removeAllChildren();
		}
		
		/**
		 * controllers
		 */ 
		public function onChangeTool(tool:uint):void{
			switch(tool)
			{
				case DrawTools.PEN:
				{
					currentDraw = new LineDrawImpl();
					currentDraw.init(panel_draw);
					break;
				}
				case DrawTools.RUBBER:
				{
					currentDraw = new RectangClearDrawImpl();
					currentDraw.init(panel_draw);
					break;
				}
					
				default:
				{
					currentDraw = new LineDrawImpl();
					currentDraw.init(panel_draw);
					break;
				}
			}
		}
	}
}