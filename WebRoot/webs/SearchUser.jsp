﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link href="css/outerframe.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/datetimepicker.css" rel="stylesheet" media="screen">
<title>无标题文档</title>
</head>

<body style="background:url(images/mainbackground.jpg)">
<div id="templates" style="display:none">
  <div id="oneResultTemplate" class="one_result">
    <div class="up_left_content">
      <div class="course_name_label">课名：</div>
      <div class="course_name">移动应用开发</div>
      <div class="tutor_name_label">老师：</div>
      <div class="tutor_name">潘岩</div>
      <div class="clean"></div>
      <div class="course_type_label">类别：</div>
      <div class="course_type">计算机</div>
      <div class="course_price_label">价格：</div>
      <div class="course_price">100元</div>
      <div class="clean"></div>
      <div class="start_time_label">开始时间：</div>
      <div class="course_start_time">2013年6月28日</div>
      <div class="course_duration_label">时长：</div>
      <div class="course_duration">120分钟</div>
    </div>
    <div class="tutor_img"></div>
    <div class="clean"></div>
    <div class="course_description_label">课程简介：</div>
    <div class="course_description"></div>
  </div>
  <div id="factorTemplate" class="one_factor"></div>
  <li id="tabTemplate" ><a href="#tabContentTemplate" data-toggle="tab"><div></div><img src="images/closebtn.png" longdesc="close" class="closetabbtn" onMouseOver="this.src='images/closebtn_hover.png'" onMouseOut="this.src='images/closebtn.png'" onClick="delTab();"/></a></li>
  <div id="tabContentTemplate" class="tab-pane fade"  style="overflow:hidden">
    <div class="search_factors"></div>
  </div>
  <div id="customized_eval">
    <input class="input-mini" type="text" placeholder="x.x" style="height:20px;margin-top:-3px;margin-left:5px;margin-right:5px; padding-left:20px;padding-right:20px;width:20px; float:left;">
    <div style="margin-top:2px;">分以上</div>
  </div>
  <div id="tutor_result_template" class="one_result_tutor">
    <div class="user_img"></div>
    <div class="result_right_content">
      <div class="name">潘岩</div>
      <div class="gender_img"></div>
      <div class="user_type">老师</div>
      <div class="user_point">积分：1200</div>
      <div class="tutor_subjects">授课类型：语文 数学 英语 物理 化学 计算机 生物 历史 地理 政治 新能源 机械 医学</div>
      <div class="tutor_description">老师简介：这是位非常屌非常牛逼非常屌非常牛逼非常屌非常牛逼非常屌非常牛逼非常屌非常牛逼非常屌非常牛逼非常屌非常牛逼非常屌非常牛逼的老师</div>
    </div>
  </div>
  <div id="stu_result_template" class="one_result_stu">
          <div class="user_img"></div>
          <div class="result_right_content">
            <div class="name">潘岩</div>
            <div class="gender_img"></div>
            <div class="user_type">学生</div>
            <div class="stu_grade">年级：大二</div>
            <div class="user_point">积分：1200</div>
          </div>
   </div>
</div>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="brand" href="#">零距离家教</a>
      <ul class="nav">
        <li><a href="Index">首页</a></li>
        <li><a href="SearchCourse">搜课</a></li>
        <li class="active"><a href="SearchUser">搜人</a></li>
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
    <ul id="myTab" class="nav nav-tabs">
      <li class="active"><a href="#home" data-toggle="tab">首页</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade in active" id="home" >
        <div id="searchUserMainField">
          <input class="input-xlarge" id="searchUserInput" type="text" placeholder="请输入您要找的人" style="font-family:KaiTi;font-size:23px;height:30px;width:400px;padding-top:10px;">
          <button class="btn btn-primary btn-large" style=" padding-left:90px;padding-right:90px;margin-left:90px;font-family:KaiTi;font-size:23px;" onClick="searchUserAction();">搜索</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
<div id="down_right_content">
<s:if test="#session.user.type=='1'">
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
        </s:if>
        <s:else>
        <div class="accordion" id="accordion2">
          <div class="accordion-group">
            <div class="accordion-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">我的课程</a> </div>
            <div id="collapseTwo" class="accordion-body collapse">
              <div class="accordion-inner">
                <table class="table">
                  <tbody>
                      <s:iterator value="#session.user.tutor.courses">
                    
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
        </s:else>
</div>
<div id="copy_statement">版权所有</div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="js/search.js"></script> 
<script language="javascript" type="text/javascript" src="js/common.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.js"></script> 
<script language="javascript">
function test()
{
	$("#myTab li:eq(2) a").tab('show');
	$("#myTab li:eq(3)").remove();
	$("#tab_3").remove();
	//$("#myTabContent #tab_3").parent().remove();
}
function test2()
{
//	$("#myTab li:eq(2) a").tab('show');
//	$("#myTab li:eq(3)").remove();
	$("#tab_3").remove();
}
</script> 
<script type="text/javascript">

    $(".form_datetime").datetimepicker({
        format: "yyyy-mm-dd hh:ii",
        showMeridian: true,
        autoclose: true,
        todayBtn: true,
		pickerPosition: "bottom-left"
    });

</script> 
<script src='/OnlineTutoringSystem/dwr/engine.js'></script> 
<script src='/OnlineTutoringSystem/dwr/interface/searchAction.js'></script> 
<script src='/OnlineTutoringSystem/dwr/interface/searchFactors.js'></script>

<script type="text/javascript" src="js/ajax-pushlet-client.js"></script> 
<script>PL.userid='<s:property value="#session.user.id" />';</script>
<script type="text/javascript" src="js/push.js"></script>
</body>
</html>