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
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<link href="css/outerframe.css" rel="stylesheet" type="text/css" />
<link href="css/userPage.css" rel="stylesheet" type="text/css" />
<title>无标题文档</title>
</head>
<body background="images/mainbackground.jpg">
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
          <div class="sub_name"><div><s:property value="#session.user.lastName"/></div><div><s:property value="#session.user.firstName"/></div></div>
          </strong></a></li>
      </ul>
    </div>
  </div>
</div>
<div style="margin-top:30px">
  <div class="container">
    <div class="row">
      <div class="span8"> 
      
      <div class="left">
  <div class="dropshadow2"><div class="innerbox">
  <img data-src="holder.js/64x64" src="../headimg/<s:property value='#session.user.picture'/>" style="height:150px;width:150px;"/>
  </div></div>
	<div id="tutor_result_template" class="">
    <div class="result_right_content">
      <div class="name"><s:property value="#session.user.lastName"/><s:property value="#session.user.firstName"/>
      </div>
     
  
      <div class="gender_img"></div>
      <s:if test="#session.user.type=='1'">
      <div class="user_type">学生</div>
      </s:if>
      <s:else>
      <div class="user_type">老师</div>
      </s:else>
      <div class="user_point">积分：<s:property value="#session.user.point"/></div>

    </div>
  </div>

  </div>
  
  
  
  <div class="border_grey">  
  
  	  <div class="base">基本信息</div>
      <div class="demo_line_02"></div>
      <div class="base2">性别：男</div>
      <div class="base2">学校：<s:property value="#session.user.school"/></div>
      <div class="base2">生日：<s:date name="#session.user.birthday" format="yyyy-MM-dd" /></div>
      <div class="base">联系方式</div>
            <div class="demo_line_02"></div>
      <div class="base2">Email：<s:property value="#session.user.email"/></div>
      <div class="base2">Phone：<s:property value="#session.user.phone"/></div>
      <div class="base">教师简介</div>
      <div class="demo_line_02"></div>
      <div class="base2"><div class="intro_length"><s:property value="#session.user.tutor.description"/></div></div>
      </div>
      
      </div>
      <div class="span4">
        <div class="accordion" id="accordion2">
          <div class="accordion-group">
            <div class="accordion-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">我的老师</a> </div>
            <div id="collapseOne" class="accordion-body collapse in">
              <div class="accordion-inner">
                <table class="table">
                  <tbody>
                    <s:iterator value="#session.mytutors">
                      <tr>
                        <td><a href="#" class="pull-left"> <img class="media-object" data-src="holder.js/26x26" src="../headimg/<s:property value='user.picture'/>" style="width:26px; height:26px;"/> </a></td>
                        <td><p class="text-info">
                            <s:property value="user.lastName"/>
                            <s:property value="user.firstName"/>
                          </p></td>
                        <td style="padding-top:10px;"><a href="TutorInfo?userid=<s:property value='user.id'/>"><i class="icon-circle-arrow-right"></i></a></td>
                      </tr>
                    </s:iterator>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="accordion-group">
            <div class="accordion-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">我的课程</a> </div>
            <div id="collapseTwo" class="accordion-body collapse">
              <div class="accordion-inner">
                <table class="table">
                  <tbody>
                      <s:iterator value="#session.mycourses">
                    
                      <s:if test="time<endTime&&status==1">
                    
                    <s:if test="startTime<time&&endTime>time">
                      <tr class="success"> 
                    </s:if>
                    <s:else>
                      <tr> 
                    </s:else>
                  <td><s:property value="name"/></td>
                    <td><s:if test="startTime<time&&endTime>time">
                        <button class="btn btn-mini btn-success" onclick="takeclass(<s:property value='id'/>)">上课</button>
                      </s:if>
                      <s:else>
                        <button class="btn btn-mini" disabled="disabled">上课</button>
                      </s:else></td>
                    <td><p class="text-warning">
                        <s:date name="startTime" format="yyyy-MM-dd HH:mm:ss" />
                        ~
                        <s:date name="endTime" format="HH:mm:ss" />
                      </p></td>
                  </tr>
                    </s:if>
                  
                    </s:iterator>
                  
                    </tbody>
                  
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script>
<script type="text/javascript" src="js/ajax-pushlet-client.js"></script> 
<script>PL.userid='<s:property value="#session.user.id" />';</script>
<script src='/OnlineTutoringSystem/dwr/engine.js'></script> 
<script src='/OnlineTutoringSystem/dwr/interface/handleapplicationaction.js'></script> 
<script type="text/javascript" src="js/push.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script>
function takeclass(id)
{
	window.location.href='StartCourse.html?courseid='+id;
}
</script>
</body>
</html>