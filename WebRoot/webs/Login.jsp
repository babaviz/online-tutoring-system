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
<link href="css/outerframe.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<title>无标题文档</title>
<style type="text/css">
.back_1 {
	background:url(images/mainbackground.jpg) no-repeat;
}
.clear{clear:both}
#outerframe {
	margin-left: auto;
	margin-right: auto;
	width: 800px;
}
.mybt{
	font-family:KaiTi;
	color:#00F;
	border:0px;
	width:200px; 
	height:115px;
	font-size:xx-large;
	}
</style>
<script src='/OnlineTutoringSystem/dwr/engine.js'></script>
<script src='/OnlineTutoringSystem/dwr/interface/loginaction.js'></script>
<script src='/OnlineTutoringSystem/dwr/interface/registeraction.js'></script>
<script type="text/javascript">
	function loginBySession()
	{
		loginaction.CanLoginDirectly(callback);
	}
	function callback(msg)
	{
		//alert(msg);
		if(msg=="ok")
		{
			window.location.href="AllTopics.jsp";
		}
	}
	
</script>
</head>

<body class="back_1">

<div style="margin-top:100px">
  <div class="container">
    <div id="outerframe">
    <img src="images/title.png" />
      <div style="width:600px; height:345px;float:left;" id="intro">
        <div id="myCarousel" class="carousel slide">
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1" class=""></li>
            <li data-target="#myCarousel" data-slide-to="2" class=""></li>
            <li data-target="#myCarousel" data-slide-to="3" class=""></li>
          </ol>
          <div class="carousel-inner">
            <div class="item active"> <img src="images/login_pic_03.jpg" alt="">
              <div class="carousel-caption">
                <h4 style="font-size:20px;">觉得高级学府离你很远吗？</h4>
                <p style="line-height:23px;">其实并不是，也许就在你的身边，也许就在你面对的屏幕之后，也许轻点鼠标你就能找到合适的导师！想要知道为什么吗？来试试我们的在线辅导课程吧！</p>
              </div>
            </div>
            <div class="item"> <img src="images/lecture-hall.jpg" alt="">
              <div class="carousel-caption">
                <h4 style="font-size:20px;">觉得传播知识很过瘾？</h4>
                <p style="line-height:23px;">那么这里对你来说一定是个好地方！你可以充分发挥你的水准，在教导别人的同时巩固自己的知识，受人尊重又能够自我满足。来我们这里开始你的导师之路吧！</p>
              </div>
            </div>
            <div class="item"> <img src="images/login_pic.jpg" alt="">
              <div class="carousel-caption">
                <h4 style="font-size:20px;">觉得有些知识依旧一知半解？</h4>
                <p style="line-height:23px;">那为何不快点加入我们的在线一对一课程呢！在这里你能够找到你所想要学习的知识，而且因为是一对一授课，学习效率相比其他课堂高出许多！并且学习时间更加自由，学习过程更加轻松！</p>
              </div>
            </div>
            <div class="item"> <img src="images/login_pic_2.png" alt="">
              <div class="carousel-caption">
                <h4 style="font-size:20px;">觉得有高效的学习方法但却无处分享？</h4>
                <p style="line-height:23px;">加入我们，你就能够以导师的身份分享你的经验，在口言相传中找到学习的捷径，在教学的过程中领悟更优秀的学习方法，一边分享一边授业解惑，指点迷津。</p>
              </div>
            </div>
          </div>
          <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> </div>
      </div>
      
     <!-- 登录-->
 	<div style="width:600px; height:345px;float:left; display:none;background:url(images/half_translucent_3.png);" id="login">
  <div class="container" style="margin-top:100px;">
  <div class="row">
      <form class="form-horizontal" action="LoginAction" method="post">
  <fieldset class="control-group">
    <div class="control-group">
      <label class="control-label" for="input01">用户名</label>
      <div class="controls">
        <input type="text" class="input-large" placeholder="邮箱登陆" id="log_username"  name="username"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="input01">密码</label>
      <div class="controls">
        <input type="password" class="input-large"  id="log_passwd"  name="password"/>
        <span class="help-inline"></span>
      </div>
    </div>
     
     <div class="control-group">
      <div class="controls">
        <button type="submit" class="btn btn-primary">提交</button>
      </div>
    </div>
  </fieldset>
