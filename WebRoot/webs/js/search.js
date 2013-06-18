// JavaScript Document

function createTab($search_type)
{	
	var $factors=new get_factors($search_type);
	$tabNO++;
	var $x=$("#tabTemplate").clone(true);
	$x.find("a").attr("href","#tab_"+$tabNO);
	$factorsMap.put("tab_"+$tabNO,$factors);
	$x.find("a").find("div").html($factors.course_type);
	$("#myTab:last").append($x);
	
	var $tabContent=$("#tabContentTemplate").clone(true);
	//$y.css("display","block");
	$tabContent.attr("id","tab_"+$tabNO);
	$tabContent.find("p").text("xxx"+$tabNO+"zzz");
	$("#myTabContent").append($tabContent);
	add_factors($tabContent,$factors);
	$x.find("a").tab('show');
	searchAction.getCourseResultNum($factors,function myCallBack(resultNum)
	{
		//alert("resultNum:"+resultNum);
		searchAction.getResult($factors,1, function myCallBack(data)
		{
			handleSearchCourseCallBack(data,$tabContent,resultNum,1);
		});
	});
	$("html,body").animate({scrollTop:$("#down_content").offset().top-50},300);
}

function handleSearchCourseCallBack(data,$tabContent,resultNum,pageNO)
{
	//alert(data.length);
	for(var i=0;i<data.length;i++)
	{
		//alert(data[i].Xxx);
		//alert(data[i].course_name+"\n"+data[i].course_type+"\n"+data[i].tutor_name+"\n"+data[i].course_price+"\n"+data[i].start_time+"\n"+data[i].course_duration+"\n"+data[i].course_description);
		var $one_result=$("#oneResultTemplate").clone(true);
		$one_result.find(".course_name").text(data[i].course_name);
		$one_result.find(".course_name").attr("onclick","toCourse("+data[i].id+")");
		$one_result.find(".tutor_name").attr("onclick","toUser("+data[i].tutorid+")");
		$one_result.find(".tutor_name").text(data[i].tutor_name);
		$one_result.find(".tutor_name").attr("onclick","toUser("+data[i].userid+")");
		$one_result.find(".tutor_img").attr("onclick","toUser("+data[i].userid+")");
		$one_result.find(".course_type").text(data[i].course_type);
		$one_result.find(".course_price").text(data[i].course_price+"元");
		$one_result.find(".course_start_time").text(data[i].start_time);
		$one_result.find(".course_duration").text(data[i].course_duration+"分钟");
		$one_result.find(".course_description").text(data[i].course_description);
		$one_result.find(".tutor_img").css("background-image","url(\"../headimg/"+data[i].headimg+"\")");
		$tabContent.append($one_result);
	}
	add_btn_group_courses($tabContent,resultNum,pageNO)
}

function changeCourseResultPage(targetA)
{
	var $tabContent=$(targetA).parent().parent();
	var pageNO=$.trim($(targetA).text());
	$tabContent.empty();
	var $factors=$factorsMap.get($tabContent.attr("id"));
	add_factors($tabContent,$factors);
	searchAction.getCourseResultNum($factors,function myCallBack(resultNum)
	{
		searchAction.getResult($factors,pageNO,function myCallBack(data)
		{
			handleSearchCourseCallBack(data,$tabContent,resultNum,pageNO);
		});
	});
}

function add_btn_group_courses($tabContent,resultNum,activeNO)
{
	var $btnGroup=$('<div class="btn-group search" style=""></div>');
	var pageNum=Math.ceil(resultNum/10);
	for(var i=1;i<=pageNum;i++)
	{
		var $tempBtn;
		if(i==activeNO)
		{
			$tempBtn=$('<a class="btn btn-link active" href="javascript:void(0)" onclick="changeCourseResultPage(this);"></a>');
		}
		else
		{
			$tempBtn=$('<a class="btn btn-link unactive" href="javascript:void(0)" onclick="changeCourseResultPage(this);"></a>');
		}
		$tempBtn.text(i+"");
		$btnGroup.append($tempBtn);
	}
	$tabContent.append($btnGroup);
}

function add_factors($tabContent,$factors)
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

