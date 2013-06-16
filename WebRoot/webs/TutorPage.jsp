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
<body style="background:url(images/mainbackground.jpg)">
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
      <div class="base2">Email：<s:property value="email"/></div>
      <div class="base2">Phone：<s:property value="phone"/></div>
      <div class="base">教师简介</div>
      <div class="demo_line_02"></div>
      <div class="base2"><div class="intro_length"><s:property value="tutor.description"/></div></div>
      </div>
  
  
  
  
  <div class = "margin_left_top">
<div class="span5">
        <div class="accordion" id="accordion2">
          <div class="hehe2">
            <div class="accordion-heading"> 
             <div class="base"> 开设课程</div>
            <div id="collapseTwo" class="accordion-body collapse in">
              <div class="">
                <table class="table">
                  <tbody>
                  <s:iterator value="tutor.courses">
                    
                      <s:if test="startTime>time&&student==null">
                  	<tr>
                      <td><div class="word_length"><a href="#"><s:property value="name"/></a></div></td>
                      <td>
                      <s:set name="flag" value="0"/>
                            <s:iterator value="#session.user.student.applications">
                              <s:if test="id==#root[1].id">
                                <s:set name="flag" value="1"/>
                              </s:if>
                            </s:iterator>
                            <s:if test="#flag==0">
                      <div class="margin"><button class="btn btn-success" onclick="applyCourse(<s:property value='id'/>,<s:property value='#root[1].tutor.id'/>)" id="applybtn">申请</button></div>
                      </s:if>
                            <s:else>
                            <div class="margin"><button class="btn btn-success" disabled="disabled" id="applybtn">已申</button></div>
                            </s:else>
                      </td>
                      <td><p class="text-warning"><s:date name="startTime" format="yyyy-MM-dd HH:mm:ss" />~<s:date name="endTime" format="HH:mm:ss" /></p></td>
                      <td><p class="text-error">学费：<s:property value="price"/>元</p></td>
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
  
  <div id="down_right_content"></div>
  
</div>






<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script> 
<script type="text/javascript" src="js/ajax-pushlet-client.js"></script> 
<script type="text/javascript">
		PL.userid='<s:property value="#session.user.id" />';
		PL._init();
		PL.joinListen("/tutoring/numberofnotice");
		function onData(event)
		{
			//alert(event.get("he"));
			if(event.get("numberofnotice")!=0)
			{
				//alert(event.get("numberofnotice"));
				$("#message").html('<i class="icon-envelope"></i>消息<span class="badge badge-important">'+event.get("numberofnotice")+'</span>');
			}
			else
			{
				$("#message").html('<i class="icon-envelope"></i>消息</a>');
			}
			if(event.get("numberofcoursenotice")!=0)
			{
				//alert(event.get("numberofnotice"));
				$("#coursemsg").html('课程信息<span class="badge badge-important">'+event.get("numberofcoursenotice")+'</span>');
			}
			else
			{
				$("#coursemsg").html('课程信息');
			}
			if(event.get("numberoffriendnotice")!=0)
			{
				//alert(event.get("numberofnotice"));
				$("#friendmsg").html('好友信息<span class="badge badge-important">'+event.get("numberoffriendnotice")+'</span>');
			}
			else
			{
				$("#friendmsg").html('好友信息');
			}
			if(event.get("numberofchatnotice")!=0)
			{
				//alert(event.get("numberofnotice"));
				$("#chatmsg").html('私信<span class="badge badge-important">'+event.get("numberofchatnotice")+'</span>');
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
<script src='/OnlineTutoringSystem/dwr/engine.js'></script> 
<script src='/OnlineTutoringSystem/dwr/interface/applycourseaction.js'></script> 
<script type="text/javascript">
function applyCourse(courseid,tutorid)
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
