<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/webs/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<base href="<%=basePath%>">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/outerframe.css" rel="stylesheet" type="text/css" />
<link href="css/coursedetail.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<title>无标题文档</title>
</head>

<body style="background:url(images/mainbackground.jpg)">
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="brand" href="#">零距离家教</a>
      <ul class="nav">
        <li><a href="Index">首页</a></li>
        <li class="active"><a href="SearchCourse">搜课</a></li>
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
          </strong></a></li>
      </ul>
    </div>
  </div>
</div>
<div id="down_content" style="background:url(images/half_translucent_2.png)">
  <div id="down_left_content">
  <div id="blackboard_content">
  <div class="bkbd_content" id="course_name_bkbd">
  专业方向综合项目
  </div>
  <div class="bkbd_content" id="tutor_name_bkbd" onclick="toUser(3);">
  老师：刘岩
  </div>
  </div>
  <button type="button" class="btn btn-success control_course_btn" id="apply_course" onclick="apply_course();">申请该课</button>
   <button type="button" class="btn btn-info control_course_btn" id="cancel_application" onclick="cancel_application();">取消申请</button>
    <button type="button" class="btn btn-danger control_course_btn" id="delete_course" onclick="delete_course();">删除该课</button>
  <div id="course_detail_label" class="detail_under_bkbd theLabel">课程信息</div>
  <div id="start_time_detail" class="detail_under_bkbd theContent">开始时间：2013年6月28日</div>
  <div id="duration_detail" class="detail_under_bkbd theContent">课程时长：120分钟</div>
  <div id="course_type_detail" class="detail_under_bkbd theContent">类&nbsp;&nbsp;&nbsp;&nbsp;别：计算机</div>
  <div id="course_description_detail" class="detail_under_bkbd theContent">简&nbsp;&nbsp;&nbsp;&nbsp;介：这是门非常非常非常牛逼的课！！！这是门非常非常非常牛逼的课！！！这是门非常非常非常牛逼的课！！！这是门非常非常非常牛逼的课！！！这是门非常非常非常牛逼的课！！！这是门非常非常非常牛逼的课！！！这是门非常非常非常牛逼的课！！！这是门非常非常非常牛逼的课！！！这是门非常非常非常牛逼的课！！！</div>
  <div id="tutor_detail_label" class="detail_under_bkbd theLabel">教师信息</div>
  <div id="tutor_name_detail" class="detail_under_bkbd theContent" onclick="toUser(3);">姓名：刘岩</div>
  <div id="tutor_eval_detail" class="detail_under_bkbd theContent">评分：0.0</div>
  <div id="tutor_description_detail" class="detail_under_bkbd theContent">简介：这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！这是个非常非常非常屌的老师！！！</div>
  </div>
</div>
<div id="down_right_content"></div>
<div id="copy_statement">版权所有</div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="js/search.js"></script> 
<script src='/OnlineTutoringSystem/dwr/engine.js'></script> 
<script src='/OnlineTutoringSystem/dwr/interface/searchAction.js'></script> 
<script src='/OnlineTutoringSystem/dwr/interface/searchFactors.js'></script>

<script type="text/javascript" src="js/ajax-pushlet-client.js"></script>
<script language="javascript" type="text/javascript" src="js/common.js"></script>
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