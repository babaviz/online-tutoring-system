// JavaScript Document

function createTab()
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
	
	var $y=$("#tabContentTemplate").clone(true);
	//$y.css("display","block");
	$y.attr("id","tab_"+$tabNO);
	$y.find("p").text("xxx"+$tabNO+"zzz");
	$("#myTabContent").append($y);
	
	$x.find("a").tab('show');
}

function delTab(e)
{
	$x=$(event.target).parent();
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

function selectCategory(e)
{
	//$x=$(event.target);
	$selectedCategory.removeClass("activecourse");
	$(event.target).addClass("activecourse");
	$selectedCategory=$(event.target);
}

function customizedFunc()
{
	//alert("here is executed on loading");
	$selectedCategory=$("#course_list div:eq(0)");
	$tabNO=5;
}