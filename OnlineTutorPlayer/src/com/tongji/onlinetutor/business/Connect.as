package com.tongji.onlinetutor.business
{
	import com.tongji.onlinetutor.Enviroment;
	import com.tongji.onlinetutor.OnlineTutorPlayer;
	import com.tongji.onlinetutor.view.View;
	
	import flash.events.NetStatusEvent;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.flash_proxy;
	
	import flashx.textLayout.tlf_internal;
	
	import mx.controls.Alert;
	import mx.utils.object_proxy;
	
	import spark.components.Button;
	
	
	public class Connect
	{
		public static var SERVER_ADDRESS:String = "rtmp://10.60.36.118/OnlineTutorRed5Server";
		private var username:String;
		private var token:String;
		private var remote_streamid:String;
		private var local_streamid:String;
		private var netconnection :NetConnection;
		private var netstream_local :NetStream;
		private var netstream_remote :NetStream;
		private var cam_local:Camera;
		
		public function Connect()
		{
		}
		
		public function init():void{
			remote_streamid = "red5";
			local_streamid = "red5";
			username = "sc";
			token = "random data";
			View.output+="Connecting to Server\n";
			connect();
		}
		public function connect():void{
			netconnection = new NetConnection();
			netconnection.addEventListener(NetStatusEvent.NET_STATUS,connectServerHandler);
			netconnection.client = this;
			netconnection.connect(SERVER_ADDRESS,username,token);
			if(!netconnection.connected){
				View.button_reconnect_visible = false;
				View.button_offline_visible = true;
				View.output += "Connection Success\n";
			}
			else{
				View.button_reconnect_visible = true;
				View.button_offline_visible = false;
				View.output += "Connection Failed\n";
			}
		}
		private function connectServerHandler(event:NetStatusEvent):void{
			trace(event.info.code);
			cam_local = Camera.getCamera();
			if(cam_local != null){
				cam_local.setMode(View.video_local.width,View.video_local.height,30);
				cam_local.setQuality(0,50);
				netstream_local = new NetStream(netconnection);
				netstream_local.attachCamera(cam_local);
				netstream_local.publish(local_streamid);
				var video_local:Video = new Video();
				video_local.width = View.video_local.width;
				video_local.height = View.video_local.height;
				video_local.attachCamera(cam_local);
				View.video_local.addChild(video_local);
			}
			else{
				Alert.show("You don't have a camera");
			}
			netstream_remote = new NetStream(netconnection);
			var video_remote:Video = new Video();
			video_remote.width = View.video_remote.width;
			video_remote.height = View.video_remote.height;
			video_remote.attachNetStream(netstream_remote);
			netstream_remote.play(local_streamid);
			View.video_remote.addChild(video_remote);
			
		}
		
		public function onBWDone():void{
			
		}
		
		public function reconnect():void{
			View.output += "Reconnecting...\n";
			connect();
		}
		
		public function disconnect():void{
			View.output += "Disconnected\n";
			View.button_reconnect_visible = true;
			View.button_offline_visible = false;
			netstream_remote.close();
			netstream_local.close();
		}
		
		public function isConnected():Boolean{
			return netconnection.connected;
		}
		
		public function onSend():void{
			netconnection.call("sendMessage",null,(View.input.text),username);
		}
		
		public function receiveMessage(msg:String):void{
			View.output += msg;
			View.input.text = "";
		}
		
		public function getNetConnection():NetConnection{
			return netconnection;
		}
		
		public function getLocalID():String{
			return local_streamid;
		}
		
		public function getRemoteID():String{
			return remote_streamid;
		}
	}
}