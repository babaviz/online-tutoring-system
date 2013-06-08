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
		public static var SERVER_ADDRESS:String = "rtmp://10.60.36.83/OnlineTutorRed5Server";
		public static var TEACHER:Boolean = true;
		public static var STUDENT:Boolean = false;
		
		private var conn:NetConnection;
		private var username:String;
		private var type:Boolean;
		private var courseID:String;
		
		private var videoaudio:VideoAudio;
		private var chat:Chat;
		private var whiteboard:WhiteBoard;
		
		public function NetDispatcher()
		{
			
		}
		
		public function init(username:String, type:String, courseID:String):void{
			conn = new NetConnection();
			videoaudio = new VideoAudio();
			chat = new Chat();
			if(type == "Teacher"){
				whiteboard = new WhiteBoard(this,TEACHER);
				this.type = TEACHER;
			}
			else{
				whiteboard = new WhiteBoard(this,STUDENT);
				this.type = STUDENT;
			}
			this.username = username;
			this.courseID = courseID;
		}
		
		public function Connect():void{
			View.output+="Connecting to Server\n";
			conn = conn;
			conn.addEventListener(NetStatusEvent.NET_STATUS,connectServerHandler);
			conn.client = this;
			conn.connect(SERVER_ADDRESS,username,type,courseID);
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
			videoaudio.SetUp(conn,"scRED5","pyRED5");
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
			conn.call("sendMouseUp",null,courseID,mX,mY);
		}
		public function onMouseDownSend(mX:Number,mY:Number,color:uint):void{
			conn.call("sendMouseDown",null,courseID,mX,mY,color);
		}
		public function onMouseMoveSend(mX:Number,mY:Number):void{
			conn.call("sendMouseMove",null,courseID,mX,mY);
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
			conn.call("sendUndo",null,courseID);
		}
		public function onChangeToolSend(tool:int):void{
			conn.call("sendChangeTool",null,courseID,tool);
		} 
		public function onClearScreenSend():void{
			conn.call("sendClearScreen",null,courseID);
		}
		public function onDoCheckBox(isEnabled:Boolean):void{
			conn.call("sendDoCheckBox",null,courseID,isEnabled);
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
		public function receiveDoCheckBox(isEnabled:Boolean):void{
			whiteboard.doCheckBox(isEnabled);
		}
		
	}
}