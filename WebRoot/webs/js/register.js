function checkUserName()
{
	if($("#username").val()!="")
		registeraction.checkUserName($("#username").val(),checkUserCallback);
	else
		$("#_username").addClass("error");
	$("#username_info").html("用户名不可以为空");
}

function checkUserCallback(msg)
{
	//alert(msg);
	if(msg=="exist")
	{
		
		$("#_username").addClass("error");
		$("#username_info").html("用户已存在");
	}
	else
	{
		$("#_username").removeClass("error");
		$("#username_info").html("用户名可用");
	}
		
}

function emailCheck () {
	if($("#email").val()!=""){
	var emailStr=$("#email").val();
	var emailPat=/^(.+)@(.+)$/;
	var matchArray=emailStr.match(emailPat);
	if (matchArray==null) {
		$("#_email").addClass("error");
		$("#email_info").html("邮箱格式不正确");
	}
	else{
		$("#_email").removeClass("error");
		$("#email_info").html("邮箱合格");
	}
	}
	else
	{
		$("#_email").addClass("error");
		$("#email_info").html("邮箱不可以为空");
	}
}

function passwordCheck()
{
	if($("#password").val()!=""){
		var length = $("#password").val().length;
		if(length>6)
		{
			$("#_password").removeClass("error");
			$("#password_info").html("");
		}
		else
		{
			$("#_password").addClass("error");
			$("#password_info").html("密码长度必须大于6");
		}
	}
	else{
		$("#_password").addClass("error");
		$("#password_info").html("密码不可以为空");
	}
}

function passwordIsSame()
{
	if($("#password").val()!=$("#secondpassword").val())
	{
		$("#_secondpassword").addClass("error");
		$("#secondpassword_info").html("两次密码不一致");
	}
	else
	{
		$("#_secondpassword").removeClass("error");
		$("#secondpassword_info").html("");
	}
}
