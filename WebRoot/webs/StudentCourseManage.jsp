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
<link href="css/outerframe.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<link href="css/buildinfo.css" rel="stylesheet" type="text/css" />
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
        <li><a href="Chatting">私信</a></li>
        <li class="active"><a href="CourseManage">课程管理</a></li>
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
<div style="margin-top:30px">
  <div class="container">
    <ul id="myTab" class="nav nav-tabs">
      <li class="active"><a href="#historycourse" data-toggle="tab">历史课程</a></li>
      <li><a href="#existcourse" data-toggle="tab">当前课程</a></li>
      <li><a href="#applycourse" data-toggle="tab">已申请课程</a></li>
      
    </ul>
    <div class="tab-content">
    <div class="tab-pane active" id="historycourse">
      <table class="table">
      	<thead>
        	<tr>
            	<th>课程名称</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>老师</th>
            </tr>
        </thead>
        <tbody>
        	<s:iterator value="#session.user.student.courses">
        	<s:if test="status==2">
         	<tr>
            	<td><s:property value="name"/></td>
                <td><s:date name="startTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                <td><s:date name="endTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                <td><s:property value="tutor.user.lastName"/><s:property value="tutor.user.firstName"/></td>
                
            </tr>
            </s:if>
            </s:iterator>
      	
        
        </tbody>
      </table>
      </div>
      <div class="tab-pane" id="existcourse">
        <table class="table">
          <thead>
            <tr>
              <th>课程名称</th>
              <th>开始时间</th>
              <th>结束时间</th>
            </tr>
          </thead>
          <s:iterator value="#session.user.student.courses">
          <s:if test="endTime>time&&student!=null&&status==1">
          <tr>
            <td><s:property value="name"/></td>
            <td><s:date name="startTime" format="yyyy-MM-dd HH:mm:ss"/></td>
            <td><s:date name="endTime" format="yyyy-MM-dd HH:mm:ss"/></td>
            <s:if test="startTime<time">
            <td><button class="btn btn-mini btn-success" onclick="takeclass(<s:property value='id'/>)">上课</button></td>
            </s:if>
            <s:else>
            <td><button class="btn btn-mini" disabled="disabled">上课</button></td>
            </s:else>
          </tr>
          </s:if>
          </s:iterator>
          <tbody>
          </tbody>
        </table>
      </div>
      
      
       <div class="tab-pane" id="applycourse">
      <table class="table">
      	<thead>
        	<tr>
            	<th>课程名称</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>老师</th>
            </tr>
        </thead>
        	<s:iterator value="#session.user.student.applications">
        	
         	<tr>
            	<td><s:property value="name"/></td>
                <td><s:date name="startTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                <td><s:date name="endTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                <td><s:property value="tutor.user.lastName"/><s:property value="tutor.user.firstName"/></td>
                
            </tr>
            
            </s:iterator>
      	<tbody>
        
        </tbody>
      </table>
      </div>
      
    </div>
  </div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/ajax-pushlet-client.js"></script> 
<script>PL.userid='<s:property value="#session.user.id" />';</script>
<script type="text/javascript" src="js/push.js"></script>
<script>
function takeclass(id)
{
	window.location.href='StartCourse.html?courseid='+id;
}
</script>
</body>
</html>