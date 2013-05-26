package com.tongji.onlinetutor.view
{
	import flash.display.DisplayObject;
	
	import mx.containers.Canvas;
	import mx.controls.ColorPicker;
	
	import spark.components.BorderContainer;
	import spark.components.Panel;
	import spark.components.TextArea;
	import spark.components.VideoDisplay;

	public class View extends DisplayObject
	{
		public function View()
		{
		}
		public static function bind():void{
			
		}
		public static var panel_draw:BorderContainer;
		[Bindable]
		public static var output:String;
		[Bindable]
		public static var input:TextArea;
		[Bindable]
		public static var button_reconnect_visible:Boolean;
		[Bindable]
		public static var button_offline_visible:Boolean;
		[Bindable]
		public static var video_local:VideoDisplay;
		[Bindable]
		public static var video_remote:VideoDisplay;
		[Bindable]
		public static var draw_panel:BorderContainer;
		[Bindable]
		public static var colorpicker:ColorPicker;
		
	}
}