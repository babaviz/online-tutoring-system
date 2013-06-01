package com.tutoring.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.biz.StudentBiz;
import com.tutoring.entity.User;


public class ApplyCourseAction{
	
	StudentBiz studentBiz;
	
	public void setStudentBiz(StudentBiz studentBiz) {
		this.studentBiz = studentBiz;
	}

	public String applyForCourse(int courseid){
		ActionContext ac = ActionContext.getContext();
		Map<String,Object> session = ac.getSession();
		User user = (User) session.get("user");
		studentBiz.addApplyCourse(user , courseid);
		return "ok";
	}

}
