package com.tutoring.biz;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.tutoring.entity.User;

public class SessionMaintainBizImpl implements SessionMaintainBiz {
	@Autowired
	private Map<String, Object> session;
	CourseBiz courseBiz;
	UserBiz userBiz;
	

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}

	@Override
	public void updateCourse() {
		// TODO Auto-generated method stub
		System.out.println("in updateCourse");
		ActionContext ac = ActionContext.getContext();
		session = ac.getSession();
		List<?> myCourses = courseBiz.getMyCourses();
		session.put("mycourses", myCourses);
	}

	@Override
	public void updateUser() {
		// TODO Auto-generated method stub
		System.out.println("before user info:");
		ActionContext ac = ActionContext.getContext();
		session = ac.getSession();
		User user = userBiz.getUserInfo(((User)session.get("user")).getEmail());
		System.out.println("user info:"+user.getEmail());
		session.put("user", user);
	}

}
