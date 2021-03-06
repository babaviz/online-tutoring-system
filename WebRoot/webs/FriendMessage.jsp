<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/webs/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<base href="<%=basePath%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/outerframe.css" rel="stylesheet" type="text/css" />
<link href="css/topic.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<script src='/OnlineTutoringSystem/dwr/engine.js'></script> 
<script src='/OnlineTutoringSystem/dwr/interface/handlefriendaction.js'></script> 
<script type="text/javascript" src='js/common.js'></script> 
<script type="text/javascript">
function accept(requestuserid,noticeid)
{
	handlefriendaction.acceptFriend(requestuserid,noticeid,acceptCallback);
}
function acceptCallback(msg)
{
	if(msg=='ok')
	{
		alert("操作成功");
		window.location = window.location;
	}
}
function refuse(requestuserid)
{
	handlefriendaction.refuseFriend(requestuserid,refuseCallback);
}

function refuseCallback(msg)
{
	if(msg=="ok")
	{
		alert("操作成功");
		window.location = window.location;
	}
}
</script>
<title>无标题文档</title>
</head>

<body background="images/mainbackground.jpg">
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="brand" href="#">零距离家教</a>
      <ul class="nav">
        <li><a href="Index">首页</a></li>
        <li><a href="SearchCourse">搜课</a></li>
        <li><a href="SearchUser">搜人</a></li>
        <li><a href="Chatting">私信</a></li>
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
          </strong></a><br></li>
      </ul>
    </div>
  </div>
</div>

<div class="container" style="margin-top:50px;">
	<s:iterator value="#session.user.notifications">
	<s:if test="type==2">
	<div class="well">
		<div class="media">
        	<a class="pull-left">
            	<img class="media-object" data-src="holder.js/64x64" style="height:64px;width:64px;" src="../headimg/<s:property value='fromuser.picture'/>"/>
            </a>
            <div class="media-body">
            	<h6><s:property value="fromuser.lastName"/><s:property value="fromuser.firstName"/></h6>
                <p class="text-info">请求成为您的好友</p>
                <p align="right">
                <s:if test="state==0">
            		<button class="btn btn-success" onclick="accept(<s:property value='fromuser.id'/>,<s:property value='id'/>)">接受</button>
            		<button class="btn btn-danger" onclick="refuse(<s:property value='fromuser.id'/>)">拒绝</button>
            	</s:if>
            	<s:elseif test="state==1">
            		<button class="btn btn-success" disabled="disabled">已处理</button>
            	</s:elseif>
            	</p>
            </div>
            
        </div>
    </div>
    </s:if>
    </s:iterator>
    
</div>

<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script> 
<script type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script type="text/javascript" src="js/ajax-pushlet-client.js"></script> 
<script>PL.userid='<s:property value="#session.user.id" />';</script>
<script type="text/javascript" src="js/push.js"></script>
</body>
</html>
