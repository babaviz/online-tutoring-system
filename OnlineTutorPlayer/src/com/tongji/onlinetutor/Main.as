// ActionScript file
import com.tongji.onlinetutor.OnlineTutorPlayer;
import com.tongji.onlinetutor.business.Connect;
import com.tongji.onlinetutor.business.DrawTools;
import com.tongji.onlinetutor.business.WhiteBoard;
import com.tongji.onlinetutor.view.View;

import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.KeyboardType;

import mx.binding.utils.BindingUtils;
import mx.collections.ArrayList;
import mx.controls.Alert;
import mx.controls.ColorPicker;

import spark.components.Button;
import spark.components.Image;
import spark.components.VideoDisplay;

private var connect:Connect;
private var whiteboard:WhiteBoard;
private var current_background_image:Image;
private var background_images:Array;


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
	
	panel_draw.graphics.beginFill(0x000000);
	panel_draw.graphics.endFill();
	
	//white board
	whiteboard = new WhiteBoard(connect.getNetConnection());
	//BindingUtils.bindProperty(this,"WhiteBoard.line_color",colorpicker,"selectedColor");
	whiteboard.setPanel(panel_draw);
	whiteboard.init();
	
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

protected function button_pen_clickHandler(event:MouseEvent):void
{
	whiteboard.onChangeTool(DrawTools.PEN);
}

protected function button_undo_clickHandler(event:MouseEvent):void
{
	// TODO Auto-generated method stub
	
}

protected function button_rubber_clickHandler(event:MouseEvent):void
{
	// TODO Auto-generated method stub
	whiteboard.onChangeTool(DrawTools.RUBBER);
}

protected function button_clear_clickHandler(event:MouseEvent):void
{
	// TODO Auto-generated method stub
	whiteboard.onClearScreen();
}

protected function button_upload_clickHandler(event:MouseEvent):void
{
	// TODO Auto-generated method stub
	
}
