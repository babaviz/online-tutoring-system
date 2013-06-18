		PL._init();
		PL.joinListen("/tutoring/numberofnotice");
		function onData(event)
		{
			//alert(event.get("he"));
			if(event.get("numberofnotice"+PL.userid)!=0&&event.get("numberofnotice"+PL.userid)!="undefined")
			{
				//alert(event.get("numberofnotice"));
				$("#message").html('<i class="icon-envelope"></i>消息<span class="badge badge-important">'+event.get("numberofnotice"+PL.userid)+'</span>');
			}
			else
			{
				$("#message").html('<i class="icon-envelope"></i>消息</a>');
			}
			if(event.get("numberofcoursenotice"+PL.userid)!=0&&event.get("numberofcoursenotice"+PL.userid)!="undefined")
			{
				//alert(event.get("numberofnotice"));
				$("#coursemsg").html('课程信息<span class="badge badge-important">'+event.get("numberofcoursenotice"+PL.userid)+'</span>');
			}
			else
			{
				$("#coursemsg").html('课程信息');
			}
			if(event.get("numberoffriendnotice"+PL.userid)!=0&&event.get("numberoffriendnotice"+PL.userid)!="undefined")
			{
				//alert(event.get("numberofnotice"));
				$("#friendmsg").html('好友信息<span class="badge badge-important">'+event.get("numberoffriendnotice"+PL.userid)+'</span>');
			}
			else
			{
				$("#friendmsg").html('好友信息');
			}
			if(event.get("numberofchatnotice"+PL.userid)!=0&&event.get("numberofchatnotice"+PL.userid)!="undefined")
			{
				//alert(event.get("numberofnotice"));
				$("#chatmsg").html('私信<span class="badge badge-important">'+event.get("numberofchatnotice"+PL.userid)+'</span>');
			}
			else
			{
				$("#chatmsg").html('私信');
			}
			if(event.get("application"+PL.userid)!=null&&event.get("application"+PL.userid)!="undefined")
			{
				updateclass(event.get("application"+PL.userid));
			}
		}
		
		function cancelListen()
		{
			PL.leave();
		}
		
		function updateclass(id)
		{
			alert("你申请的id为"+id+"的课程被接受");
			handleapplicationaction.updateUser();
			
		}