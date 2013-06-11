package com.tutoring.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.bean.UnhandleCourse;
import com.tutoring.biz.CourseBiz;
import com.tutoring.entity.User;

public class CourseManageAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Timestamp time;
	
	CourseBiz courseBiz; 
	
	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}

	public String execute() throws Exception{
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User)session.get("user");
		
		time = new Timestamp((new Date()).getTime());
		
		if(user.getType()=='2')
		{
			List<UnhandleCourse> l = courseBiz.getUnhandleCourseInfoList(user.getTutor().getCourses());
			System.out.println("unhandlesize:"+l.size());
			ac.put("unhandlecourses", l);
			return "tutor";
		}
		else if(user.getType()=='1')
		{
			return "student";
		}
		else
			return ERROR;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
}
