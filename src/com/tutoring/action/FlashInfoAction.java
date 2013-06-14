package com.tutoring.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.biz.CourseBiz;
import com.tutoring.biz.UserBiz;
import com.tutoring.entity.Course;
import com.tutoring.entity.User;

public class FlashInfoAction {
	CourseBiz courseBiz;
	UserBiz userBiz;
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}
	public String getClassInfo(int courseid){
		String info="";
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		User user = (User) session.get("user");
		info += user.getEmail();
		Course c = courseBiz.getCourseById(courseid);
		if(userBiz.isStudent(user.getEmail())){
			info += " student ";
		}
		else
			info += " tutor ";
		info+=c.getFlash_sn();
		return info;
	}
}
