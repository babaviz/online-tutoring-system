var emailvalid=false;
var passwordvalid=false;
var sndpasswdvalid=false;


function emailCheck () {
	if($("#email").val()!=""){
		var emailStr=$("#email").val();
		var emailPat=/^(.+)@(.+)$/;
		var matchArray=emailStr.match(emailPat);
		if (matchArray==null) {
			$("#_email").addClass("error");
			$("#email_info").html("�����ʽ����ȷ");
			emailvalid=false;
		}
		else{
			registeraction.checkEmail($("#email").val(),checkEmailCallback);
		}
	}
	else
	{
		$("#_email").addClass("error");
		$("#email_info").html("���䲻����Ϊ��");
		emailvalid=false;
	}
}

function checkEmailCallback(msg)
{
	if(msg=="exist")
	{
		
		$("#_email").addClass("error");
		$("#email_info").html("������ע��");
		emailvalid=false;
	}
	else
	{
		$("#_email").removeClass("error");
		$("#email_info").html("����ϸ�");
		emailvalid=true;
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
			passwordvalid=true;
		}
		else
		{
			$("#_password").addClass("error");
			$("#password_info").html("���볤�ȱ������6");
			passwordvalid=false;
		}
	}
	else{
		$("#_password").addClass("error");
		$("#password_info").html("���벻����Ϊ��");
		passwordvalid=false;
	}
}

function passwordIsSame()
{
	if($("#secondpassword").val()!="")
	{
		if($("#password").val()!=$("#secondpassword").val())
		{
			$("#_secondpassword").addClass("error");
			$("#secondpassword_info").html("�������벻һ��");
			sndpasswdvalid=false;
		}
		else
		{
			$("#_secondpassword").removeClass("error");
			$("#secondpassword_info").html("");
			sndpasswdvalid=true;
		}
	}else{
		$("#_secondpassword").addClass("error");
		$("#secondpassword_info").html("ȷ�����벻��Ϊ��");
		sndpasswdvalid=false;
	}
}

function RegisterSubmit()
{
	if(emailvalid&passwordvalid&sndpasswdvalid)
		$("#registerform").submit();
	else
		alert("��Ϣ��д���Ϸ�");
}

