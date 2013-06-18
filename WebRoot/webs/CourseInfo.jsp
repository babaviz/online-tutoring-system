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
  <s:property value="#course_name"/>
  </div>
  <div class="bkbd_content" id="tutor_name_bkbd" onclick="toUser(3);">
  老师：<s:property value="#tutor_name"/>
  </div>
  </div>
  <s:if test="#session.user.type=='1'">
  <s:set name="flag" value="0"/>
  <s:if test="#course.student==null">
                            <s:iterator value="#session.user.student.applications">
                              <s:if test="id==#course.id">
                                <s:set name="flag" value="1"/>
                              </s:if>
                            </s:iterator>
                            <s:if test="#flag==0">
  <button type="button" class="btn btn-success control_course_btn" id="apply_course" onclick="apply_course(<s:property value='#course.id'/>,<s:property value='#course.tutor.id'/>);">申请该课</button>
  </s:if>
  
  <s:if test="#flag==1">
   <button type="button" class="btn btn-info control_course_btn" id="cancel_application" onclick="cancel_application();">取消申请</button>
   </s:if>
   </s:if>
   </s:if>
   <s:set name="flag" value="0"/>
   <s:if test="#session.user.type=='2'">
   <s:if test="#course.student!=null">
   <s:iterator value="#session.user.tutor.courses">
                              <s:if test="id==#root[1].id">
                                <s:set name="flag" value="1"/>
                              </s:if>
                            </s:iterator>
                            <s:if test="#flag==1">
    <button type="button" class="btn btn-danger control_course_btn" id="delete_course" onclick="delete_course();">删除该课</button>
  </s:if>
  </s:if>
  </s:if>
  <div id="course_detail_label" class="detail_under_bkbd theLabel">课程信息</div>
  <div id="start_time_detail" class="detail_under_bkbd theContent">开始时间：<s:date name="#course.startTime" format="yyyy-MM-dd HH:mm:ss" /></div>
  <div id="duration_detail" class="detail_under_bkbd theContent">课程时长：<s:property value="#course.duration"/>分钟</div>
  <div id="course_type_detail" class="detail_under_bkbd theContent">类&nbsp;&nbsp;&nbsp;&nbsp;别：<s:property value="#course.subject.name"/></div>
  <div id="course_description_detail" class="detail_under_bkbd theContent">简&nbsp;&nbsp;&nbsp;&nbsp;介：<s:property value="#course.description"/></div>
  <div id="tutor_detail_label" class="detail_under_bkbd theLabel">教师信息</div>
  <div id="tutor_name_detail" class="detail_under_bkbd theContent" onclick="toUser(3);">姓名：<s:property value="#tutor_name"/></div>
  <div id="tutor_eval_detail" class="detail_under_bkbd theContent">评分：<s:property value="tutor_eval"/></div>
  <div id="tutor_description_detail" class="detail_under_bkbd theContent">简介：<s:property value="tutor_description"/></div>
  </div>
</div>
<div id="down_right_content">
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
<script>PL.userid='<s:property value="#session.user.id" />';</script>
<script type="text/javascript" src="js/push.js"></script>
<script src='/OnlineTutoringSystem/dwr/interface/applycourseaction.js'></script> 
<script type="text/javascript">
function apply_course(courseid,tutorid)
{
	//alert(tutorid);
	applycourseaction.applyForCourse(courseid,tutorid,applyCourseCallBack);
}


function applyCourseCallBack(msg)
{
	if(msg=="ok")
	{
		alert("申请成功");
		
		$("#applybtn").attr("disabled","disabled");
		$("#applybtn").html("已申");
		//$("#applybtn").removeClass("btn-success");
	}
}
</script>
</body>
</html>