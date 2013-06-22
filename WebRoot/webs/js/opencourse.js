var namevalid=false;
var starttimevalid = false;
var endtimevalid = false;
var pricevalid = false;
var typevalid = false;
var descriptionvalid = false;

function checkname()
{
	if($("#input_name").val()!="")
	{
		$("#_name").removeClass("error");
		$("#name_info").html("");
		namevalid=true;
	}
	else
	{
		$("#_name").addClass("error");
		$("#name_info").html("课程名不能为空");
		namevalid=false;
	}
}

function checkstarttime()
{
	if($("#input_starttime").val()!="")
	{
		$("#_starttime").removeClass("error");
		$("#starttime_info").html("");
		starttimevalid=true;
		//alert("starttimevalid=true;");
	}
	else
	{
		$("#_starttime").addClass("error");
		$("#starttime_info").html("开始时间不能为空");
		starttimevalid=false;
	}
}

function checkendtime()
{
	if($("#input_endtime").val()!="")
	{
		$("#_endtime").removeClass("error");
		$("#endtime_info").html("");
		endtimevalid=true;
	}
	else
	{
		$("#_endtime").addClass("error");
		$("#endtime_info").html("结束时间不能为空");
		endtimevalid=false;
	}
}


function checkprice()
{
	if($("#input_price").val()!="")
	{
		$("#_price").removeClass("error");
		$("#price_info").html("");
		pricevalid=true;
	}
	else
	{
		$("#_price").addClass("error");
		$("#price_info").html("学费不能为空");
		pricevalid=false;
	}
}

function checktype()
{
	if($("#input_type option:selected").text()=="")
	{
		$("#_type").addClass("error");
		$("#type_info").html("类型不能为空");
		typevalid=false;
	}
	else
	{
		$("#_type").removeClass("error");
		$("#type_info").html("");
		typevalid=true;
	}
}

function checkdescription()
{
	if($("#input_description").val()!="")
	{
		$("#_description").removeClass("error");
		$("#description_info").html("");
		descriptionvalid=true;
	}
	else
	{
		$("#_description").addClass("error");
		$("#description_info").html("描述不能为空");
		descriptionvalid=false;
	}
}

function submitinfo()
{
	checkname();
	checkstarttime();
	checkendtime();
	checkprice();
	checktype();
	checkdescription();
	//alert(starttimevalied);
	if(namevalid&&starttimevalid&&endtimevalid&&pricevalid&&typevalid&&descriptionvalid)
	{
		$("#classform").submit();
	}
	else
	{
		alert("信息不合法");
	}
}