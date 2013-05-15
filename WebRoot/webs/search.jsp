﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
<title>无标题文档</title>
</head>

<body>
<div id="templates" style="display:none">
  <li id="tabTemplate" ><a href="#tabContentTemplate" data-toggle="tab"><img src="images/closebtn.png" longdesc="close" class="closetabbtn" onmouseover="this.src='images/closebtn_hover.png'" onmouseout="this.src='images/closebtn.png'" onclick="delTab(this);"/></a></li>
  <div id="tabContentTemplate" class="tab-pane fade"  style="overflow:hidden">
    <p>CCCCCC</p>
  </div>
</div>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="brand" href="#">零距离家教</a>
      <ul class="nav">
        <li><a href="#">首页</a></li>
        <li><a href="#">课程管理</a></li>
        <li  class="active"><a href="search.jsp">找老师</a></li>
      	<li><a href="AllTopics.jsp">BBS</a></li>
      	<li><a href="chatting.html">聊天</a></li>
      	<li><a href="flash/OnlineTutorPlayer.html">上课</a></li>
      </ul>
    </div>
  </div>
</div>
<div id="down_content">
  <ul id="myTab" class="nav nav-tabs">
    <li class="active"><a href="#home" data-toggle="tab">首页</a></li>
  </ul>
  <div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="home" style="overflow:hidden">
      
      <table id="simple_search" width="431" border="0">
  <tr>
    <td width="152" height="243"><div id="course_list">
        <div onclick="selectCategory(this);" class="name_in_list activecourse">计算机</div>
        <div onclick="selectCategory(this);" class="name_in_list">语文</div>
        <div onclick="selectCategory(this);" class="name_in_list">数学</div>
        <div onclick="selectCategory(this);" class="name_in_list">英语</div>
        <div onclick="selectCategory(this);" class="name_in_list">物理</div>
        <div onclick="selectCategory(this);" class="name_in_list">化学</div>
        <div onclick="selectCategory(this);" class="name_in_list">历史</div>
        <div onclick="selectCategory(this);" class="name_in_list">地理</div>
        <div onclick="selectCategory(this);" class="name_in_list">政治</div>
        <div onclick="selectCategory(this);" class="name_in_list">生物</div>
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
        <td height="41"><button class="btn btn-primary btn-large" style=" padding-left:116px;padding-right:116px;font-family:KaiTi;font-size:23px;" onclick="createTab();">搜索</button></td>
      </tr>
    </table></td>
  </tr>
</table>

    </div>
  </div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="js/search.js"></script> 
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
<!--<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>-->
</body>
</html>
