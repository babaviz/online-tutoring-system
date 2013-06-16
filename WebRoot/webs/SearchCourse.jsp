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
</div>
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
    <ul id="myTab" class="nav nav-tabs">
      <li><a href="#home" data-toggle="tab">首页</a></li>
      <li class="active"><a href="#tab_20" data-toggle="tab"><div>第二页</div><img src="images/closebtn.png" longdesc="close" class="closetabbtn" onMouseOver="this.src='images/closebtn_hover.png'" onMouseOut="this.src='images/closebtn.png'" onClick="delTab();"/></a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade" id="home" >
        <table id="simple_search" width="431" border="0">
          <tr>
            <td width="152" height="243"><div id="course_list">
                <div onClick="selectCategory();" class="name_in_list activecourse">不限类别</div>
                <div onClick="selectCategory();" class="name_in_list">计算机</div>
                <div onClick="selectCategory();" class="name_in_list">语文</div>
                <div onClick="selectCategory();" class="name_in_list">数学</div>
                <div onClick="selectCategory();" class="name_in_list">英语</div>
                <div onClick="selectCategory();" class="name_in_list">物理</div>
                <div onClick="selectCategory();" class="name_in_list">化学</div>
                <div onClick="selectCategory();" class="name_in_list">历史</div>
                <div onClick="selectCategory();" class="name_in_list">地理</div>
                <div onClick="selectCategory();" class="name_in_list">政治</div>
                <div onClick="selectCategory();" class="name_in_list">生物</div>
              </div></td>
            <td width="269"><table style=" margin-left:10px;" width="100%" height="237" border="0">
                <tr>
                  <td height="42"><input class="input-xlarge" id="searchCourseName" type="text" placeholder="在课程名中搜索" style="font-family:KaiTi;font-size:23px;height:30px;padding-top:10px;"></td>
                </tr>
                <tr>
                  <td height="42"><input class="input-xlarge" id="searchTeacherName" type="text" placeholder="在教师名中搜索" style="font-family:KaiTi;font-size:23px;height:30px;padding-top:10px;"></td>
                </tr>
                <tr>
                  <td height="42"><input class="input-xlarge" id="searchDescription" type="text" placeholder="在课程简介中搜索" style="font-family:KaiTi;font-size:23px;height:30px;padding-top:10px;"></td>
                </tr>
                <tr>
                  <td height="41"><button class="btn btn-primary btn-large" style=" padding-left:116px;padding-right:116px;font-family:KaiTi;font-size:23px;" onClick="createTab(0);">搜索</button></td>
                </tr>
              </table></td>
          </tr>
        </table>
        <div id="adv_search_bar" onclick="showAdvancedSearch();"><img src="images/adv_search_bar_c.png" /><img src="images/adv_search_bar_d.png" style="display:none;" /></div>
        <div id="adv_search_content">
          <table id="adv_search_table_1" border="0">
            <tr>
              <td class="text_tr">学&nbsp;&nbsp;&nbsp;&nbsp;科</td>
              <td><div class="btn-group" style="margin-top:-10px;">
                  <button id="adv_courseBtn" class="btn btn-small" style="width:139px; height:30px;">不限类别</button>
                  <button class="btn btn-small dropdown-toggle" data-toggle="dropdown" style="height:30px"><span class="caret" style="margin-bottom:8px;"></span></button>
                  <ul class="dropdown-menu">
                    <li><a onClick="adv_selectCourse();">不限类别</a></li>
                    <li><a onClick="adv_selectCourse();">计算机</a></li>
                    <li><a onClick="adv_selectCourse();">语文</a></li>
                    <li><a onClick="adv_selectCourse();">数学</a></li>
                    <li><a onClick="adv_selectCourse();">英语</a></li>
                    <li><a onClick="adv_selectCourse();">物理</a></li>
                    <li><a onClick="adv_selectCourse();">化学</a></li>
                    <li><a onClick="adv_selectCourse();">历史</a></li>
                    <li><a onClick="adv_selectCourse();">地理</a></li>
                    <li><a onClick="adv_selectCourse();">政治</a></li>
                    <li><a onClick="adv_selectCourse();">生物</a></li>
                  </ul>
                </div></td>
              <td class="text_tr">开始时间</td>
              <td><div class="controls input-append date form_datetime" data-date="2013-05-27T08:30:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                  <input id="adv_start_time" size="16" type="text" value="" readonly>
                  <span class="add-on"><i class="icon-remove"></i></span> <span class="add-on"><i class="icon-th"></i></span> </div></td>
            </tr>
            <tr>
              <td class="text_tr">课程名称</td>
              <td><input id="adv_search_name" class="input-medium" type="text" placeholder=""></td>
              <td class="text_tr">上课时长</td>
              <td ><input id="adv_time_f" class="input-medium" type="text" placeholder="" onkeyup="value=value.replace(/[^\d]/g, '')" onchange="value=value.replace(/[^\d]/g, '')" style="width:50px; float:left;">
                <div style="color:#858585;font-weight:600;font-family:SimHei;font-size:20px; margin-top:3px; margin-left:5px; width:15px;float:left;text-align:center;">-</div>
                <input id="adv_time_t" class="input-medium" type="text" placeholder="" onkeyup="value=value.replace(/[^\d]/g, '')" onchange="value=value.replace(/[^\d]/g, '')" style="width:50px; float:left; margin-left:5px;">
                <div style="color:#858585;font-weight:600;font-family:SimHei;font-size:20px; margin-left:2px;float:left;">分钟</div></td>
            </tr>
            <tr>
              <td class="text_tr">课程简介</td>
              <td><input class="input-medium" type="text" id="adv_description" placeholder=""></td>
              <td class="text_tr">价&nbsp;&nbsp;&nbsp;&nbsp;格</td>
              <td><input id="adv_price_f" class="input-medium" type="text" placeholder="" onkeyup="value=value.replace(/[^\d]/g, '')" onchange="value=value.replace(/[^\d]/g, '')" style="width:50px; float:left;">
                <div style="color:#858585;font-weight:600;font-family:SimHei;font-size:20px; margin-top:3px; margin-left:5px; width:15px;float:left;text-align:center;">-</div>
                <input id="adv_price_t" class="input-medium" type="text" placeholder="" onkeyup="value=value.replace(/[^\d]/g, '')" onchange="value=value.replace(/[^\d]/g, '')" style="width:50px; float:left; margin-left:5px;">
                <div style="color:#858585;font-weight:600;font-family:SimHei;font-size:20px; margin-top:3px; margin-left:6px;float:left;">元</div></td>
            </tr>
            <tr>
              <td class="text_tr">教师名字</td>
              <td><input class="input-medium" type="text" id="adv_tutor_name" placeholder=""></td>
              <td class="text_tr">教师简介</td>
              <td><input class="input-medium" type="text" id="adv_tutor_description" placeholder="" style="width:140px;"></td>
            </tr>
            <tr>
              <td class="text_tr">教师评分</td>
              <td><div class="btn-group dropup" style="margin-top:-10px;">
                  <button id="adv_evalBtn" class="btn btn-small" style="width:139px; height:30px;">0.0分以上</button>
                  <button class="btn btn-small dropdown-toggle" data-toggle="dropdown" style="height:30px"><span class="caret" style="margin-bottom:8px;"></span></button>
                  <ul class="dropdown-menu">
                    <li><a onClick="adv_selectEval();">5.0分以上</a></li>
                    <li><a onClick="adv_selectEval();">4.0分以上</a></li>
                    <li><a onClick="adv_selectEval();">3.0分以上</a></li>
                    <li><a onClick="adv_selectEval();">2.0分以上</a></li>
                    <li><a onClick="adv_selectEval();">1.0分以上</a></li>
                    <li><a onClick="adv_selectEval();">0.0分以上</a></li>
                    <li><a onClick="adv_selectEval();">自定义</a></li>
                  </ul>
                </div></td>
              <td class="text_tr"><button class="btn btn-primary" style=" padding-left:22px;padding-right:22px;margin-top:-15px;font-family:SimHei;font-size:20px;" onClick="createTab(1);">搜索</button></td>
              <td></td>
            </tr>
          </table>
        </div>
      </div>
      <div id="tab_20" class="tab-pane fade in active"  style="overflow:hidden">
        <div class="search_factors">
          <div class="one_factor">类别：计算机</div>
          <div class="one_factor">课名：移动应用开发</div>
          <div class="one_factor">价格：小于120元</div>
          <div class="one_factor">开始时间：2013年6月20日之后</div>
          <div class="one_factor">教师简介：很牛逼 很帅 很高端</div>
          <div class="one_factor">教师名字：潘</div>
        </div>
        <div class="one_result">
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
          <div class="course_description">适合对手机软件开发有浓厚兴趣，并且有良好软件开发经验者。适合需要跳槽以及转换手机开发平台的学员。教师由上海交通大学继续教育学院E-learning Lab实验室，iPhone项目团队提供，该团队长期致力于iPhone / iPod Touch游戏开发，得到美国天使风险投资支持。目前已开发出多款游戏（如iHorse、iDomino、iCheese、BeerDuel、Magic Fluid、Orient Brush、FarmLand），其中，1款免费游戏(多米诺骨牌欣赏版，iDomino Lite)全球下载量超过100万，另1款农庄游戏(农家乐，FarmLand)全球下载量超过10万</div>
        </div>
        <div class="one_result">
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
          <div class="course_description">适合对手机软件开发有浓厚兴趣，并且有良好软件开发经验者。适合需要跳槽以及转换手机开发平台的学员。教师由上海交通大学继续教育学院E-learning Lab实验室，iPhone项目团队提供，该团队长期致力于iPhone / iPod Touch游戏开发，得到美国天使风险投资支持。目前已开发出多款游戏（如iHorse、iDomino、iCheese、BeerDuel、Magic Fluid、Orient Brush、FarmLand），其中，1款免费游戏(多米诺骨牌欣赏版，iDomino Lite)全球下载量超过100万，另1款农庄游戏(农家乐，FarmLand)全球下载量超过10万</div>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="down_right_content"></div>
<div id="copy_statement">版权所有</div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="js/search.js"></script> 
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
</body>
</html>