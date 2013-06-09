package com.tutoring.action;

import com.tutoring.biz.CourseBiz;

public class DeleteCourseAction {
	CourseBiz courseBiz;

	public void setCourseBiz(CourseBiz courseBiz) {
		this.courseBiz = courseBiz;
	}
	
	public String deleteCourse(int courseid){
		System.out.println("before delete");
		courseBiz.deleteCourse(courseid);
		System.out.println("after delete");
		return "ok";
	}
}