</form>
     
 
    
  </div>
</div>
</div>

	<!--注册-->
    <div class="" style="width:600px; height:345px;float:left; background:url(images/half_translucent_4.png) repeat;display:none;overflow:auto;" id="register">
  <div class="container" style="margin-top:50px;">
  <div class="row">
      <form class="form-horizontal" action="RegisterAction" method="post" id="registerform">
  <fieldset class="control-group">
    
    <div class="control-group" id="_email">
      <label class="control-label" for="input01">邮箱</label>
      <div class="controls">
        <input type="text" class="input-large" placeholder="example@gmail.com" id="email" name="email" onblur="emailCheck()"/>
        <span class="help-inline" id="email_info"></span>
      </div>
    </div>
    <div class="control-group" id="_password">
      <label class="control-label" for="input01">密码</label>
      <div class="controls">
        <input type="password" class="input-large" id="password" name="password" onblur="passwordCheck()"/>
        <span class="help-inline" id="password_info"></span>
      </div>
    </div>
     <div class="control-group" id="_secondpassword">
      <label class="control-label" for="input01">再次输入密码</label>
      <div class="controls">
        <input type="password" class="input-large" id="secondpassword" onblur="passwordIsSame()"/>
        <span class="help-inline" id="secondpassword_info"></span>
      </div>
    </div>
    <div class="control-group" id="_lastname">
      <label class="control-label" for="input01">姓</label>
      <div class="controls">
        <input type="text" class="input-large" id="lastname" name="lastname" onblur="javascript:lastnameCheck()"/>
        <span class="help-inline" id="lastname_info"></span>
      </div>
    </div>
    <div class="control-group" id="_firstname">
      <label class="control-label" for="input01">名</label>
      <div class="controls">
        <input type="text" class="input-large" id="firstname" name="firstname" onblur="javascript:firstnameCheck()"/>
        <span class="help-inline" id="firstname_info"></span>
      </div>
    </div>
    
   <div class="controls">
              <label class="radio">
                <input type="radio" name="type" id="optionsRadios1" value="student" checked=""/>
		学生注册
              </label>
              <label class="radio">
                <input type="radio" name="type" id="optionsRadios2" value="tutor"/>
		老师注册
              </label>
            </div>
    
     <div class="control-group">
      <div class="controls">
        <button type="button" class="btn btn-primary" onclick="RegisterSubmit()">注册</button>
      </div>
    </div>
    
    
  </fieldset>
</form>
     
  </div>
  
</div>
</div>


      <div style="margin-left:600px;width:200px">
      <div style="background:#0C3; height:115px;"  onmouseover="tologin();">
      <button class=" mybt" style="background-color:#99d9ea;">登录
      </button>
      </div>
      <div style="background-color:#06F;height:115px;" onmousemove="toregister()">
      <button class=" mybt" style="background-color:#999EE3;">注册
      </button>
      </div>
      <div style=" height:115px;"; onmouseover="tointro()">
      <button class=" mybt" style="background-color:#CC9D84;">了解我们
      </button>
      </div>
    </div>
    
    </div>
    <div class="clear"></div>
  </div>
</div>
</div>
<div class="footer " style="margin-top:100px;">
  <div class="container">
    <p>copyright © 2013</p>
  </div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="js/register2.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript">
function test()
{
	
	$('#myModal').modal('show');
}
function tologin()
{
	document.getElementById("intro").style.display="none";
	document.getElementById("register").style.display="none";
	document.getElementById("login").style.display="block";
}
function toregister()
{
	$("#login").css("display","none");
	$("#intro").css("display","none");
	$("#register").css("display","block");
}
function tointro()
{
	$("#login").css("display","none");
	$("#register").css("display","none");
	$("#intro").css("display","block");
}
</script>




</body>
</html>
