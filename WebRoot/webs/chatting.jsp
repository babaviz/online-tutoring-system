<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/webs/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<base href="<%=basePath%>">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="bootstrap/css/boot.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<link href="css/outerframe.css" rel="stylesheet" type="text/css" />
<title>无标题文档</title>

</head>
<body>

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="brand" href="#">零距离家教</a>
      <ul class="nav">
        <li><a href="Index">首页</a></li>
        <li><a href="SearchCourse">搜课</a></li>
        <li><a href="SearchUser">搜人</a></li>
        <li class="active"><a href="Chatting">私信</a></li>
        <li><a href="CourseManage">课程管理</a></li>
        <li><a href="AllTopics">BBS</a></li>
      </ul>
      <ul class="nav my_pull_right">
        <li><a class="modify_padding" href="BuildInfo"><i class="icon-user"></i>个人设置</a></li>
        <li><a class="btn-link modify_padding dropdown-toggle" id="message" data-toggle="dropdown">
        	<i class="icon-envelope"></i>消息</a>
        	<ul class="dropdown-menu" style="margin-left:100px">
        	<li><a href="FriendMessage" id="friendmsg">好友信息</a></li>
        	<li><a href="CourseMessage" id="coursemsg">课程信息</a></li>
        	<li><a href="Chatting" id="chatmsg">私信</a></li>
        	</ul>
        	
        </li>
        <li><a class="modify_padding" href="Logout"><i class="icon-off"></i>登出</a></li>
        <li><a class="modify_padding"><strong class="text-success">
          <div class="sub_name">
            <div>
              <s:property value="#session.user.lastName"/>
            </div>
            <div>
              <s:property value="#session.user.firstName"/>
            </div>
          </div>
          </strong></a></li>
      </ul>
    </div>
  </div>
</div>

<div class="container">
	<div class="row">

	<div class="span10">
	
    	


        <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        	<div class="modal-header">
              <button type="button" class="close"  onclick="closeChatBox()">×</button>
              <h3 id="myModalLabel">私信</h3>
            </div>
            <div class="modal-body">
              <table class="table">
              	<tbody>
              		<tr>
              			<td>发给</td>
              			<td><p class="text-success" id="sendname"></p></td>
              		</tr>
              		<tr>
              			<td>内容</td>
              			<td><textarea style="width:80%;" rows="3" id="sendcontent"></textarea></td>
              		</tr>
              	</tbody>
              </table>
            </div>
            <div class="modal-footer">
              <button class="btn btn-primary"  onclick=""  type="button" id="sendbtn">发送</button>
            </div>
        </div>

		<s:iterator value="#msglist">
        <div class="">

            <div class="bs-docs-example">
            <s:if test="sender.id==#session.user.id">
            	<div class = "color">发送给：<s:property value="receiver.lastName"/><s:property value="receiver.firstName"/><em>&nbsp;&nbsp;<s:date name="time" format="yyyy-MM-dd HH:mm:ss"/></em></div>
                <p class="text-info"><s:property value="content"/></p>
            </s:if>
            <s:else>
            	<div class = "color"><s:property value="sender.lastName"/><s:property value="sender.firstName"/><em>&nbsp;&nbsp;<s:date name="time" format="yyyy-MM-dd HH:mm:ss"/></em></div>
                <p class="text-info"><s:property value="content"/></p>
                <p class="text-right"><a href="javascript:openChatBox('<s:property value='sender.lastName'/><s:property value='sender.firstName'/>',<s:property value='sender.id'/>)">回复</a></p>
            </s:else>
            </div>

        </div>
		</s:iterator>
        
        
        

   
    </div>
  
	<div class="span2">
	
    <div id="userlist" class="pull-right affix" style="background:#888;height:0px;width:150px;border:0px solid #ccc;font:16px/26px Georgia, Garamond, Serif;overflow:auto;">
	    朋友列表
	    <table class="table">
	    <tbody>
	    <s:iterator value="#session.user.friendsIHave">
	    <tr>
	    	<td>
	    	<img data-src="holder.js/64x64" src="../headimg/<s:property value='picture'/>" style="height:64px;width:64px;"/>
	    	</td>
	    	<td>
	    	<a href="javascript:openChatBox('<s:property value='lastName'/><s:property value='firstName'/>',<s:property value='id'/>)">
	    	<s:property value="lastName"/><s:property value="firstName"/>
	    	</a>
	    	</td>
	    </tr>
	    </s:iterator>
	    </tbody>
	    </table>
	</div>
	
	</div>
 	
  	</div>
</div>
<div class="footer" style="margin-top:400px;">
  	<div class="container">
    	<p>copyright © 2013</p>
    </div>
  </div>
  
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script>
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script type="text/javascript">
	var height = document.documentElement.clientHeight;
	
	$("#userlist").height(height);
	
	
function openChatBox(name, id)
{
	$('#myModal').modal('show');
	$("#sendname").html(name);
	$("#sendbtn").attr("onclick","sendMessage("+id+")");
}

function closeChatBox()
{
	$("#myModal").modal('hide');
}


	
</script>

<script src='/OnlineTutoringSystem/dwr/engine.js'></script> 
<script src='/OnlineTutoringSystem/dwr/interface/sendmessageaction.js'></script> 
<script type="text/javascript">
function sendMessage(id)
{
	sendmessageaction.sendMessage(id,$("#sendcontent").val(),sendMessageCallback);
	$("#myModal").modal('hide');
}
function sendMessageCallback(msg)
{
	if(msg=="ok")
	{
		alert("发送成功");
	}
}
</script>
<script type="text/javascript" src="js/ajax-pushlet-client.js"></script> 
<script type="text/javascript">
		PL.userid='<s:property value="#session.user.id" />';
		PL._init();
		PL.joinListen("/tutoring/numberofnotice");
		function onData(event)
		{
			//alert(event.get("he"));
			if(event.get("numberofnotice"+PL.userid)!=0)
			{
				//alert(event.get("numberofnotice"));
				$("#message").html('<i class="icon-envelope"></i>消息<span class="badge badge-important">'+event.get("numberofnotice"+PL.userid)+'</span>');
			}
			else
			{
				$("#message").html('<i class="icon-envelope"></i>消息</a>');
			}
			if(event.get("numberofcoursenotice"+PL.userid)!=0)
			{
				//alert(event.get("numberofnotice"));
				$("#coursemsg").html('课程信息<span class="badge badge-important">'+event.get("numberofcoursenotice"+PL.userid)+'</span>');
			}
			else
			{
				$("#coursemsg").html('课程信息');
			}
			if(event.get("numberoffriendnotice"+PL.userid)!=0)
			{
				//alert(event.get("numberofnotice"));
				$("#friendmsg").html('好友信息<span class="badge badge-important">'+event.get("numberoffriendnotice"+PL.userid)+'</span>');
			}
			else
			{
				$("#friendmsg").html('好友信息');
			}
			if(event.get("numberofchatnotice"+PL.userid)!=0)
			{
				//alert(event.get("numberofnotice"));
				$("#chatmsg").html('私信<span class="badge badge-important">'+event.get("numberofchatnotice"+PL.userid)+'</span>');
			}
			else
			{
				$("#chatmsg").html('私信');
			}
		}
		
		function cancelListen()
		{
			PL.leave();
		}
		
</script>
</body>
</html>
