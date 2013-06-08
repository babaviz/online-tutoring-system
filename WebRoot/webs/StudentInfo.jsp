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
<link href="css/buildinfo.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/datetimepicker.css" rel="stylesheet" media="screen">
<title>无标题文档</title>
</head>

<body style="background:url(images/mainbackground.jpg)">
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="brand" href="#">零距离家教</a>
      <ul class="nav">
        <li><a href="Index">首页</a></li>
        <li><a href="SearchCourse">搜课</a></li>
        <li><a href="SearchUser">搜人</a></li>
        <li><a href="Chatting">私信</a></li>
        <li><a href="CourseManage">课程管理</a></li>
        <li><a href="AllTopics">BBS</a></li>
      </ul>
      <ul class="nav my_pull_right">
        <li class="active"><a class="modify_padding" href="BuildInfo"><i class="icon-user"></i>个人设置</a></li>
        <li><a class="modify_padding" href="#"><i class="icon-envelope"></i>消息</a></li>
        <li><a class="modify_padding" href="Logout"><i class="icon-off"></i>登出</a></li>
        <li><a class="modify_padding"><strong class="text-success">
          <div class="sub_name">
            <div>
              <s:property value="#session.user.firstName"/>
            </div>
            <div>
              <s:property value="#session.user.lastName"/>
            </div>
          </div>
          </strong></a></li>
      </ul>
    </div>
  </div>
</div>
<div id="down_content" class="container" style="margin-top:20px;">
  <div id="down_left_content">
    <div style="margin-left: auto; margin-right: auto; width: 700px;">
      <legend>个人信息</legend>
      <!-- 左导航栏-->
      <div style="width:160px; float:left;"> <img data-src="holder.js/150x150" id="left-headimg" src="../headimg/<s:property value='#session.user.picture'/>" style="width:150px; height:150px;"/>
        <ul class="nav nav-pills nav-stacked">
          <label>积分:
            <s:property value="#session.user.point"/>
          </label>
          <li class="active" onclick="toinformation()" id="information1"><a>基本信息</a></li>
          <li onclick="tohead_pic()" id="head_pic1"><a>头像</a></li>
          <li onclick="tocard()" id="card1"><a>信用卡</a></li>
          <li onclick="topassword()" id="password1"><a>修改密码</a></li>
        </ul>
      </div>
      <div style="margin-left:160px;width:540px"> 
        <!-- 基本信息页面-->
        <div id="information">
          <form class="form-horizontal" action="" method="post">
            <fieldset class="control-group">
              <div class="control-group">
                <label class="setting_detail_label" for="input01">邮箱</label>
                <div class="setting_detail_info">
                  <div style="margin-top:5px">
                    <label>
                      <s:property value="#session.user.email"/>
                    </label>
                  </div>
                </div>
              </div>
              <div class="control-group disabled">
                <label class="setting_detail_label" for="input01">姓</label>
                <div class="setting_detail_info">
                  <input type="text" class="input-large" placeholder="输入您的姓" id="input_lastname" value='<s:property value="#session.user.firstName"/>'  onblur="check_lastname()"/>
                  <span class="help-inline"></span> </div>
              </div>
              <div class="control-group disabled">
                <label class="setting_detail_label" for="input01">名</label>
                <div class="setting_detail_info">
                  <input type="text" class="input-large" placeholder="输入您的名" id="input_firstname" value='<s:property value="#session.user.lastName"/>' onblur="check_firstname()"/>
                  <span class="help-inline"></span> </div>
              </div>
              <div class="control-group">
                <label class="setting_detail_label" for="input01">性别</label>
                <div class="setting_detail_info">
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
                <label class="setting_detail_label" for="input01">电话</label>
                <div class="setting_detail_info">
                  <input type="text" class="input-large" placeholder="请输入您的手机号码" id="input_phone" value='<s:property value="#session.user.phone"/>' onblur="check_phone()"/>
                  <span class="help-inline"></span> </div>
              </div>
              <div class="control-group">
                <label class="setting_detail_label" for="input01" >生日</label>
                <div class="controls input-append date form_datetime" data-date="2013-05-27T08:30:07Z" data-date-format="yyyy-MM-dd" data-link-field="dtp_input1">
                  <input id="input_birthday" size="16" type="text" value='<s:date name="#session.user.birthday" format="yyyy-MM-dd" />' readonly>
                  <span class="add-on"><i class="icon-remove"></i></span> <span class="add-on"><i class="icon-th"></i></span> </div>
              </div>
              <div class="control-group">
                <label class="setting_detail_label" for="input01">学校</label>
                <div class="setting_detail_info">
                  <input type="text" class="input-large" id="input_school" placeholder="请输入您在读的学校" onblur="check_school()" value='<s:property value="#session.user.school"/>'/>
                  <span class="help-inline"></span> </div>
              </div>
              <div class="control-group">
                <label class="setting_detail_label" for="input01" >年级</label>
                <div class="setting_detail_info">
                  <input type="text" class="input-large" placeholder="请输入您的年级" id="input_grade" value='<s:property value="#session.user.student.grade"/>'/>
                </div>
              </div>
              <div class="control-group">
                <div class="setting_detail_info">
                  <button type="button" class="btn btn-primary" onclick="save_student_info()">保存</button>
                </div>
              </div>
            </fieldset>
          </form>
        </div>
        <!-- 头像页面-->
        <div style="margin-top:30px; margin-left:200px; display:none" id="head_pic">
          <form id="headform" method="post" enctype="multipart/form-data">
            <img data-src="holder.js/150x150" id="right-headimg" src="../headimg/<s:property value='#session.user.picture'/>" style="width:150px; height:150px;"/>
            <input type="file"  name="fileupload"/>
            <button class="btn btn-primary" type="button" onclick="uploadImage()">上传头像</button>
            <s:token></s:token>
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
                  <span class="help-inline"></span> </div>
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
                  <span class="help-inline"></span> </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="input01">新密码</label>
                <div class="controls">
                  <input type="password" class="input-large"  id="input01"/>
                  <span class="help-inline"></span> </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="input01">重复新密码</label>
                <div class="controls">
                  <input type="password" class="input-large"  id="input01"/>
                  <span class="help-inline"></span> </div>
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
<div class="footer " style="margin-top:300px;">
  <div class="container">
    <p>copyright © 2013</p>
  </div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script> 
<script type="text/javascript" src="js/jquery.form.js"></script>
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.js"></script> 
<script src='/OnlineTutoringSystem/dwr/engine.js'></script> 
<script src='/OnlineTutoringSystem/dwr/interface/changeinfoaction.js'></script> 
<script language="javascript" type="text/javascript" src="js/buildinfo.js"></script> 
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


function uploadImage()
{  
	//$("").submit(function(){
		$("#headform").ajaxSubmit({
			url : "<%=path%>/ChangeHead.action",  
	        type : "POST",
	        success:function(data){
	        	//alert(data);
	        	msg = data.split('&');
	        	if(msg[0]=="ok")
	        	{
	        		alert("头像上传成功");
	        		$("#right-headimg").attr("src","../headimg/"+msg[1]);
	        		$("#left-headimg").attr("src","../headimg/"+msg[1]);
	        	}
	        	else
	        		alert("头像上传失败");
	        }
		});
}
</script> 
<script type="text/javascript">

    $(".form_datetime").datetimepicker({
        format: "yyyy-mm-dd",
        showMeridian: true,
        autoclose: true,
        todayBtn: true,
		pickerPosition: "bottom-left"
    });

</script>
</body>
</html>