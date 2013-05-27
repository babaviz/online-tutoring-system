// ActionScript file
import com.tongji.onlinetutor.OnlineTutorPlayer;
import com.tongji.onlinetutor.business.NetDispatcher;
import com.tongji.onlinetutor.business.WhiteBoard;
import com.tongji.onlinetutor.business.draw.DrawTools;
import com.tongji.onlinetutor.view.View;

import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.net.NetConnection;
import flash.ui.KeyboardType;

import mx.binding.utils.BindingUtils;
import mx.collections.ArrayList;
import mx.controls.Alert;
import mx.controls.ColorPicker;

import spark.components.Button;
import spark.components.Image;
import spark.components.VideoDisplay;

public var dispatcher:NetDispatcher;
public var whiteboard:WhiteBoard;
private var current_background_image:Image;
private var background_images:Array;


public function main():void{
	View.output = "initializing\n";
	View.button_reconnect_visible = true;
	View.button_offline_visible = false;
	View.video_local = videoDisplay_local;
	View.video_remote = videoDisplay_remote;
	View.input = textArea_input;
	dispatcher = new NetDispatcher();
	dispatcher.init();
	dispatcher.Connect();
	textArea_input.addEventListener(KeyboardEvent.KEY_DOWN,onEnterUpHandler);
	
	//white board
//	whiteboard = new WhiteBoard(connect.getNetConnection(),Connect.TEACHER);
//	whiteboard.setTopPanel(panel_parent);
//	whiteboard.Enable();
	
	
}
public function onBWDone():void{
	dispatcher.onBWDone();
}
protected function onEnterUpHandler(event:KeyboardEvent):void{
	if(event.keyCode == 13){
		if(View.input.text.length == 0){
			View.input.text = "";
			return;			
		}
		dispatcher.onMessageSend();
	}
}
protected function button_send_clickHandler(event:MouseEvent):void
{
//	if(!connect.isConnected()){
//		return;
//	}
	if(View.input.text.length == 1){
		View.input.text = "";
		return;
	}
	dispatcher.onMessageSend();
}

protected function button_reconnect_clickHandler(event:MouseEvent):void
{
//	if(connect.isConnected())
	dispatcher.reconnect();
}

protected function button_offline_clickHandler(event:MouseEvent):void
{
	dispatcher.disconnect();
}


