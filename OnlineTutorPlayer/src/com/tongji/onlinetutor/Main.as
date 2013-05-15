// ActionScript file
import com.tongji.onlinetutor.OnlineTutorPlayer;
import com.tongji.onlinetutor.business.connection.Connect;
import com.tongji.onlinetutor.view.View;

import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.KeyboardType;

import mx.binding.utils.BindingUtils;
import mx.controls.Alert;

import spark.components.Button;
import spark.components.VideoDisplay;

private var connect:Connect;


public function main():void{
	View.output = "initializing\n";
	View.button_reconnect_visible = true;
	View.button_offline_visible = false;
	View.video_local = videoDisplay_local;
	View.video_remote = videoDisplay_remote;
	View.input = textArea_input;
	connect = new Connect();
	connect.init();
	textArea_input.addEventListener(KeyboardEvent.KEY_DOWN,onEnterUpHandler);
}
public function onBWDone():void{
	connect.onBWDone();
}
protected function onEnterUpHandler(event:KeyboardEvent):void{
	if(event.keyCode == 13){
		if(View.input.text.length == 0){
			View.input.text = "";
			return;			
		}
		connect.onSend();
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
	connect.onSend();
}

protected function button_reconnect_clickHandler(event:MouseEvent):void
{
//	if(connect.isConnected())
		connect.reconnect();
}

protected function button_offline_clickHandler(event:MouseEvent):void
{
	connect.disconnect();
}
