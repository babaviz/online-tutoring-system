function checkUserName()
{
	if($("#username").val()!="")
		registeraction.checkUserName($("#username").val(),checkUserCallback);
	else
		$("#_username").addClass("error");
	$("#username_info").html("�û���������Ϊ��");
}

function checkUserCallback(msg)
{
	//alert(msg);
	if(msg=="exist")
	{
		
		$("#_username").addClass("error");
		$("#username_info").html("�û��Ѵ���");
	}
	else
	{
		$("#_username").removeClass("error");
		$("#username_info").html("�û�������");
	}
		
}

function emailCheck () {
	if($("#email").val()!=""){
	var emailStr=$("#email").val();
	var emailPat=/^(.+)@(.+)$/;
	var matchArray=emailStr.match(emailPat);
	if (matchArray==null) {
		$("#_email").addClass("error");
		$("#email_info").html("�����ʽ����ȷ");
	}
	else{
		$("#_email").removeClass("error");
		$("#email_info").html("����ϸ�");
	}
	}
	else
	{
		$("#_email").addClass("error");
		$("#email_info").html("���䲻����Ϊ��");
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
			$("#password_info").html("���볤�ȱ������6");
		}
	}
	else{
		$("#_password").addClass("error");
		$("#password_info").html("���벻����Ϊ��");
	}
}

function passwordIsSame()
{
	if($("#password").val()!=$("#secondpassword").val())
	{
		$("#_secondpassword").addClass("error");
		$("#secondpassword_info").html("�������벻һ��");
	}
	else
	{
		$("#_secondpassword").removeClass("error");
		$("#secondpassword_info").html("");
	}
}
