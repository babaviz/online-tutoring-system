// JavaScript Document

function createTab($search_type)
{
	//$tabNum=$("#myTab").children().length;
	var $words=$selectedCategory.text();
/*	$words=$words+":"+$("#searchCourseName").val();
	$words=$words+" "+$("#searchTeacherName").val();
	$words=$words+" "+$("#searchDescription").val();
	
	if($words.length>5)
	{
		$words=$words.substr(0,5)+"..."
	}*/
	
	$tabNO++;
	var $x=$("#tabTemplate").clone(true);
	$x.find("a").attr("href","#tab_"+$tabNO);
	$x.find("a").html($words+$x.find("a").html());
	$("#myTab:last").append($x);
	
	var $tabContent=$("#tabContentTemplate").clone(true);
	//$y.css("display","block");
	$tabContent.attr("id","tab_"+$tabNO);
	$tabContent.find("p").text("xxx"+$tabNO+"zzz");
	$("#myTabContent").append($tabContent);
	var $factors=new get_factors($search_type);
	add_factors($tabContent,$factors,$search_type);
	add_result($tabContent,$factors,$search_type);
	$x.find("a").tab('show');
}

function add_factors($tabContent,$factors,$search_type)
{
	var $one_factor;
	var $search_factors=$tabContent.find(".search_factors");
	$one_factor=$("#factorTemplate").clone(true);
	$one_factor.text("类别："+$factors.course_type);
	$search_factors.append($one_factor);
	
	if($factors.course_name!="")
	{
		$one_factor=$("#factorTemplate").clone(true);
		$one_factor.text("课名："+$factors.course_name);
		$search_factors.append($one_factor);
	}
	
		
	if($factors.tutor_name!="")
	{
		$one_factor=$("#factorTemplate").clone(true);
		$one_factor.text("老师："+$factors.tutor_name);
		$search_factors.append($one_factor);
	}
	
	if($factors.course_description!="")
	{
		$one_factor=$("#factorTemplate").clone(true);
		$one_factor.text("课程简介："+$factors.course_description);
		$search_factors.append($one_factor);
	}
	
	if($search_type==1)
	{
	  
		if(($factors.course_price_f!="")&&($factors.course_price_t!=""))
		{
			$one_factor=$("#factorTemplate").clone(true);
			$one_factor.text("价格："+$factors.course_price_f+"-"+$factors.course_price_t+"元");
			$search_factors.append($one_factor);
		}
		else if(($factors.course_price_f!="")&&($factors.course_price_t==""))
		{
			$one_factor=$("#factorTemplate").clone(true);
			$one_factor.text("价格：大于"+$factors.course_price_f+"元");
			$search_factors.append($one_factor);
		}
		else if(($factors.course_price_f=="")&&($factors.course_price_t!=""))
		{
			$one_factor=$("#factorTemplate").clone(true);
			$one_factor.text("价格：小于"+$factors.course_price_t+"元");
			$search_factors.append($one_factor);
		}
		
		if($factors.tutor_description!="")
		{
			$one_factor=$("#factorTemplate").clone(true);
			$one_factor.text("老师简介："+$factors.tutor_description);
			$search_factors.append($one_factor);
		}
		
		if(($factors.course_time_f!="")&&(($factors.course_time_t!="")))
		{
			$one_factor=$("#factorTemplate").clone(true);
			$one_factor.text("上课时长："+$factors.course_time_f+"-"+$factors.course_time_t+"分钟");
			$search_factors.append($one_factor);
		}
		else if(($factors.course_time_f=="")&&(($factors.course_time_t!="")))
		{
			$one_factor=$("#factorTemplate").clone(true);
			$one_factor.text("上课时长：小于"+$factors.course_time_t+"分钟");
			$search_factors.append($one_factor);
		}
		else if(($factors.course_time_f!="")&&(($factors.course_time_t=="")))
		{
			$one_factor=$("#factorTemplate").clone(true);
			$one_factor.text("上课时长：大于"+$factors.course_time_f+"分钟");
			$search_factors.append($one_factor);
		}
		
		if($factors.course_start_time!="")
		{
			$one_factor=$("#factorTemplate").clone(true);
			$one_factor.text("上课时间："+$factors.course_start_time+" 之后");
			$search_factors.append($one_factor);
		}
		
		if($factors.tutor_eval!="")
		{
			$one_factor=$("#factorTemplate").clone(true);
			$one_factor.text("教师评分："+$factors.tutor_eval);
			$search_factors.append($one_factor);
		}
	}
}

