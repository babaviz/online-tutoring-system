package com.tongji.onlinetutor.business
{
	import com.tongji.onlinetutor.view.View;
	
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import mx.controls.Alert;

	public class VideoAudio
	{
		private var netstream_local :NetStream;
		private var netstream_remote :NetStream;
		private var cam_local:Camera;
		private var microphone_local:Microphone;
		private var remote_streamid:String;
		private var local_streamid:String;
		
		public function VideoAudio()
		{
		}
		
		public function SetUp(conn:NetConnection,local_id:String,remote_id:String):void{
			conn.call
			this.local_streamid = local_id;
			this.remote_streamid = remote_id;
			cam_local = Camera.getCamera();
			microphone_local = Microphone.getMicrophone();
			/***************/
			microphone_local.setLoopBack();
			/***************/
			if(cam_local != null){
				cam_local.setMode(View.video_local.width,View.video_local.height,30);
				cam_local.setQuality(0,50);
				netstream_local = new NetStream(conn);
				netstream_local.attachCamera(cam_local);
				netstream_local.attachAudio(microphone_local);
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
			netstream_remote = new NetStream(conn);
			var video_remote:Video = new Video();
			video_remote.width = View.video_remote.width;
			video_remote.height = View.video_remote.height;
			video_remote.attachNetStream(netstream_remote);
			netstream_remote.play(remote_streamid);
			View.video_remote.addChild(video_remote);
		}
		
		public function ShutDown():void{
			netstream_local.close();
			netstream_remote.close();
		}
		
		public function getLocalID():String{
			return local_streamid;
		}
		
		public function getRemoteID():String{
			return remote_streamid;
		}
	}
}