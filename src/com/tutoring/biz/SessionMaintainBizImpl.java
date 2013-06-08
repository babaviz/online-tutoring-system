package com.tutoring.biz;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;

public class SessionMaintainBizImpl implements SessionMaintainBiz {
	@Autowired
	private HttpSession session;
	CourseBiz courseBiz;

	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}

	@Override
	public void updateCourse() {
		// TODO Auto-generated method stub
		System.out.println("in updateCourse");
		ActionContext ac = ActionContext.getContext();
		Map<String, Object> session = ac.getSession();
		List<?> myCourses = courseBiz.getMyCourses();
		session.put("mycourses", myCourses);
	}

}
