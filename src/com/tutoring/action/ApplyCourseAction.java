package com.tutoring.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.biz.StudentBiz;
import com.tutoring.biz.TutorBiz;
import com.tutoring.entity.Tutor;
import com.tutoring.entity.User;


public class ApplyCourseAction{
	
	StudentBiz studentBiz;
	TutorBiz tutorBiz;
	

	public void setTutorBiz(TutorBiz tutorBiz) {
		this.tutorBiz = tutorBiz;
	}

	public void setStudentBiz(StudentBiz studentBiz) {
		this.studentBiz = studentBiz;
	}

	public String applyForCourse(int courseid,int tutorid){
		ActionContext ac = ActionContext.getContext();
		Map<String,Object> session = ac.getSession();
		User user = (User) session.get("user");
		//System.out.println(tutorid);
		Tutor tutor = tutorBiz.getTutor(tutorid);
		User recieveuser = tutor.getUser();
		//System.out.println(user.getFirstName());
		studentBiz.addApplyCourse(user ,recieveuser, courseid);
		
		return "ok";
	}

}
