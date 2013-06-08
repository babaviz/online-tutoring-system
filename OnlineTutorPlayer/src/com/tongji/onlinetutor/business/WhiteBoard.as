package com.tongji.onlinetutor.business
{
	import com.tongji.onlinetutor.business.draw.DrawTools;
	import com.tongji.onlinetutor.business.draw.IDraw;
	import com.tongji.onlinetutor.business.draw.impl.LineDrawImpl;
	import com.tongji.onlinetutor.business.draw.impl.RectangClearDrawImpl;
	
	import flash.display.IDrawCommand;
	import flash.events.MouseEvent;
	import flash.events.NetDataEvent;
	import flash.net.FileReference;
	import flash.net.NetConnection;
	import flash.ui.Mouse;
	
	import mx.binding.utils.BindingUtils;
	import mx.containers.Canvas;
	import mx.controls.Alert;
	import mx.controls.ColorPicker;
	import mx.core.Container;
	import mx.core.FlexGlobals;
	import mx.events.DragEvent;
	import mx.events.ScrollEvent;
	
	import spark.components.BorderContainer;
	import spark.components.Button;
	import spark.components.CheckBox;
	import spark.components.HGroup;
	import spark.components.Image;
	import spark.components.Panel;

	public class WhiteBoard
	{
		[Bindable]
		public static var line_size:Number = 1;
		
		[Bindable]
		public static var line_color_fill:uint = 0xff0000;
		[Bindable]
		public static var fill_alpha:Number = 1;
		
		private var line_color:uint;
		
		//controllers
		private var panel_parent:BorderContainer;
		private var panel_draw:Canvas;
		private var hgroup:HGroup;
		private var colorpicker:ColorPicker;
		private var checkbox:CheckBox;
		private var button_pen:Button;
		private var button_undo:Button;
		private var button_rubber:Button;
		private var button_clear:Button;
		private var button_upload:Button;
		
		private var dispatcher:NetDispatcher;
		private var currentDraw:IDraw;
		private var current_background_image:Image;
		private var watchers:Array;
		//private var file:FileReference;
		private static var LOCAL_STREANID:String = "self";
		private var selftype:Boolean;
		private var isenabled:Boolean;
		private var isDown:Boolean;
		
		public function WhiteBoard(dispatcher:NetDispatcher, type:Boolean)
		{
			this.dispatcher = dispatcher;
			this.selftype = type;
			this.isenabled = true;
			this.isDown = false;
		}
		public function setTopPanel(panel:BorderContainer):void{
			this.panel_parent = panel;
			init();
		}
		public function init():void{
			this.panel_draw = Canvas(panel_parent.getElementAt(0));
			this.hgroup = HGroup(panel_parent.getElementAt(1));
			this.colorpicker = ColorPicker(hgroup.getElementAt(1));
			this.button_pen = Button(hgroup.getElementAt(0));
			this.button_undo = Button(hgroup.getElementAt(2));
			this.button_rubber = Button(hgroup.getElementAt(3));
			this.button_clear = Button(hgroup.getElementAt(4));
			this.button_upload = Button(hgroup.getElementAt(5));
			this.checkbox = CheckBox(panel_parent.getElementAt(2));
			
			if(NetDispatcher.TEACHER != selftype)
				checkbox.setVisible(false);
			else{
				button_rubber.enabled = false;
				button_undo.enabled = false;
				button_clear.enabled = false;
			}
			checkbox.addEventListener(MouseEvent.CLICK,checkbox_clickHandler);
			button_pen.addEventListener(MouseEvent.CLICK,button_pen_clickHandler);
			button_undo.addEventListener(MouseEvent.CLICK,button_undo_clickHandler);
			button_rubber.addEventListener(MouseEvent.CLICK,button_rubber_clickHandler);
			button_clear.addEventListener(MouseEvent.CLICK,button_clear_clickHandler);
			button_upload.addEventListener(MouseEvent.CLICK,button_upload_clickHandler);
			
			panel_draw.graphics.beginFill(0xffffff);
			panel_draw.graphics.endFill();
		}
		public function Enable():void{
			//TODO
			//set background image?? maybe
			this.isenabled = true;
			button_rubber.enabled = true;
			button_undo.enabled = true;
			button_clear.enabled = true;
			panel_draw.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			panel_draw.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			panel_draw.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			panel_draw.addEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
			ChangeTool(DrawTools.PEN);
		}
		public function Disable():void{
			this.isenabled = false;
			button_rubber.enabled = false;
			button_undo.enabled = false;
			button_clear.enabled = false;
			panel_draw.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			panel_draw.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			panel_draw.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			panel_draw.removeEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
		}
		/**
		 * mouse event
		 * 
		 */
		private function onMouseDown(event:MouseEvent):void{
			this.isDown = true;
			dispatcher.onMouseDownSend(panel_draw.mouseX,panel_draw.mouseY,colorpicker.selectedColor);
		}
		private function onMouseUp(event:MouseEvent):void{
			this.isDown = false;
			dispatcher.onMouseUpSend(panel_draw.mouseX,panel_draw.mouseY);
		}
		private function onMouseMove(event:MouseEvent):void{
			if(isDown)
				dispatcher.onMouseMoveSend(panel_draw.mouseX,panel_draw.mouseY);
		}
		private function onMouseOut(event:MouseEvent):void{
			
		}
		private function onScrolling(event:ScrollEvent):void{
			
		}
		
		public function onDrawDown(mX:Number, mY:Number, color:uint):void{
			currentDraw.setLineColor(color);
			currentDraw.onDrawDown(LOCAL_STREANID,mX,mY);
		}
		public function onDrawUp(mX:Number, mY:Number):void{
			currentDraw.onDrawUp(LOCAL_STREANID,mX,mY);
		}
		public function onDrawMove(mX:Number, mY:Number):void{
			currentDraw.onDrawMove(LOCAL_STREANID,mX,mY);
		}
		
		public function onUndo():void{
			dispatcher.onUndoSend();
		}
		public function Undo():void{
			if(panel_draw.getChildren().length != 0)
				panel_draw.removeChildAt(panel_draw.getChildren().length-1);
		}
		
		/**
		 * clear screen
		 */
		public function ClearScreen():void{
			panel_draw.removeAllChildren();	
		}
		private function onClearScreen():void{
			dispatcher.onClearScreenSend();	
		}
		/**
		 * checkbox
		 */ 
		public function doCheckBox(isEnabled:Boolean):void{
			if(NetDispatcher.STUDENT == selftype)
				isEnabled?Enable():Disable();
		}
		public function onDoCheckBox(isEnabled:Boolean):void{
			if(NetDispatcher.TEACHER == selftype)
				dispatcher.onDoCheckBox(isEnabled);
		}
		
		/**
		 * controllers
		 */ 
		private function onChangeTool(tool:uint):void{
			dispatcher.onChangeToolSend(tool);
		}
		public function ChangeTool(tool:uint):void{
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
		
		public function isEnabled():Boolean{
			return isenabled;
		}
		
		protected function button_pen_clickHandler(event:MouseEvent):void
		{
			onChangeTool(DrawTools.PEN);
		}
		
		protected function button_undo_clickHandler(event:MouseEvent):void
		{
			onUndo();
		}
		
		protected function button_rubber_clickHandler(event:MouseEvent):void
		{
			onChangeTool(DrawTools.RUBBER);
		}
		
		protected function button_clear_clickHandler(event:MouseEvent):void
		{
			onClearScreen();
		}
		
		protected function button_upload_clickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
		}
		protected function checkbox_clickHandler(event:MouseEvent):void
		{
			Alert.show(checkbox.selected.toString());
			onDoCheckBox(!checkbox.selected);
		}
	}
}