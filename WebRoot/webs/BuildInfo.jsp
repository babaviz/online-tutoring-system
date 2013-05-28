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
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<title>无标题文档</title>
</head>

<body style="background:url(images/mainbackground.jpg)">

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
    <a class="brand" href="#">零距离家教</a>
      <ul class="nav">
        <li><a href="Index">首页</a></li>
        <li><a href="#">课程管理</a></li>
        <li><a href="Search">找老师</a></li>
        <li><a href="AllTopics">BBS</a></li>
        <li><a href="Chatting">聊天</a></li>
        <li><a href="flash/OnlineTutorPlayer.html">上课</a></li>
      </ul>
      <ul class="nav pull-right">
    	<li class="active"><a href="BuildInfo"><i class="icon-user"></i>个人设置</a></li>
    	<li><a href="#"><i class="icon-envelope"></i>消息</a></li>
    	<li><a href="#"><i class="icon-off"></i>登出</a></li>
    </ul>
       </div>
  </div>
</div>



<div id="down_content" class="container" style="margin-top:20px;">
<div id="down_left_content">
    <div style="margin-left: auto; margin-right: auto; width: 700px;">     
        <legend>个人信息</legend>
        <!-- 左导航栏-->
        <div style="width:160px; float:left;">
          <div style="width:150px; height:150px;"> <img src="holder.js/150x150"/> </div>
          <ul class="nav nav-pills nav-stacked">
            <label><a>积分</a></label>
            <li class="active" onclick="toinformation()" id="information1"><a>基本信息</a></li>
            <li onclick="tohead_pic()" id="head_pic1"><a>头像</a></li>
            <li onclick="tocard()" id="card1"><a>信用卡</a></li>
            <li onclick="topassword()" id="password1"><a>修改密码</a></li>
          </ul>
        </div>
        <div style="margin-left:160px;width:540px">
        <!-- 基本信息页面-->
        <div id="information">
        <form class="form-horizontal">
          <fieldset class="control-group">
            <div class="control-group">
              <label class="control-label" for="input01">邮箱</label>
              <div class="controls">
                <div style="margin-top:5px">
                  <label><s:property value="#session.user.email"/></label>
                </div>
              </div>
            </div>
            <div class="control-group disabled">
              <label class="control-label" for="input01">姓</label>
              <div class="controls">
                <input type="text" class="input-large" placeholder="输入您的姓" id="input01" value='<s:property value="#session.user.firstName"/>'/>
              </div>
            </div>
            <div class="control-group disabled">
              <label class="control-label" for="input01">名</label>
              <div class="controls">
                <input type="text" class="input-large" placeholder="输入您的名" id="input01" value='<s:property value="#session.user.lastName"/>'/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input01">性别</label>
              <div class="controls">
                <label class="radio inline">
                  <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked/>
                  男 </label>
                <label class="radio inline">
                  <input type="radio" name="optionsRadios" id="optionsRadios2" value="option1"/>
                  女 </label>
                <label class="radio inline">
                  <input type="radio" name="optionsRadios" id="optionsRadios3" value="option1"/>
                  保密 </label>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input01">电话</label>
              <div class="controls">
                <input type="text" class="input-large" placeholder="请输入您的手机号码" id="input01"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input01">生日</label>
              <div class="controls">
                <input type="text" class="input-large" placeholder="yyyy-mm-dd" id="input01"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input01">学校</label>
              <div class="controls">
                <input type="text" class="input-large" placeholder="请输入您在读的学校" id="input01"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input01">个人简介</label>
              <div class="controls">
                <textarea rows="6" style="width:80%" placeholder="一句话介绍一下自己吧，让别人更了解你"></textarea>
              </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <button type="submit" class="btn btn-primary">保存</button>
              </div>
            </div>
          </fieldset>
        </form>
      </div>
      	<!-- 头像页面-->
        <div style="margin-top:30px; margin-left:200px; display:none" id="head_pic">
        <form action="">
        	<div style="width:160px; height:160px;"> 
        		<img data-src="holder.js/150x150"/>
         	</div>
         	<input type="file"/>
         	<button class="btn btn-primary" type="submit">上传头像</button>
         </form>
        </div>
      	<!-- 信用卡页面-->
      	<div style="margin-top:80px; display:none" id="card">
        <form class="form-horizontal">
          <fieldset class="control-group">
            <div class="control-group">
              <label class="control-label" for="input01">请输入原卡号</label>
              <div class="controls">
                <input type="text" class="input-large" placeholder="原卡号" id="input01"/>
                <span class="help-inline">卡号不能为空！</span> </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input01">新卡号</label>
              <div class="controls">
                <input type="text" class="input-large"  id="input01"/>
              </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <button type="submit" class="btn btn-primary">保存</button>
              </div>
            </div>
          </fieldset>
        </form>
      	</div>
      <!-- 修改密码页面-->
      <div style="margin-top:80px; display:none" id="password">
        <form class="form-horizontal">
          <fieldset class="control-group">
            <div class="control-group">
              <label class="control-label" for="input01">请输入原密码</label>
              <div class="controls">
                <input type="password" class="input-large" id="input01"/>
                <span class="help-inline">密码不能为空！</span> </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input01">新密码</label>
              <div class="controls">
                <input type="password" class="input-large"  id="input01"/>
                <span class="help-inline">密码强度不够！</span> </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="input01">重复新密码</label>
              <div class="controls">
                <input type="password" class="input-large"  id="input01"/>
                <span class="help-inline">两次密码输入不同！</span> </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <button type="submit" class="btn btn-primary">保存</button>
              </div>
            </div>
          </fieldset>
        </form>
      </div>
    </div>
	
	</div>
</div>


<div id="down_right_content"></div>
</div>



<div class="footer " style="margin-top:100px;">
  <div class="container">
    <p>copyright © 2013</p>
  </div>
</div>


<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script> 
<script language="javascript" type="text/javascript">
  function test()
  {
      
      $('#myModal').modal('show');
  }
  function toinformation()
{
	$("#card").css("display","none");
	$("#card1").removeClass("active");
	$("#head_pic").css("display","none");
	$("#head_pic1").removeClass("active");
	$("#password").css("display","none");
	$("#password1").removeClass("active");
	$("#information").css("display","block");
	$("#information1").addClass("active");
}
  function tocard()
{
	$("#information").css("display","none");
	$("#information1").removeClass("active");
	$("#head_pic").css("display","none");
	$("#head_pic1").removeClass("active");
	$("#password").css("display","none");
	$("#password1").removeClass("active");
	$("#card").css("display","block");
	$("#card1").addClass("active");
}
    function topassword()
{
	$("#information").css("display","none");
	$("#information1").removeClass("active");
	$("#head_pic").css("display","none");
	$("#head_pic1").removeClass("active");
	$("#card").css("display","none");
	$("#card1").removeClass("active");
	$("#password").css("display","block");
	$("#password1").addClass("active");
}
  function tohead_pic()
{
	$("#information").css("display","none");
	$("#information1").removeClass("active");
	$("#card").css("display","none");
	$("#card1").removeClass("active");
	$("#password").css("display","none");
	$("#password1").removeClass("active");
	$("#head_pic").css("display","block");
	$("#head_pic1").addClass("active");
}


  </script>
</body>
</html>
