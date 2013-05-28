// JavaScript Document

function test_func()
{
	var $x=$(".head_img:eq(0)");
	$x.css("background-image","url(images/mainbackground.jpg)");
}

function check_lastname()
{
	var $lastname=$("#input_lastname");
	if($lastname.val().length>25||$lastname.val().length==0)
	{
		$lastname.parent().parent().removeClass("success");
		$lastname.parent().parent().addClass("error");
		$lastname.next().text("输入错误，不能为空或超多25个字符");
		return false;
	}
	else
	{
		$lastname.parent().parent().removeClass("error");
		$lastname.parent().parent().addClass("success");
		$lastname.next().text("输入正确");
		return true;
	}
}

function check_firstname()
{
	var $lastname=$("#input_firstname");
	if($lastname.val().length>25||$lastname.val().length==0)
	{
		$lastname.parent().parent().removeClass("success");
		$lastname.parent().parent().addClass("error");
		$lastname.next().text("输入错误，不能为空或超多25个字符");
		return false;
	}
	else
	{
		$lastname.parent().parent().removeClass("error");
		$lastname.parent().parent().addClass("success");
		$lastname.next().text("输入正确");
		return true;
	}
}

function check_phone()
{
	var $phone_num=$("#input_phone");
	var phone_pattern=new RegExp("[\+0-9]+[0-9]+");
	if($phone_num.val().length==0)
	{
		$phone_num.parent().parent().removeClass("error");
		$phone_num.parent().parent().removeClass("success");
		$phone_num.next().text("");
		return true;
	}
	else if((!(phone_pattern.test($phone_num.val())))||($phone_num.val().length>15))
	{
		$phone_num.parent().parent().removeClass("success");
		$phone_num.parent().parent().addClass("error");
		$phone_num.next().text("输入错误");
		return false;
	}
	else
	{
		$phone_num.parent().parent().removeClass("error");
		$phone_num.parent().parent().addClass("success");
		$phone_num.next().text("输入正确");
		return true;
	}
}

function check_school()
{
	var $school_name=$("#input_school");
	if($school_name.val().length>20)
	{
		$school_name.parent().parent().removeClass("success");
		$school_name.parent().parent().addClass("error");
		$school_name.next().text("输入错误，学校名字过长");
		return false;
	}
	else if($school_name.val().length==0)
	{
		$school_name.parent().parent().removeClass("error");
		$school_name.parent().parent().removeClass("success");
		$school_name.next().text("输入正确");
		return true;
	}	else
	{
		$school_name.parent().parent().removeClass("error");
		$school_name.parent().parent().addClass("success");
		$school_name.next().text("");
		return true;
	}
}

function save_info()
{
	var ifOK=true;
	if(!check_lastname())
		ifOK= false;

	if(!check_firstname())
		ifOK= false;

	if(!check_phone())
		ifOK= false;

	if(!check_school())
		ifOK= false;

	if(ifOK==false)
		return;
	else
	{
		changeaction.changeBasicInfo($("#input_lastname"),$("#input_firstname"),$("#input_phone"),$("#input_birthday"),$("#input_school"));
	}
}