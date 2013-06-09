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

<body>
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
      <div class="span7">
        <div class="page-header">
          <div class="media"> <a class="pull-left"> <img class="media-object" data-src="holder.js/64x64" style="height:64px;width:64px;" src="../headimg/<s:property value='picture'/>"/> </a>
            <div class="media-body">
              <h4 class="media-heading">
                <s:property value="lastName"/><s:property value="firstName"/>
              </h4>
              <br/>
              <p class="text-info">评分：
                <s:property value="point"/>
              </p>
            </div>
          </div>
        </div>
        <div>
          <table class="table">
            <tbody>
              <tr>
                <td>学校</td>
                <td>
                  <s:if test="school!=null">
                    <s:property value="school"/>
                  </s:if>
                  <s:else>
                  	未公开 
                  </s:else>
                </td>
              </tr>
              <tr>
                <td>专项</td>
                <td><s:iterator value="tutor.subjects">
                    <p>
                      <s:property value="name"/>
                    </p>
                  </s:iterator></td>
              </tr>
              <tr>
                <td>邮箱</td>
                <td><s:property value="email"/></td>
              </tr>
              <tr>
                <td>电话</td>
                <td><s:if test="phone!=null">
                    <s:property value="phone"/>
                  </s:if>
                  <s:else> 未公开 </s:else></td>
              </tr>
              <tr>
                <td style="width:100px;">个人简述</td>
                <td><s:property value="tutor.description"/></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="span5">
        <div class="accordion" id="accordion2">
          <div class="accordion-group">
            <div class="accordion-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">开设课程</a> </div>
            <div id="collapseTwo" class="accordion-body collapse in">
              <div class="accordion-inner">
                <table class="table">
                  <tbody>
                    <s:iterator value="tutor.courses">
                    
                      <s:if test="startTime>time&&student==null">
                        <tr>
                          <td><s:property value="name"/></td>
                          <td><s:set name="flag" value="0"/>
                            <s:iterator value="#session.user.student.applications">
                              <s:if test="id==#root[1].id">
                                <s:set name="flag" value="1"/>
                              </s:if>
                            </s:iterator>
                            <s:if test="#flag==0">
                              <button class="btn btn-mini btn-success" onclick="applyCourse(<s:property value='id'/>,<s:property value='#root[1].tutor.id'/>)" id="applybtn">申请</button>
                            </s:if>
                            <s:else>
                              <button class="btn btn-mini" onclick="applyCourse(<s:property value='id'/>)" disabled="disabled" id="applybtn">已申</button>
                            </s:else></td>
                          <td><p class="text-warning">
                              <s:date name="startTime" format="yyyy-MM-dd HH:mm:ss" />
                              ~
                              <s:date name="endTime" format="HH:mm:ss" />
                            </p></td>
                          <td><p class="text-error">学费：
                              <s:property value="price"/>
                              元</p></td>
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
<div class="footer" style="margin-top:450px;">
  <div class="container">
    <p>copyright © 2013</p>
  </div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script> 
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