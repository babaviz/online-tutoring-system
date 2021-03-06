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
<link href="css/outerframe.css" rel="stylesheet" type="text/css" />
<link href="css/topic.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<script src="js/launchtopic.js" charset="UTF-8"></script>
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
        <li class="active"><a href="AllTopics">BBS</a></li>
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
    <div class="row">
      <div class="span3 bs-docs-sidenav dropdown"> 
        <!--Sidebar content-->
        <ul class="affix bs-docs-sidenav nav nav-list" role="menu" aria-labelledby="dLabel">
          <li><a href="AllTopics">帖子全览</a></li>
          <li><a href="MyTopics">我的帖子</a></li>
          <li class="active"><a href="MakeTopic">发表帖子</a></li>
          
        </ul>
      </div>
      <div class="span9"> 
        <!--Body content-->
        <s:form action="LaunchTopicAction" method="post" enctype="multipart/form-data" id="launchform">
          <legend>我要发起话题</legend>
          <input type="text" placeholder="标题" name="title" id="title"/>
          <textarea rows="6" style="width:100%" name="content"></textarea>
          <a class="btn btn-link btn-small" style="margin-left:0" data-toggle="modal" href="javascript:test();">分类</a> <a class="btn btn-link btn-small" style="margin-left:0" href="javascript:pictureReveal();">图片</a> <a class="btn btn-link btn-small" style="margin-left:0" href="javascript:fileReveal();">上传文件</a>
          <div id="picture" class="model hide well" style="display:none;width:250px;left:30%;padding:0;">
            <div class="modal-header">
              <button class="close" type="button" onclick="closePicture()">×</button>
              <h5 id="pictureLabel">图片上传</h5>
            </div>
            <div class="modal-body" style="height:50px"> <a class="btn" href="javascript:showDlg();">本地上传</a>
              <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
              <input id="pictureopen" type="file" name="picture" style="height:0;width:0;display:block" onchange=""/>
            </div>
          </div>
          <div id="filedlg" class="model hide well" style="display:none;width:250px;left:30%;padding:0;">
            <div class="modal-header">
              <button class="close" type="button" onclick="closeFile()">×</button>
              <h5 id="pictureLabel">附件上传</h5>
            </div>
            <div class="modal-body" style="height:50px"> <a class="btn" href="javascript:showDlg2();">本地上传</a>
              <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
              <input id="fileopen" type="file" name="file" style="height:0;width:0;display:block" onchange=""/>
            </div>
          </div>
          <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;width:250px;left:60%;">
            <div class="modal-header">
              <button type="button" class="close"  onclick="closeTypeDlg()">×</button>
              <h3 id="myModalLabel">分类</h3>
            </div>
            <div class="modal-body">
              <select multiple="multiple" id="choosetype" name="type">
                <option>计算机</option>
                <option>数学</option>
                <option>英语</option>
                <option>语文</option>
                <option>物理</option>
                <option>化学</option>
                <option>地理</option>
                <option>生物</option>
                <option>历史</option>
                <option>政治</option>
              </select>
            </div>
            <div class="modal-footer">
              <button class="btn btn-primary"  onclick="defineType()"  type="button">确定</button>
            </div>
          </div>
          <s:token/>
          <button type="button" class="btn" onclick="checkInfo()">提交话题</button>
        </s:form>
      </div>
    </div>
  </div>
</div>
<div class="footer " style="margin-top:400px;">
  <div class="container">
    <p>copyright © 2013</p>
  </div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript">
function test()
{
	
	$('#myModal').modal('show');
}

function pictureReveal()
{
	$("#picture").css("display","block");
}

function fileReveal()
{
	$("#filedlg").css("display","block");
}

function showDlg()
{
	$("#pictureopen").click();
}

function showDlg2()
{
	$("#fileopen").click();
}

function closePicture()
{
	$("#picture").css("display","none");
}

function closeFile()
{
	$("#filedlg").css("display","none");
}

function closeTypeDlg()
{
	$("#myModal").modal('hide');
}

function defineType()
{
	//alert($("#choosetype option:selected").text());
	$("#myModal").modal('hide');
}

</script>
<script type="text/javascript" src='js/common.js'></script> 
<script type="text/javascript" src="js/ajax-pushlet-client.js"></script> 
<script>PL.userid='<s:property value="#session.user.id" />';</script>
<script type="text/javascript" src="js/push.js"></script>
</body>
</html>