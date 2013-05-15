<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="webs/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
    This is my ERROR page. <br>
    <input id="lefile" type="file" style="display:none">
<div class="input-append">
   <input id="photoCover" class="input-large" type="text">
   <a class="btn" onclick="$('input[id=lefile]').click();">Browse</a>
</div>
  <script language="javascript" type="text/javascript" src="webs/bootstrap/js/jquery.js"></script>
<script type="text/javascript">
$('input[id=lefile]').change(function() {
   $('#photoCover').val($(this).val());
});
</script>
  </body>
</html>
