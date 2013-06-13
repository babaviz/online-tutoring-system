package com.tutoring.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tutoring.biz.CourseBiz;
import com.tutoring.entity.User;

public class CourseMessageAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	CourseBiz courseBiz;
	
	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}

	public String execute() throws Exception{
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User) session.get("user");
		ac.put("noticelist", courseBiz.getCourseNoticeList(user));
		return SUCCESS;
	}

}
