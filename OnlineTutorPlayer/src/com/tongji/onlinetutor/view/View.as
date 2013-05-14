package com.tongji.onlinetutor.view
{
	import flash.display.DisplayObject;
	
	import spark.components.TextArea;
	import spark.components.VideoDisplay;

	public class View extends DisplayObject
	{
		public function View()
		{
		}
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
		
	}
}