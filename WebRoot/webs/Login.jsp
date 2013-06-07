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
<link href="topic.css" rel="stylesheet" type="text/css"/>
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
	 border:0px;
	width:200px; 
	height:115px;
	font-size:xx-large;
	}
</style>
<script src='/OnlineTutoringSystem/dwr/engine.js'></script>
<script src='/OnlineTutoringSystem/dwr/interface/loginaction.js'></script>
<script src='/OnlineTutoringSystem/dwr/interface/registeraction.js'></script>
<script src='js/register.js' charset="gbk"></script>
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
      <div style="width:600px; height:345px;float:left;" id="intro">
        <div id="myCarousel" class="carousel slide">
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1" class=""></li>
            <li data-target="#myCarousel" data-slide-to="2" class=""></li>
            <li data-target="#myCarousel" data-slide-to="3" class=""></li>
          </ol>
          <div class="carousel-inner">
            <div class="item active"> <img src="bootstrap/img/bootstrap-mdo-sfmoma-01.jpg" alt="">
              <div class="carousel-caption">
                <h4>First Thumbnail label</h4>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              </div>
            </div>
            <div class="item"> <img src="bootstrap/img/bootstrap-mdo-sfmoma-02.jpg" alt="">
              <div class="carousel-caption">
                <h4>Second Thumbnail label</h4>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              </div>
            </div>
            <div class="item"> <img src="bootstrap/img/bootstrap-mdo-sfmoma-03.jpg" alt="">
              <div class="carousel-caption">
                <h4>Third Thumbnail label</h4>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              </div>
            </div>
            <div class="item"> <img src="bootstrap/img/bootstrap-mdo-sfmoma-02.jpg" alt="">
              <div class="carousel-caption">
                <h4>Second Thumbnail label</h4>
                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              </div>
            </div>
          </div>
          <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> </div>
      </div>
      
     <!-- 登录-->
 	<div style="width:600px; height:345px;float:left; display:none;background:#0C3;" id="login">
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
    <div class="" style="width:600px; height:345px;float:left; background:url(images/half_translucent.png) repeat;display:none;overflow:auto;" id="register">
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
    <div class="control-group" id="_firstname">
      <label class="control-label" for="input01">姓</label>
      <div class="controls">
        <input type="text" class="input-large" id="firstname" name="firstname" onblur="javascript:firstnameCheck()"/>
        <span class="help-inline" id="firstname_info"></span>
      </div>
    </div>
    <div class="control-group" id="_lastname">
      <label class="control-label" for="input01">名</label>
      <div class="controls">
        <input type="text" class="input-large" id="lastname" name="lastname" onblur="javascript:lastnameCheck()"/>
        <span class="help-inline" id="lastname_info"></span>
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
      <button class=" mybt" style="background-color:#0C3;">登录
      </button>
      </div>
      <div style="background-color:#06F;height:115px;" onmousemove="toregister()">
      <button class=" mybt" style="background-color:#06F;">注册
      </button>
      </div>
      <div style=" height:115px;"; onmouseover="tointro()">
      <button class=" mybt" style="background-color:#003;">了解我们
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
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script> 
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
