package com.tongji.onlinetutor.business
{
	import com.tongji.onlinetutor.business.draw.DrawTools;
	import com.tongji.onlinetutor.view.View;
	
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;

	public class NetDispatcher
	{
		public static var SERVER_ADDRESS:String = "rtmp://10.60.36.15/OnlineTutorRed5Server";
		public static var TEACHER:uint = 0x0;
		public static var STUDENT:uint = 0x1;
		
		private var conn:NetConnection;
		private var username:String;
		private var token:String;
		
		private var videoaudio:VideoAudio;
		private var chat:Chat;
		private var whiteboard:WhiteBoard;
		
		public function NetDispatcher()
		{
			
		}
		
		public function init():void{
			conn = new NetConnection();
			videoaudio = new VideoAudio();
			chat = new Chat();
			whiteboard = new WhiteBoard(this,TEACHER);
			
			username = "sc";
			token = "random data";
		}
		
		public function Connect():void{
			View.output+="Connecting to Server\n";
			conn = conn;
			conn.addEventListener(NetStatusEvent.NET_STATUS,connectServerHandler);
			conn.client = this;
			conn.connect(SERVER_ADDRESS,username,token);
			if(!conn.connected){
				View.button_reconnect_visible = false;
				View.button_offline_visible = true;
				View.output += "Connection Success\n";
			}
			else{
				View.button_reconnect_visible = true;
				View.button_offline_visible = false;
				View.output += "Connection Failed\n";
				return;
			}
		}
		
		private function connectServerHandler(event:NetStatusEvent):void{
			trace(event.info.code);
			videoaudio.SetUp(conn,"RED5","RED5");
			whiteboard.setTopPanel(FlexGlobals.topLevelApplication.panel_parent);
			whiteboard.Enable();
		}
		
		public function onBWDone():void{
			
		}
		
		public function disconnect():void{
			View.output += "Disconnected\n";
			View.button_reconnect_visible = true;
			View.button_offline_visible = false;
			videoaudio.ShutDown();
		}
		
		public function reconnect():void{
			View.output += "Reconnecting...\n";
			//			conn = new NetConnection();
			Connect();
		}
		
		public function isConnected():Boolean{
			return conn.connected;
		}
		
		public function getNetConnection():NetConnection{
			return conn;
		}
		
		/**
		 * CHAT
		 */ 
		public function onMessageSend():void{
			conn.call("sendMessage",null,chat.getInputText(),username);
		}
		
		public function receiveMessage(msg:String):void{
			chat.putReceivedMsg(msg);
		}
		
		/**
		 * WHITEBOARD
		 */ 
		public function onMouseUpSend(mX:Number,mY:Number):void{
			conn.call("sendMouseUp",null,mX,mY);
		}
		public function onMouseDownSend(mX:Number,mY:Number,color:uint):void{
			conn.call("sendMouseDown",null,mX,mY,color);
		}
		public function onMouseMoveSend(mX:Number,mY:Number):void{
			conn.call("sendMouseMove",null,mX,mY);
		}
		public function receiveMouseUp(mX:Number,mY:Number):void{
			whiteboard.onDrawUp(mX,mY);
		}
		public function receiveMouseDown(mX:Number,mY:Number,color:uint):void{
			whiteboard.onDrawDown(mX,mY,color);
		}
		public function receiveMouseMove(mX:Number,mY:Number):void{
			whiteboard.onDrawMove(mX,mY);
		}
		public function onUndoSend():void{
			conn.call("sendUndo",null);
		}
		public function onChangeToolSend(tool:int):void{
			conn.call("sendChangeTool",null,tool);
		} 
		public function onClearScreenSend():void{
			conn.call("sendClearScreen",null);
		}
		public function onUploadSend():void{
			//TODO??
		}
		public function receiveUndo():void{
			whiteboard.Undo();
		}
		public function receiveChangeTool(tool:int):void{
			whiteboard.ChangeTool(tool);
		}
		public function receiveClearScreen():void{
			whiteboard.ClearScreen();
		}
		public function receiveUpload():void{
			//TODO??
		}
		
	}
}