function get_factors($search_type)
{
	var $factors=new searchFactors();
	if($search_type==0)
	{
		$factors.course_type=$("#course_list .activecourse").text();
		$factors.course_name=$("#searchCourseName").val();
		$factors.tutor_name=$("#searchTeacherName").val();
		$factors.course_description=$("#searchDescription").val();
		
		$factors.tutor_description="";
		$factors.course_time_f="";
		$factors.course_time_t="";
		$factors.course_price_f="";
		$factors.course_price_t="";
		$factors.course_start_time="";
		$factors.tutor_eval="";
	}
	else if($search_type==1)
	{
		$factors.course_type=$("#adv_courseBtn").text();
		$factors.course_name=$("#adv_search_name").val();
		$factors.course_description=$("#adv_description").val();
		$factors.tutor_name=$("#adv_tutor_name").val();
		$factors.tutor_description=$("#adv_tutor_description").val();
		$factors.course_time_f=$("#adv_time_f").val();
		$factors.course_time_t=$("#adv_time_t").val();
		$factors.course_price_f=$("#adv_price_f").val();
		$factors.course_price_t=$("#adv_price_t").val();
		$factors.course_start_time=$("#adv_start_time").val();
		if($("#adv_evalBtn input").length>0)
		{
			$factors.tutor_eval=$("#adv_evalBtn input").val()+"分以上";
		}
		else{
			$factors.tutor_eval=$("#adv_evalBtn").text();
		}
	}
	return $factors;
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
	$factorsMap=new HashMap();
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

function searchUserAction()
{
	$tabNO++;
	var $factors=new get_seatchUserFactors();
	var $x=$("#tabTemplate").clone(true);
	$x.find("a").attr("href","#tab_"+$tabNO);
	$factorsMap.put("tab_"+$tabNO,$factors);
	$x.find("a").find("div").html($factors.user_name);
	$("#myTab:last").append($x);
	
	var $tabContent=$("#tabContentTemplate").clone(true);
	$tabContent.attr("id","tab_"+$tabNO);
	$("#myTabContent").append($tabContent);
	$x.find("a").tab('show');
	searchAction.getUserResultNum($factors,function myCallBack(resultNum)
	{
		//alert("Result Num:"+resultNum);
		searchAction.getUserResult($factors,1,function myCallBack(data)
		{
			handleSearchUserCallBack(data,$tabContent,resultNum,1);
		});
	});
	$("html,body").animate({scrollTop:$("#down_content").offset().top-50},300);
}

function handleSearchUserCallBack(data,$tabContent,resultNum,activeNO)
{
	var $one_result;
	for(var i=0;i<data.length;i++)
	{
//		alert(data[i].name+"\n"+data[i].type+"\n"+data[i].point+"\n"+data[i].subjects);
		if(data[i].type=="老师")
		{
			$one_result=$("#tutor_result_template").clone(true);
			$one_result.find(".tutor_subjects").text("授课类型："+data[i].subjects);
			$one_result.find(".tutor_description").text("老师简介："+data[i].description);
			$tabContent.append($one_result);
		}
		else if(data[i].type=="学生")
		{
			$one_result=$("#stu_result_template").clone(true);
			$one_result.find(".stu_grade").text("年级："+data[i].grade);
			$tabContent.append($one_result);
		}
		$one_result.find(".name").text(data[i].name);
		$one_result.find(".user_point").text("积分"+data[i].point);
		$one_result.find(".user_img").css("background-image","url(\"../headimg/"+data[i].headimg+"\")");
	}
	add_btn_group_users($tabContent,resultNum,activeNO);
	//alert($factorsMap.get("tab_6").user_name);
}

function get_seatchUserFactors()
{
	var $factors=new searchFactors();
	$factors.user_name=$("#searchUserInput").val();
	return $factors;
}

function add_btn_group_users($tabContent,resultNum,activeNO)
{
	var $btnGroup=$('<div class="btn-group search" style=""></div>');
	var pageNum=Math.ceil(resultNum/10);
	for(var i=1;i<=pageNum;i++)
	{
		var $tempBtn;
		if(i==activeNO)
		{
			$tempBtn=$('<a class="btn btn-link active" href="javascript:void(0)" onclick="changeUserResultPage(this);"></a>');
		}
		else
		{
			$tempBtn=$('<a class="btn btn-link unactive" href="javascript:void(0)" onclick="changeUserResultPage(this);"></a>');
		}
		$tempBtn.text(i+"");
		$btnGroup.append($tempBtn);
	}
	$tabContent.append($btnGroup);
}

function changeUserResultPage(targetA)
{
	var $tabContent=$(targetA).parent().parent();
	var pageNO=$.trim($(targetA).text());
	$tabContent.empty();
	var $factors=$factorsMap.get($tabContent.attr("id"));
	searchAction.getUserResultNum($factors,function myCallBack(resultNum)
	{
		searchAction.getUserResult($factors,pageNO,function myCallBack(data)
		{
			handleSearchUserCallBack(data,$tabContent,resultNum,pageNO);
		});
	
	});
}

function HashMap()
{
    /** Map 大小 **/
    var size = 0;
   /** 对象 **/
   var entry = new Object();
  
   /** 存 **/
    this.put = function (key , value)
     {
       if(!this.containsKey(key))
       {
           size ++ ;
      }
      entry[key] = value;
   }
  
  /** 取 **/
    this.get = function (key)
   {
       return this.containsKey(key) ? entry[key] : null;
    }
   
   /** 删除 **/
  this.remove = function ( key )
  {
       if( this.containsKey(key) && ( delete entry[key] ) )
      {
           size --;
        }
    }
   
    /** 是否包含 Key **/
    this.containsKey = function ( key )
   {
        return (key in entry);
   }
    
   /** 是否包含 Value **/
   this.containsValue = function ( value )
    {
        for(var prop in entry)
       {
           if(entry[prop] == value)
           {
               return true;
           }
       }
        return false;
    }
   
    /** 所有 Value **/
   this.values = function ()
   {
       var values = new Array();
       for(var prop in entry)
       {
           values.push(entry[prop]);
       }
       return values;
    }
   
   /** 所有 Key **/
    this.keys = function ()
   {
       var keys = new Array();
       for(var prop in entry)
       {
           keys.push(prop);
       }
       return keys;
   }

   /** Map Size **/
    this.size = function ()
   {
        return size;
   }
   
  /* 清空 */
   this.clear = function ()
  {
        size = 0;
        entry = new Object();
   }
}