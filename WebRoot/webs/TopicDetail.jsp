<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
<link href="css/topic.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/docs.css" rel="stylesheet" type="text/css" />

<title>无标题文档</title>
</head>
	
<body>

    <div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
  <div class="container">
    <a class="brand" href="#">零距离家教</a>
    <ul class="nav">
      <li><a href="#">首页</a></li>
      <li><a href="#">课程管理</a></li>
      <li><a href="search.jsp">找老师</a></li>
      <li class="active"><a href="AllTopics.jsp">BBS</a></li>
      <li><a href="chatting.jsp">聊天</a></li>
      <li><a href="flash/OnlineTutorPlayer.html">上课</a></li>
    </ul>
    </div>
  </div>
  </div>
  
  <div class="container">
  	<section>
    	<div class="page-header">
        	<div class="media">
            	<a class="pull-left">
                	<img class="media-object" data-src="holder.js/64x64" />
                </a>
                <div class="media-body">
                	<h4 class="media-heading">张三</h4>
                </div>
               
            </div>
        </div>
        <div class="bs-docs-example">
            <h3>话题：c语言printf用法？</h3>
            <div class="row">
                <div class="span10 offset1">
                <p class="text-info">c语言printf用法？c语言printf用法？c语言printf用法？c语言printf用法？c语言printf用法？c语言printf用法？c语言printf用法？c语言printf用法？c语言printf用法？c语言printf用法？c语言printf用法？c语言printf用法？</p>
            	</div>
            </div>
            <div class="row">
            	<div class="span11">
            		<p class="text-right">
                    <em><a href="#" class="btn-link">收藏</a></em>&nbsp;
                    <em><strong>2013年5月11日</strong></em>&nbsp;
                    <em><strong>类别：c语言</strong></em>
                    </p>
                </div>
            </div>
        </div>
    </section>	
    <section>
    	<div class="page-header">
        	<h5>评论区</h5>
        </div>
        <textarea rows="4" style="width:100%;" placeholder="说点什么......"></textarea>
        <p align="right"><button type="submit" class="btn">我要评论</button></p>
        
        <table class="table">
        
        <tbody>
        <tr>
        <td>
        <div class="media">
        	<a href="#" class="pull-left">
            	<img class="media-object" data-src="holder.js/64x64" />
            </a>
            <div class="media-body">
            	<h6>李四</h6>
                <p class="text-info">这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，</p>
            </div>
            <p align="right">
            <em>2013年5月12日</em>
            <button class="btn btn-link">回复</button>
            </p>
        </div>
        </td>
        </tr>
        <tr>
        <td>
        <div class="media">
        	<a href="#" class="pull-left">
            	<img class="media-object" data-src="holder.js/64x64" />
            </a>
            <div class="media-body">
            	<h6>李四</h6>
                <p class="text-info">这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，</p>
            </div>
            <p align="right">
            <em>2013年5月12日</em>
            <button class="btn btn-link">回复</button>
            </p>
        </div>
        </td>
        </tr>
        <tr>
        <td>
        <div class="media">
        	<a href="#" class="pull-left">
            	<img class="media-object" data-src="holder.js/64x64" />
            </a>
            <div class="media-body">
            	<h6>李四</h6>
                <p class="text-info">这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，</p>
            </div>
            <p align="right">
            <em>2013年5月12日</em>
            <button class="btn btn-link">回复</button>
            </p>
        </div>
        </td>
        </tr>
        <tr>
        <td>
        <div class="media">
        	<a href="#" class="pull-left">
            	<img class="media-object" data-src="holder.js/64x64" />
            </a>
            <div class="media-body">
            	<h6>李四</h6>
                <p class="text-info">这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，</p>
            </div>
            <p align="right">
            <em>2013年5月12日</em>
            <button class="btn btn-link">回复</button>
            </p>
        </div>
        </td>
        </tr>
        <tr>
        <td>
        <div class="media">
        	<a href="#" class="pull-left">
            	<img class="media-object" data-src="holder.js/64x64" />
            </a>
            <div class="media-body">
            	<h6>李四</h6>
                <p class="text-info">这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，这是一条评论，</p>
            </div>
            <p align="right">
            <em>2013年5月12日</em>
            <button class="btn btn-link">回复</button>
            </p>
        </div>
        </td>
        </tr>
        </tbody>
        </table>
        
        
        <div class="btn-group">
            <button class="btn btn-link active">1</button>
            <button class="btn btn-link">2</button>
            <button class="btn btn-link">3</button>
            <button class="btn">下一页</button>
        </div>
        
        
    </section>
  </div>
  
  <div class="footer" style="margin-top:400px;">
  	<div class="container">
    	<p>copyright © 2013</p>
    </div>
  </div>

<script language="javascript" type="text/javascript" src="bootstrap/js/holder.js"></script>

</body>
</html>
