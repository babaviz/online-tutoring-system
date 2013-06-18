// JavaScript Document
var isReady = false;

var coursesn="";
var user = "";
var usertype="";
var msgarray;

function getUrlParam(name)
{
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	if (r!=null) return unescape(r[2]); return null; //返回参数值
}

function getInfo()
{
	flashinfoaction.getClassInfo(getUrlParam("courseid"),getInfoCallBack);
}

function getInfoCallBack(msg)
{
	//alert(msg);
	msgarray = msg.split(" ");
	coursesn = msgarray[2];
	user = msgarray[0];
	usertype = msgarray[1];
	isReady = true;
	//alert(msgarray);
}

function customizedFunc()
{
	getInfo();
}



function null_function()
{
	
}




function getIsReady()
{
	//alert(isReady);
    return isReady;
}

function getUserType()
{
	//getInfo();
    return usertype;
}

function getUserName()
{
	//alert(user);
	return user;
}


function getCourseID()
{
	return coursesn;
}

function afterClass()
{
	$("#myModal").modal('show');
	
}
