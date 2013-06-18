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
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/userPage.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<link href="css/outerframe.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="css/chatting.css" rel="stylesheet" type="text/css" />
<title>无标题文档</title>
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="brand" href="#">零距离家教</a>
      <ul class="nav">
        <li class="active"><a href="Index">首页</a></li>
        <li><a href="SearchCourse">搜课</a></li>
        <li><a href="SearchUser">搜人</a></li>
        <li><a href="Chatting">私信</a></li>
        <li><a href="CourseManage">课程管理</a></li>
        <li><a href="AllTopics">BBS</a></li>
      </ul>
      <ul class="nav my_pull_right">
        <li><a class="modify_padding" href="BuildInfo"><i class="icon-user"></i>个人设置</a></li>
        <li><a class="btn-link modify_padding dropdown-toggle" id="message" data-toggle="dropdown"> <i class="icon-envelope"></i>消息</a>
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
<div id="down_content" style="background:url(images/half_translucent_2.png)">
  <div id="down_left_content">
    <ul id="myTab" class="nav nav-tabs">
      
      <li class="active"><a href="#tab_20" data-toggle="tab" id="chatname">
        <s:property value="currentReceiver.lastName"/><s:property value="currentReceiver.firstName"/></a>
        	
    </ul>
    <div id="myTabContent" class="tab-content">
      
      <div id="tab_20" class="tab-pane in active"  style="overflow:hidden">
        <div style="width:620px;height:300px;background:#FF3;overflow:auto" id="messages">
        <s:iterator value="#msglist">
        <s:if test="sender.id==#session.user.id">
        
        <div class="messageboxb">
			<div class="head">
            <img class="media-object" data-src="holder.js/32x32" src="../headimg/<s:property value='sender.picture'/>" style="height:32px;width:32px;"/>
            </div>
            
            <div class="content">
            <p class="text-info"><small><s:property value="content"/></small></p>
            <p class="text-info" align="right"><small><s:date name="time" format="yyyy-MM-dd HH:mm:ss"/></small></p>
            </div>
            
            
        </div>
        
        </s:if>
        <s:else>
        
        <div class="messageboxa">
			<div class="head">
            <img class="media-object" data-src="holder.js/32x32" src="../headimg/<s:property value='sender.picture'/>" style="height:32px;width:32px;"/>
            </div>
            
            <div class="content">
            <p class="text-info"><small><s:property value="content"/></small></p>
            <p class="text-info" align="right"><small><s:date name="time" format="yyyy-MM-dd HH:mm:ss"/></small></p>
            </div>
            
            
        </div>
        
        </s:else>
        </s:iterator>
        
        
    	</div>
        
        
        
        <br/>
        <textarea rows="4" style="width:600px" id="sendbox"></textarea><br />
        <button class="btn btn-mini btn-success" onclick="SendMessage()">发送</button>
      </div>
    </div>
  </div>
  <div id="down_right_content">
    <div class="accordion" id="accordion2" style="overflow:auto;">
      <div class="accordion-group">
        <div class="accordion-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="">朋友列表</a> </div>
        <div id="collapseTwo" class="accordion-body collapse in">
          <div class="accordion-inner">
            <table class="table">
              <tbody>
              	<s:iterator value="#session.user.friendsIHave">
                <tr>
                  <td><a class="pull-left"> <img data-src="holder.js/32x32" src="../headimg/<s:property value='picture'/>" style="height:32px;width:32px;"/> </a></td>
                  <td><p class="text-warning"><a href="Chatting?userid=<s:property value='id'/>"><s:property value='lastName'/><s:property value='firstName'/></a></p></td>
                </tr>
                </s:iterator>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script>
<script src='/OnlineTutoringSystem/dwr/engine.js'></script> 
<script src='/OnlineTutoringSystem/dwr/interface/chattingaction.js'></script> 
<script>
var sendid=<s:property value="currentReceiver.id"/>;
function ClickName(id, name)
{
	$("#chatname").html(name);
	
}
function SendMessage()
{
	
	chattingaction.sendMessage(sendid, $("#sendbox").val(),SendMessageCallback);
}
function SendMessageCallback(msg)
{
	if(msg=="ok")
	{
		var date = new Date();
		$("#messages").append(
			"<div class=\"messageboxb\">"
			+"<div class=\"head\">"
            +"<img class=\"media-object\" data-src=\"holder.js/32x32\" src=\"../headimg/"+"<s:property value='#session.user.picture'/>"+"\" style=\"height:32px;width:32px;\"/>"
            +"</div>"
            
            +"<div class=\"content\">"
            +"<p class=\"text-info\"><small>"+$('#sendbox').val()+"</small></p>"
            +"<p class=\"text-info\" align=\"right\"><small>"+date.toLocaleString( )+"</small></p>"
            +"</div>"
            
            
        +"</div>");
        
        $("#messages")[0].scrollTop = $("#messages")[0].scrollHeight;
        $("#sendbox").val("");
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
			
			
			
			if(event.get("content")!=null)
			{
				//alert(event.get("content"));
				var date = new Date();
				$("#messages").append(
					"<div class=\"messageboxa\">"
					+"<div class=\"head\">"
		            +"<img class=\"media-object\" data-src=\"holder.js/32x32\" src=\"../headimg/"+"<s:property value='currentReceiver.picture'/>"+"\" style=\"height:32px;width:32px;\"/>"
		            +"</div>"
		            
		            +"<div class=\"content\">"
		            +"<p class=\"text-info\"><small>"+event.get("content")+"</small></p>"
		            +"<p class=\"text-info\" align=\"right\"><small>"+date.toLocaleString( )+"</small></p>"
		            +"</div>"
		            
		            
		        +"</div>");
		        
		        $("#messages")[0].scrollTop = $("#messages")[0].scrollHeight;
			}
		}
		
		function cancelListen()
		{
			PL.leave();
		}
		
</script>
</body>
</html>
