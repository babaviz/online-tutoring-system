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
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />
<link href="css/buildinfo.css" rel="stylesheet" type="text/css" />
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
        <li class="active"><a href="CourseManage">课程管理</a></li>
        <li><a href="AllTopics">BBS</a></li>
      </ul>
      <ul class="nav my_pull_right">
        <li><a class="modify_padding" href="BuildInfo"><i class="icon-user"></i>个人设置</a></li>
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
<div style="margin-top:30px">
  <div class="container">
    <ul id="myTab" class="nav nav-tabs">
      <li class="active"><a href="#existcourse" data-toggle="tab">已开课程</a></li>
      <li><a href="#unhandledcourse" data-toggle="tab">待处理课程</a></li>
      <li><a href="#opencourse" data-toggle="tab">开设课程</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="existcourse">
        <table class="table">
          <thead>
            <tr>
              <th>课程名称</th>
              <th>开始时间</th>
              <th>结束时间</th>
            </tr>
          </thead>
          <tr>
            <td>解析几何</td>
            <td>2013-06-02 16:00:00</td>
            <td>2013-06-02 16:30:00</td>
            <td><button class="btn btn-mini btn-success">上课</button></td>
          </tr>
          <tr>
            <td>力学</td>
            <td>2013-06-02 18:00:00</td>
            <td>2013-06-02 18:30:00</td>
            <td><button class="btn btn-mini btn-success">上课</button></td>
          </tr>
          <tbody>
          </tbody>
        </table>
      </div>
      <div class="tab-pane" id="unhandledcourse">
        <table class="table">
          <thead>
            <tr>
              <th>课程名称</th>
              <th>开始时间</th>
              <th>结束时间</th>
              <th>申请人数</th>
            </tr>
          </thead>
          <tr>
            <td>定语从句</td>
            <td>2013-06-02 16:00:00</td>
            <td>2013-06-02 16:30:00</td>
            <td>3</td>
            <td><button class="btn btn-mini btn-danger">删除</button></td>
          </tr>
          <tr>
            <td>电路</td>
            <td>2013-06-02 18:00:00</td>
            <td>2013-06-02 18:30:00</td>
            <td>5</td>
            <td><button class="btn btn-mini btn-danger">删除</button></td>
          </tr>
          <tbody>
          </tbody>
        </table>
      </div>
      <div class="tab-pane" id="opencourse">
        <form class="form-horizontal" action="" method="post">
          <fieldset class="control-group">
            <div class="control-group">
              <label class="setting_detail_label" for="input01">课程名称</label>
              <div class="setting_detail_info">
                <input type="text" class="input-large" placeholder="输入课程名称" id="input_lastname"/>
              </div>
            </div>
            <div class="control-group">
              <label class="setting_detail_label" for="input01">开始时间</label>
              <div class="setting_detail_info">
                <input type="text" class="input-large" placeholder="yyyy-mm-dd hh:mm:ss" id="input_lastname"/>
              </div>
            </div>
            <div class="control-group">
              <label class="setting_detail_label" for="input01">结束时间</label>
              <div class="setting_detail_info">
                <input type="text" class="input-large" placeholder="yyyy-mm-dd hh:mm:ss" id="input_lastname"/>
              </div>
            </div>
            <div class="control-group">
              <label class="setting_detail_label" for="input01">课程描述</label>
              <div class="setting_detail_info">
                <textarea rows="6" style="width:80%" id="input_description" placeholder="一句话介课程吧，让课程更受欢迎" id="input_description">
                </textarea>
              </div>
            </div>
            <div class="control-group">
              <div class="setting_detail_info">
                <button type="button" class="btn btn-primary">开设</button>
              </div>
            </div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
</div>
<script language="javascript" type="text/javascript" src="bootstrap/js/jquery.js"></script> 
<script language="javascript" type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
</body>
</html>