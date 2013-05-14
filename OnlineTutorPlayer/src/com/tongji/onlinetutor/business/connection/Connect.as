package com.tongji.onlinetutor.business.connection
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
		public static var SERVER_ADDRESS:String = "rtmp://10.60.36.2/OnlineTutorRed5Server";
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
			View.output+="Connecting to Server\n";
			netconnection = new NetConnection();
			netconnection.addEventListener(NetStatusEvent.NET_STATUS,connectServerHandler);
			netconnection.client = this;
			netconnection.connect(SERVER_ADDRESS,"username1","random data"); 
			
		}
		private function connectServerHandler(event:NetStatusEvent):void{
			trace(event.info.code);
			cam_local = Camera.getCamera();
			if(cam_local != null){
				cam_local.setMode(View.video_local.width,View.video_local.height,30);
				cam_local.setQuality(0,50);
				netstream_local = new NetStream(netconnection);
				netstream_local.attachCamera(cam_local);
				netstream_local.publish("py");
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
			netstream_remote.play("sc");
			View.video_remote.addChild(video_remote);
			if(netconnection.connected){
				View.output += "Connect Status: Success\n";
				View.button_offline_visible = true;	
				View.button_reconnect_visible = false;
			}
			else{
				View.output += "Connect Status: Failed\n";
				View.button_reconnect_visible = true;
			}
		}
		
		public function onBWDone():void{
			
		}
		
		public function reconnect():void{
			netconnection.connect(SERVER_ADDRESS);
		}
		
		public function disconnect():void{
			//TODO
			View.button_reconnect_visible = true;
			View.button_offline_visible = false;
			netstream_remote.close();
			netstream_local.close();
		}
		
		public function onSend():void{
			netconnection.call("sendMessage",null,(View.input.text));
		}
		
		public function receiveMessage(msg:String):void{
			View.output += msg;
			View.input.text = "";
		}
	}
}