function add_result($tabContent,$factors,$search_type)
{
	
}

function get_factors($search_type)
{
	if($search_type==0)
	{
		this.course_type=$("#course_list .activecourse").text();
		this.course_name=$("#searchCourseName").val();
		this.tutor_name=$("#searchTeacherName").val();
		this.course_description=$("#searchDescription").val();
	}
	else if($search_type==1)
	{
		this.course_type=$("#adv_courseBtn").text();
		this.course_name=$("#adv_search_name").val();
		this.course_description=$("#adv_description").val();
		this.tutor_name=$("#adv_tutor_name").val();
		this.tutor_description=$("#adv_tutor_description").val();
		this.course_time_f=$("#adv_time_f").val();
		this.course_time_t=$("#adv_time_t").val();
		this.course_price_f=$("#adv_price_f").val();
		this.course_price_t=$("#adv_price_t").val();
		this.course_start_time=$("#adv_start_time").val();
		if($("#adv_evalBtn input").length>0)
		{
			this.tutor_eval=$("#adv_evalBtn input").val()+"分以上";
		}
		else{
			this.tutor_eval=$("#adv_evalBtn").text();
		}
	}
}

function fill_content($content, $search_type)
{
	
}

function delTab()
{
	$x=$(event.srcElement).parent();
	$y=$x.attr("href");
	if($x.parent().next().length==0)
	{
		$x.parent().prev().find("a").tab('show');
		$($y).prev().addClass("active");
		$($y).prev().addClass("in");
	}
	else
	{
		$x.parent().next().find("a").tab('show');
		$($y).next().addClass("active");
		$($y).next().addClass("in");
	}

	$x.parent().remove();
	$($y).remove();
}

function selectCategory()
{
	//$x=$(event.srcElement);
	$selectedCategory.removeClass("activecourse");
	$(event.srcElement).addClass("activecourse");
	$selectedCategory=$(event.srcElement);
}

function customizedFunc()
{
	//alert("here is executed on loading");
	$selectedCategory=$("#course_list div:eq(0)");
	$tabNO=5;
	$advancedSearchPointer=0;
}

function showAdvancedSearch()
{
	if($advancedSearchPointer==0)
	{
		$("#adv_search_bar").addClass("active_bar");
		$("#adv_search_content").fadeIn(800,null_function(),showAdvancedSearch_callback());
		$("#adv_search_bar img:eq(0)").fadeOut();
		$("#adv_search_bar img:eq(1)").fadeIn();
		
	}
	else
	{
		$("#adv_search_bar").removeClass("active_bar");
		$("#adv_search_bar img:eq(1)").fadeOut(800);
		$("#adv_search_bar img:eq(0)").fadeIn(800);
		$("#adv_search_content").fadeOut(800,null_function(),showAdvancedSearch_callback());
		
	}
}

function showAdvancedSearch_callback()
{
	if($advancedSearchPointer==0)
	{
		$("html,body").animate({scrollTop:$("#adv_search_bar").offset().top-50},1000);
		$advancedSearchPointer=1;
	}
	else
	{
		$("html,body").animate({scrollTop:$("#myTab").offset().top-50},1000);
		$advancedSearchPointer=0;
	}
}

function adv_selectCourse()
{
	$("#adv_courseBtn").text($(event.srcElement).text());
}

function adv_selectEval()
{
	
	if($(event.srcElement).text()!="自定义")
	{
		$("#adv_evalBtn").text($(event.srcElement).text());
	}
	else
	{
		var $x=$("#customized_eval").clone(true);
		$("#adv_evalBtn").html($x.html());
	}

}

function null_function()
{

}