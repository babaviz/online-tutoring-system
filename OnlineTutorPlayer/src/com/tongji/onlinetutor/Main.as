// ActionScript file
import com.tongji.onlinetutor.OnlineTutorPlayer;
import com.tongji.onlinetutor.business.NetDispatcher;
import com.tongji.onlinetutor.business.WhiteBoard;
import com.tongji.onlinetutor.business.draw.DrawTools;
import com.tongji.onlinetutor.view.View;

import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.external.ExternalInterface;
import flash.net.NetConnection;
import flash.system.Security;
import flash.ui.KeyboardType;

import mx.binding.utils.BindingUtils;
import mx.collections.ArrayList;
import mx.controls.Alert;
import mx.controls.ColorPicker;
import mx.graphics.shaderClasses.ExclusionShader;

import spark.components.Button;
import spark.components.Image;
import spark.components.VideoDisplay;

public var dispatcher:NetDispatcher;
public var whiteboard:WhiteBoard;
private var current_background_image:Image;
private var background_images:Array;


public function main():void{
	while(!ExternalInterface.call("getIsReady"));
	Security.allowDomain("*");
	var username:String = String(ExternalInterface.call("getUserName"));
	var type:String = String(ExternalInterface.call("getUserType"));
	var courseID:String = String(ExternalInterface.call("getCourseID"));

	View.output = "initializing\n";
	View.button_reconnect_visible = true;
	View.button_offline_visible = false;
	View.video_local = videoDisplay_local;
	View.video_remote = videoDisplay_remote;
	View.input = textArea_input;
	dispatcher = new NetDispatcher();
	dispatcher.init(username,type,courseID);
	dispatcher.Connect();
	if(dispatcher.isConnected())
		View.output = "课程已开始！\n";
	textArea_input.addEventListener(KeyboardEvent.KEY_DOWN,onEnterUpHandler);
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


