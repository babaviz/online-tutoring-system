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
  <div class="left">
  <div class="dropshadow2"><div class="innerbox">
  <img data-src="holder.js/64x64" src="../headimg/<s:property value='picture'/>" style="height:150px;width:150px;"/>
  </div></div>
	<div id="tutor_result_template" class="">
    <div class="result_right_content">
      <div class="name"><s:property value="lastName"/><s:property value="firstName"/>
      </div>
      <p class="name2"><button type="submit" class="btn" >加为好友</button></p>
  
      <div class="gender_img"></div>
      <s:if test="type=='1'">
      <div class="user_type">学生</div>
      </s:if>
      <s:else>
      <div class="user_type">老师</div>
      </s:else>
      <div class="user_point">积分：<s:property value="point"/></div>

    </div>
  </div>

  </div>
  
  <div class="border_grey">  
  
  	  <div class="base">基本信息</div>
      <div class="demo_line_02"></div>
      <div class="base2">性别：男</div>
      <div class="base2">学校：<s:property value="school"/></div>
      <div class="base2">生日：<s:date name="birthday" format="yyyy-MM-dd" /></div>
      <div class="base">联系方式</div>
            <div class="demo_line_02"></div>
      <div class="base2">email：<s:property value="email"/></div>
      <div class="base2">phone：<s:property value="phone"/></div>
      </div>
  
  </div>
  <div id="down_right_content"></div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script> 
<script type="text/javascript" src="js/ajax-pushlet-client.js"></script> 
<script>PL.userid='<s:property value="#session.user.id" />';</script>
<script type="text/javascript" src="js/push.js"></script>
</body>
</html>
