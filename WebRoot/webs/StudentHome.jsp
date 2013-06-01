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
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<title>无标题文档</title>
</head>
<body>

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
  <div class="container">
    <a class="brand" href="#">零距离家教</a>
    <ul class="nav">
      <li class="active"><a href="Index">首页</a></li>
      <li><a href="#">课程管理</a></li>
      <s:if test="#session.user.type=='1'">
      <li><a href="Search">找老师</a></li>
      </s:if>
      <li><a href="AllTopics">BBS</a></li>
      <li><a href="Chatting">聊天</a></li>
      <li><a href="flash/OnlineTutorPlayer.html">上课</a></li>
    </ul>
    <ul class="nav pull-right">
    	<li><a href="BuildInfo"><i class="icon-user"></i>个人设置</a></li>
    	<li><a href="#"><i class="icon-envelope"></i>消息</a></li>
    	<li><a href="#"><i class="icon-off"></i>登出</a></li>
    	<li><a><strong class="text-success">欢迎登入：<s:property value="#session.user.firstName"/><s:property value="#session.user.lastName"/></strong></a></li>
    </ul>
    </div>
  </div>
  </div>
<div style="margin-top:30px">
<div class="container">
  <div class="row">
    <div class="span8"> </div>
    <div class="span4">
      <div class="accordion" id="accordion2">
        <div class="accordion-group">
          <div class="accordion-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">我的老师</a> </div>
          <div id="collapseOne" class="accordion-body collapse in">
            <div class="accordion-inner"> 
            	<table class="table">
                	<tbody>
                	<s:iterator value="#session.mytutors">
                    	<tr>
                       		<td>
                       		
                            <a href="#" class="pull-left">
            					<img class="media-object" data-src="holder.js/26x26" src="../headimg/<s:property value='user.picture'/>" style="width:26px; height:26px;"/>
            				</a>
            				
                            </td>
                        	<td><p class="text-info"><s:property value="user.firstName"/><s:property value="user.lastName"/></p></td>
                            <td style="padding-top:10px;">
                            	<a href="TutorInfo?userid=<s:property value='user.id'/>"><i class="icon-circle-arrow-right"></i></a>
                            </td>
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
                		<s:if test="time<endTime">
                		<s:if test="startTime<time&&endTime>time">
                    	<tr class="success">
                    	</s:if>
                    	<s:else>
                    	<tr>
                    	</s:else>
                        	<td><s:property value="name"/></td>
                            <td>
                            	<s:if test="startTime<time&&endTime>time">
                            	<button class="btn btn-mini btn-success">上课</button>
                            	</s:if>
                            	<s:else>
                            	<button class="btn btn-mini" disabled="disabled">上课</button>
                            	</s:else>
                            </td>
                            <td><p class="text-warning"><s:date name="startTime" format="yyyy-MM-dd HH:mm:ss" />~<s:date name="endTime" format="HH:mm:ss" /> </p></td>
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
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script>
</body>
</html>
